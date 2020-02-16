<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>
   <!--2018-09-25 ebb: This is stage 2 of structural revisions to the Watlington Hill encoding. Here we remove app elements that represent where the two witnesses are already aligned so we simplify the encoding. 
       We may also relocate sections of the poem (in lg elements) that are represented only in one reading witness. These are currently encoded with <app> elements inside every <l> element. We move them with this XSLT to have just one app element surrounding the entire lg, holding its corresponding rdg witness. -->
    <xsl:template match="app[rdg[contains(@wit, '#WH1812 #WH1827')]]">
        <xsl:apply-templates/>
        
    </xsl:template>
    <xsl:template match="rdg[contains(@wit, '#WH1812 #WH1827')]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="lg[count(distinct-values(descendant::rdg/@wit )) = 1]">
        <app>
           <rdg wit="{descendant::rdg[1]/@wit}">
              <lg type="section">
                  <xsl:apply-templates/>
              </lg>
           </rdg>  
        </app>
        
    </xsl:template>
    
    <xsl:template match="app[ancestor::lg[count(distinct-values(descendant::rdg/@wit )) = 1]]">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="rdg[ancestor::lg[count(distinct-values(descendant::rdg/@wit )) = 1]]">
        <xsl:apply-templates/>
    </xsl:template>
    

</xsl:stylesheet>