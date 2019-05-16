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
            <body>
                <h1>
                    Księgarnia
                </h1>
                <xsl:for-each select="bookstore">
                    <xsl:apply-templates select="summary"/>
                </xsl:for-each>
                <table>
                    <tr>
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
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <td>
                <xsl:value-of select="title"/>
            </td>
            <td>
                <xsl:value-of select="author"/>
            </td>
            <td>
                <xsl:value-of select="category"/>
            </td>
            <td>
                <xsl:value-of select="publisher"/>
            </td>
            <td>
                <xsl:value-of select="price"/>
            </td>
            <td>
                <xsl:value-of select="page_count"/>
            </td>
            <td>
                <xsl:value-of select="isbn"/>
            </td>
            <td>
                <xsl:value-of select="release_date"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="summary">
        <table>
            <caption>Statystyki</caption>
            <tr>
                <th>Kategoria</th>
                <th>Liczba książek</th>
            </tr>
            <xsl:for-each select="categories/*">
                <tr>
                    <td>
                        <xsl:call-template name="replace">
                            <xsl:with-param name="text" select="name(.)"/>
                            <xsl:with-param name="replace" select="'_'"/>
                            <xsl:with-param name="by" select="' '"/>
                        </xsl:call-template>
                    </td>
                    <td><xsl:value-of select="@booksCount"/></td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>

</xsl:stylesheet>


