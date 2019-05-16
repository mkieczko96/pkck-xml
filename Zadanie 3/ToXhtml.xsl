<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
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
                <table>
                    <tr>
                        <td> Tytył książki </td>
                        <td> Autor </td>
                        <td> Kategoria </td>
                        <td> Wydawnictwo </td>
                        <td> Cena </td>
                        <td> Liczba stron </td>
                        <td> ISBN </td>
                        <td> Data wydania </td>
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
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="category"/></td>
            <td><xsl:value-of select="publisher"/></td>
            <td><xsl:value-of select="price"/></td>
            <td><xsl:value-of select="page_count"/></td>
            <td><xsl:value-of select="isbn"/></td>
            <td><xsl:value-of select="release_date"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>


