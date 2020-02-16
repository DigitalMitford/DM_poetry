<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">

    <xsl:mode on-no-match="shallow-copy"/>
   <!--2018-09-25 ebb: ID Transform to change elements in prep for migrating <app> elements to enclose line groups or sections. In the body of the poem, this will change <div> elements into <lg> elements and <head> children of those <div> elements into <label> elements. lg/label can then be nested inside app/rdg (as div/head may not be). -->
     <xsl:template match="body/div">
         <lg type="{@type}">
             <xsl:apply-templates/>
         </lg>
     </xsl:template>
    <xsl:template match="body/div/head">
        <label><xsl:apply-templates/></label>
    </xsl:template>

</xsl:stylesheet>