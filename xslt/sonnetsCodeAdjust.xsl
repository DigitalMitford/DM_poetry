<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="p[descendant::pb]">
        <fw type="pageNum"><xsl:apply-templates/></fw>
    </xsl:template>
    
    <xsl:template match="p[lb]">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    
    <xsl:template match="p[l]">
        <lg><xsl:apply-templates/></lg>
    </xsl:template>
    
    <xsl:template match="l">
        <l n="{count(preceding-sibling::l) + 1}">
            <xsl:apply-templates/>
        </l>
    </xsl:template>
   
    
</xsl:stylesheet>