<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xhtml" omit-xml-declaration="yes" html-version="5.0"/>

<xsl:template match="/">
    <html>
        <head>
            <title>Data Pull from the Sonnets File</title>
        </head>
        <body>
            <h1><xsl:apply-templates select="//titleStmt/title"/></h1>
           <ul> <xsl:apply-templates select="//body/div//head//title"/></ul>
        </body>
    </html>
</xsl:template>
    
<xsl:template match="head/title">
    <li><xsl:apply-templates/></li>
    
</xsl:template> 
    
    <xsl:template match="note">
        
    </xsl:template>
    
    
</xsl:stylesheet>