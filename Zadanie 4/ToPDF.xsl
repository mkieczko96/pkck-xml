<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <!-- PDF page structure -->
    <xsl:template match="bookstore">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="page"
                                       page-height="29.7cm"
                                       page-width="21cm"
                                       margin-top="1.5cm"
                                       margin-bottom="2cm"
                                       margin-left="1.5cm"
                                       margin-right="1.5cm">
                    <fo:region-body margin-top="1cm"/>
                    <fo:region-before extent="0cm"/>
                    <fo:region-after extent="0cm"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="all">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference
                                master-reference="page" page-position="first"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>

            <fo:page-sequence master-reference="page">
                <fo:static-content flow-name="xsl-region-before">
                    <fo:block>
                        <fo:inline color="grey">
                            <xsl:value-of select="summary/date_generated"/>
                        </fo:inline>
                    </fo:block>
                </fo:static-content>
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block>
                        <fo:inline color="grey">
                            <fo:page-number/>
                        </fo:inline>
                    </fo:block>
                </fo:static-content>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block space-before="2cm"
                              space-after="2cm">
                        <xsl:apply-templates select="creators"/>
                    </fo:block>
                    <fo:block text-align="center"
                              font-size="24pt"
                              space-after="0.5cm">
                        Statystyki
                    </fo:block>
                    <fo:block space-after="2cm">
                        <xsl:apply-templates select="summary"/>
                    </fo:block>
                    <fo:block text-align="center"
                              font-size="24pt"
                              space-after="0.5cm">
                        Zbior ksiazek
                    </fo:block>
                    <fo:block>
                        <xsl:apply-templates select="library"/>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>

    <!-- How to process xml tags -->
    <xsl:template match="creators">
        <fo:table table-layout="auto">
            <fo:table-column column-width="50%"/>
            <fo:table-column column-width="50%"/>
            <fo:table-body>
                <xsl:apply-templates select="creator"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="creator">
        <fo:table-cell>
            <fo:block>
                <xsl:value-of select="name"/>
            </fo:block>
            <fo:block>
                <xsl:value-of select="e-mail"/>
            </fo:block>
            <fo:block>
                <xsl:value-of select="study"/>
            </fo:block>
        </fo:table-cell>
    </xsl:template>

    <xsl:template match="library">
        <fo:table table-layout="auto" border-width="1mm" border-style="solid">
            <fo:table-column column-width="20%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-header text-align="center" background-color="silver">
                <fo:table-row>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                        <fo:block font-weight="bold">
                            Tytuł
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                        <fo:block font-weight="bold">
                            Autor
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                        <fo:block font-weight="bold">
                            Il. stron
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                        <fo:block font-weight="bold">
                            Wydawca
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                        <fo:block font-weight="bold">
                            Cena
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:apply-templates select="book"/>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template match="book">
        <fo:table-row>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                <fo:block font-weight="bold">
                    <xsl:value-of select="title"/>
                </fo:block>
                <fo:block font-size="8pt" font-style="italic">
                    (<xsl:value-of select="isbn"/>)
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="author"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="page_count"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="publisher"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                <fo:block>
                    <xsl:value-of select="price"/>
                    <fo:character character=" "/>
                    <xsl:value-of select="price/@currency"/>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="summary">
        <fo:table table-layout="auto">
            <fo:table-column column-width="25%"/>
            <fo:table-column column-width="25%"/>
            <fo:table-column column-width="25%"/>
            <fo:table-column column-width="25%"/>
            <fo:table-header >
                <fo:table-row>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid" text-align="center" background-color="silver">
                        <fo:block font-weight="bold">
                            Kategoria
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding="1mm" border-width="1mm" border-style="solid" text-align="center" background-color="silver">
                        <fo:block font-weight="bold">
                            L. ksiazek
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell>
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-header>
            <fo:table-body>
                <xsl:for-each select="categories/*">
                    <xsl:sort select="./@booksCount" order="descending" data-type="number"/>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block/>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                            <fo:block font-weight="bold">
                                <xsl:call-template name="replace">
                                    <xsl:with-param name="text" select="name(.)"/>
                                    <xsl:with-param name="replace" select="'_'"/>
                                    <xsl:with-param name="by" select="' '"/>
                                </xsl:call-template>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" border-width="1mm" border-style="solid">
                            <fo:block font-weight="bold">
                                <xsl:value-of select="@booksCount"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell>
                            <fo:block/>
                        </fo:table-cell>
                    </fo:table-row>
                </xsl:for-each>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template name="replace">
        <xsl:param name="text"/>
        <xsl:param name="replace"/>
        <xsl:param name="by"/>
        <xsl:choose>
            <xsl:when test="$text = '' or $replace = ''or not($replace)">
                <!-- Prevent this routine from hanging -->
                <xsl:value-of select="$text"/>
            </xsl:when>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)"/>
                <xsl:value-of select="$by"/>
                <xsl:call-template name="replace">
                    <xsl:with-param name="text" select="substring-after($text,$replace)"/>
                    <xsl:with-param name="replace" select="$replace"/>
                    <xsl:with-param name="by" select="$by"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
