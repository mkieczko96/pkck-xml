<?xml version="1.0"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml"/>

    <xsl:template match="/">

        <bookstore>
            <creators>
                <xsl:for-each select="library/document-authors">
                    <xsl:for-each select="document-author">
                        <creator>
                            <name><xsl:value-of select="lastname"/>,
                                <xsl:value-of select="firstname"/>
                            </name>
                            <index>
                                <xsl:value-of select="index"/>
                            </index>
                            <e-mail>
                                <xsl:value-of select="e-mail"/>
                            </e-mail>
                            <study>Wydzial <xsl:value-of select="department"/>, <xsl:value-of select="faculty"/>,
                                <xsl:value-of select="major"/>
                            </study>
                        </creator>
                    </xsl:for-each>
                </xsl:for-each>
            </creators>

            <library>
                <xsl:for-each select="library/book">
                    <xsl:sort select="category" order="ascending" data-type="text"/>
                    <xsl:sort select="title" order="ascending" data-type="text"/>
                    <book>
                        <title>
                            <xsl:value-of select="title"/>
                        </title>
                        <category>
                            <xsl:value-of select="category"/>
                        </category>
                        <author>
                            <xsl:for-each select="attribute::authorIDREF">
                                <xsl:variable name="idref" select="."/>
                                <xsl:value-of select="concat(ancestor::*/author[attribute::authorID = $idref]/lastname, ', ', ancestor::*/author[attribute::authorID = $idref]/firstname)"/>
                                <xsl:if test="position() != last()">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </author>
                        <isbn>
                            <xsl:value-of select="attribute::bookID"/>
                        </isbn>
                        <price>
                            <xsl:attribute name="currency">PLN</xsl:attribute>
                            <xsl:value-of select="price"/>
                        </price>
                        <release_date>
                            <xsl:value-of select="release_date"/>
                        </release_date>
                        <page_count>
                            <xsl:value-of select="page_count"/>
                        </page_count>
                        <publisher>
                            <xsl:value-of select="publisher"/>
                        </publisher>
                    </book>
                </xsl:for-each>
            </library>

            <summary>
                <date_generated></date_generated>
                <statistics>
                    <books_per_category>

                    </books_per_category>
                    <!-- ile książek w każdej z kategorii, średnia cena książek w kategorii, lista autorów w kategorii -->
                </statistics>
            </summary>

        </bookstore>

    </xsl:template>

</xsl:stylesheet>

        <!--

            Wyświetlać dane autora przy każdej książce (wiązanie ID - IDREF)

            Posortować ksiązki gatunkami i alfabetycznie wewnątrz kategorii

            Na końcu raportu wygenerować:
                - liczbę elementów (ile książek i ilu autorów)
                - liczbę kategorii książek
                - sumy częściowe/total - zsumować ceny książek? dodać liczenie podatku vat od cen książek?
                - datę wygenerowania dokumentu
        -->