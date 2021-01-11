<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:meta="urn:oasis:names:tc:opendocument:xmlns:meta:1.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//dc:title/text()"/>
                        </title>
                        <author>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Auteur']/text()"/>
                        </author>
                    </titleStmt>
                    <publicationStmt>
                        <authority/>
                        <availability>
                            <p>
                                <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Licence']/text()"/>
                            </p>
                        </availability>
                        <date>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Date de publication']/text()"/>
                        </date>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Source']/text()"/>
                        </bibl>
                    </sourceDesc>
                </fileDesc>
                <profileDesc>
                    <creation>
                        <date>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Date de la source']/text()"/>
                        </date>
                    </creation>
                </profileDesc>
                <encodingDesc>
                    <projectDesc>
                        <p>
                            <xsl:copy-of select="document('input/Madame-Bovary/meta.xml')//meta:user-defined[@meta:name='Description']/text()"/>
                        </p>
                    </projectDesc>
                </encodingDesc>
            </teiHeader>
            <text>
                <xsl:apply-templates select="//office:body/office:text"/>                
            </text>
        </TEI>
    </xsl:template>
  
    <xsl:template match="//office:body/office:text" xmlns="http://www.tei-c.org/ns/1.0">
        <front>
            <docTitle>
                <titlePart>
                    <xsl:value-of select="text:p[@text:style-name='Title']/data()"/>
                </titlePart>
            </docTitle>
        </front>
        <body>
        <xsl:for-each select="text:p[@text:style-name='Title']/following-sibling::*">
            <xsl:if test="name() = 'text:h' and @text:style-name='Heading_20_1'">
                <xsl:if test="position() != 1"> 
                    <xsl:text disable-output-escaping="yes">&lt;/div&gt;&lt;/div&gt;</xsl:text>
                </xsl:if>
                <xsl:text disable-output-escaping="yes">&lt;div n="1"&gt;</xsl:text>
                <head>
                    <xsl:apply-templates/>
                </head>
            </xsl:if>
            <xsl:if test="name()='text:h' and @text:style-name='Heading_20_2'">
                <xsl:if test="preceding-sibling::text:h[1]/@text:style-name!='Heading_20_1'"> 
                    <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
                </xsl:if>
                <xsl:text disable-output-escaping="yes">&lt;div n="2"&gt;</xsl:text>
                    <head>
                        <xsl:apply-templates/>
                    </head>
                </xsl:if>
            <xsl:if test="name()='text:p' and @text:style-name='citation'">
                <quote>
                    <xsl:apply-templates/>
                </quote>
            </xsl:if>
            <xsl:if test="name()='text:p' and @text:style-name='Text_20_body'">
                <p>
                    <xsl:apply-templates/>
                </p>
                 <xsl:if test="position()=last()">                   
                     <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
                     <xsl:if test="exists(//text:h[@text:style-name='Heading_20_1'])">                   
                         <xsl:text disable-output-escaping="yes">&lt;/div&gt;</xsl:text>
                     </xsl:if>
                 </xsl:if>
             </xsl:if>
        </xsl:for-each>
        </body>
    </xsl:template>
    
    <xsl:template match="//text:span" xmlns="http://www.tei-c.org/ns/1.0">
        <xsl:if test= '@text:style-name="gras"'>
            <hi rend="bold">
                <xsl:apply-templates/>
            </hi>
        </xsl:if>
        <xsl:if test= '@text:style-name="italique"'>
            <hi rend="italic">
                <xsl:apply-templates/>
            </hi>
        </xsl:if>      
    </xsl:template>
  
</xsl:stylesheet>