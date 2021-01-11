<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"/>
<xsl:template match="/"> 
    <h1 align="center">
            <xsl:value-of select="//titre/text()"/>
            <br/>
    </h1>
    <h3 align="right">
        <xsl:value-of select="//auteur/text()"/>
        <br/>
        <br/>
    </h3>
    <xsl:apply-templates select="//body"/>
    <xsl:apply-templates select="//conclusion"/>
    <div align="center">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="//image"/>
            </xsl:attribute>
        </img>
    </div>
</xsl:template>
    
<xsl:template match="//body">
   <xsl:apply-templates/>
</xsl:template>
    
<xsl:template match="//div[@n='1']/head">
    <br/>
    <h2 align="center">
        <xsl:value-of select="."/>
    </h2>
    <br/>  
</xsl:template>

<xsl:template match="//div[@n='2']/head">
    <h4 align="center">
        <xsl:value-of select="."/>
    </h4>
    <br/>   
</xsl:template>
    
<xsl:template match="//gras">
    <b>
        <xsl:apply-templates/>
    </b>
</xsl:template>
    
<xsl:template match="//lien">
    <a>
        <xsl:attribute name="href">
            <xsl:value-of select="@url"/>
        </xsl:attribute>
        <xsl:apply-templates/>
    </a>
</xsl:template>
    
<xsl:template match="//liste">
    <ul>
        <xsl:for-each select="l">
            <li>
                <xsl:apply-templates/>
            </li>
        </xsl:for-each>
    </ul>
</xsl:template>
    
<xsl:template match="//p">
    <p>
        <xsl:apply-templates/>
    </p>
</xsl:template>
    
<xsl:template match="//conclusion">
    <h2 align="center">
        <xsl:value-of select="head/text()"/>
    </h2>
    <xsl:apply-templates select="p"/>
</xsl:template>

</xsl:stylesheet>