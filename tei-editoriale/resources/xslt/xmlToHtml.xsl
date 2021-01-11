<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei" version="2.0"><!-- <xsl:strip-space elements="*"/>-->
    <xsl:param name="ref"/><!--
##################################
### Page layout and structure ###
##################################
-->
    <xsl:template match="/">
        <div class="page-header">
            <h2 align="center">
                <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:title">
                    <xsl:value-of select="."/>
                    <br/>
                </xsl:for-each>
            </h2>
        </div>
        <div class="regest">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <h2 align="center">Info</h2>
                    </h3>
                </div>
                <div class="panel-body">
                    <table class="table table-striped">
                        <tbody>
                            <tr>
                                <th>
                                    <abbr title="tei:titleStmt/tei:title">Titre</abbr>
                                </th>
                                <td>
                                    <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:title">
                                        <xsl:apply-templates/>
                                        <br/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <abbr title="tei:titleStmt/tei:author">Auteur</abbr>
                                </th>
                                <td>
                                    <xsl:for-each select="//tei:fileDesc/tei:titleStmt/tei:author">
                                        <xsl:apply-templates/>
                                        <br/>
                                    </xsl:for-each>
                                </td>
                            </tr>

                            <tr>
                                <th>
                                    <abbr title="//tei:availability//tei:p[1]">Licence</abbr>
                                </th>
                                <td>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:apply-templates select="//tei:licence/@target"/>
                                        </xsl:attribute>
                                        <xsl:apply-templates select="//tei:availability//tei:p[1]"/>
                                    </xsl:element>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <abbr title="tei:titleStmt/tei:author">Date de publication</abbr>
                                </th>
                                <td>
                                    <xsl:for-each select="//tei:publicationStmt//tei:date">
                                        <xsl:apply-templates/>
                                        <br/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <abbr title="tei:sourceDesc/tei:bibl">Source</abbr>
                                </th>
                                <td>
                                    <xsl:element name="a">
                                        <xsl:attribute name="href">
                                            <xsl:apply-templates select="//tei:source/@target"/>
                                        </xsl:attribute>
                                        <xsl:apply-templates select="//tei:sourceDesc/tei:bibl"/>
                                    </xsl:element>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <abbr title="tei:profileDesc/tei:creation/tei:date">Date de la source</abbr>
                                </th>
                                <td>
                                    <xsl:for-each select="//tei:profileDesc/tei:creation/tei:date">
                                        <xsl:apply-templates/>
                                        <br/>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="panel-footer">
                        <p style="text-align:center;">
                            <a id="link_to_source"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                    <h2 align="center">
                        Transcription
                    </h2>
                </h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-4">
                        <h4>
                            Navigation
                        </h4>
                            <xsl:choose>
                                <xsl:when test="//tei:div[@n='1']">
                                    <xsl:for-each select="//tei:body/tei:div[@n='1']/tei:head">
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:text>#text_</xsl:text>
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                            <xsl:attribute name="id">
                                                <xsl:text>nav_</xsl:text>
                                                <xsl:value-of select="."/>
                                            </xsl:attribute>
                                            <xsl:value-of select="."/>
                                        </xsl:element>
                                        <xsl:element name="ul">
                                            <xsl:for-each select="parent::*/tei:div[@n='2']/tei:head">
                                                <xsl:element name="li">
                                                    <xsl:element name="a">
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#text_</xsl:text>
                                                            <xsl:value-of select="."/>
                                                        </xsl:attribute>
                                                        <xsl:attribute name="id">
                                                            <xsl:text>nav_</xsl:text>
                                                            <xsl:value-of select="."/>
                                                        </xsl:attribute>
                                                        <xsl:value-of select="."/>
                                                    </xsl:element>
                                                </xsl:element>
                                            </xsl:for-each>
                                        </xsl:element>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="ul">
                                        <xsl:for-each select="//tei:div[@n='2']/tei:head">
                                            <xsl:element name="li">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="href">
                                                        <xsl:text>#text_</xsl:text>
                                                        <xsl:value-of select="."/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="id">
                                                        <xsl:text>nav_</xsl:text>
                                                        <xsl:value-of select="."/>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="."/>
                                                </xsl:element>
                                            </xsl:element>
                                        </xsl:for-each>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                    </div>
                    <div class="col-md-8">
                        <p>
                            <xsl:choose>
                                <xsl:when test="//tei:div[@type='text']">
                                    <xsl:apply-templates select="//tei:div[@type='text']"/>
                                </xsl:when>
                                <xsl:when test="//tei:div[@type='transcript']">
                                    <xsl:apply-templates select="//tei:div[@type='transcript']"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:apply-templates select="//tei:body"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </p>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                // creates a link to the xml version of the current document available via eXist-db's REST-API
                var params={};
                window.location.search
                .replace(/[?&amp;]+([^=&amp;]+)=([^&amp;]*)/gi, function(str,key,value) {
                params[key] = value;
                }
                );
                var path = window.location.origin+window.location.pathname;
                var replaced = path.replace("exist/apps/", "exist/rest/db/apps/");
                current_html = window.location.pathname.substring(window.location.pathname.lastIndexOf("/") + 1)
                var source_dokument = replaced.replace("pages/"+current_html, "data/editions/"+params['document']);
                console.log(source_dokument)
                $( "#link_to_source" ).attr('href',source_dokument);
                $( "#link_to_source" ).text(source_dokument);
            </script>
        </div>
    </xsl:template><!--
    #####################
    ###  Formating ###
    #####################
--><!-- Headings -->
    <xsl:template match="tei:head">
        <xsl:choose>
            <xsl:when test="parent::*/@n='1'">
                <xsl:element name="h3">
                    <xsl:element name="a">
                        <xsl:attribute name="id">
                            <xsl:text>text_</xsl:text>
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                        <xsl:attribute name="href">
                            <xsl:text>#nav_</xsl:text>
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                        <xsl:apply-templates/>
                    </xsl:element>
                </xsl:element>
            </xsl:when>
        <xsl:otherwise>
            <xsl:element name="h4">
                <xsl:element name="a">
                    <xsl:attribute name="id">
                        <xsl:text>text_</xsl:text>
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:attribute name="href">
                        <xsl:text>#nav_</xsl:text>
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                    <xsl:apply-templates/>
                </xsl:element>
            </xsl:element> 
        </xsl:otherwise>
    </xsl:choose>
    </xsl:template><!--  Quotes -->
    <xsl:template match="tei:hi[@rend='italic']">
        <xsl:element name="i">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!--  Bold -->
    <xsl:template match="tei:hi[@rend='bold']">
        <xsl:element name="b">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template><!-- Paragraphs    -->
    <xsl:template match="tei:p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>