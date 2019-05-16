<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="ToXmlTransformation.xsl"/>
    <xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
                doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    Księgarnia
                </title>
            </head>
            <body bgcolor="#FEEED7">
                <h1 align="center">
                    Księgarnia
                </h1>

                <xsl:for-each select="bookstore">
                    <xsl:apply-templates select="summary"/>
                </xsl:for-each>

                <br/><br/>

                <table width="100%" border="2m">
                    <caption><b><i><h3>Zbiór książek</h3></i></b></caption>
                    <tr bgcolor="#CABDAB">
                        <th>Tytył książki</th>
                        <th>Autor</th>
                        <th>Kategoria</th>
                        <th>Wydawnictwo</th>
                        <th>Cena</th>
                        <th>Liczba stron</th>
                        <th>ISBN</th>
                        <th>Data wydania</th>
                    </tr>
                    <xsl:for-each select="bookstore/library">
                        <xsl:apply-templates select="book"/>
                    </xsl:for-each>
                </table>

                <br/><br/>

                <xsl:for-each select="bookstore/creators">
                    <table align="center" width="50%" border="2m">
                        <tr>
                            <xsl:apply-templates select="creator"/>
                        </tr>
                    </table>
                </xsl:for-each>

                <br/>

                <p>
                    Stan na dzień :
                    <xsl:value-of select="bookstore/summary/date_generated"/>
                </p>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>

                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="category"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="publisher"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="price"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="price/@currency"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="page_count"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="isbn"/>
            </td>
            <td>
                <xsl:attribute name="align">center</xsl:attribute>
                <xsl:value-of select="release_date"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="summary">
        <table border="2m">
            <xsl:attribute name="align">center</xsl:attribute>
            <caption><b><i><h3>Statystyki</h3></i></b></caption>
            <tr bgcolor="#CABDAB">
                <th>Kategoria</th>
                <th>Liczba książek</th>
            </tr>
            <xsl:for-each select="categories/*">
                <xsl:sort select="./@booksCount" order="descending" data-type="number"/>
                <tr>
                    <td>
                        <xsl:attribute name="align">center</xsl:attribute>
                        <xsl:call-template name="replace">
                            <xsl:with-param name="text" select="name(.)"/>
                            <xsl:with-param name="replace" select="'_'"/>
                            <xsl:with-param name="by" select="' '"/>
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:attribute name="align">center</xsl:attribute>
                        <xsl:value-of select="@booksCount"/>
                    </td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template match="creator">
                <td>
                    <xsl:attribute name="align">center</xsl:attribute>
                    <xsl:value-of select="name"/><br/>
                    <xsl:value-of select="index"/><br/>
                    <xsl:value-of select="e-mail"/><br/>
                    <xsl:value-of select="study"/>
                </td>
    </xsl:template>

</xsl:stylesheet>


