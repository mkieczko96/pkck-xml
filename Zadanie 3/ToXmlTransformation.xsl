<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ex="http://exslt.org/dates-and-times" extension-element-prefixes="ex">

    <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:key name="categoriesKey" match="library/book/category" use="."/>

    <xsl:template match="/">

        <bookstore>
            <creators>
                <xsl:for-each select="library/document-authors">
                    <xsl:for-each select="document-author">
                        <creator>
                            <name><xsl:value-of select="lastname"/>, <xsl:value-of select="firstname"/>
                            </name>
                            <index>
                                <xsl:value-of select="index"/>
                            </index>
                            <e-mail>
                                <xsl:value-of select="e-mail"/>
                            </e-mail>
                            <study>Wydzial <xsl:value-of select="department"/>, <xsl:value-of select="faculty"/>, <xsl:value-of select="major"/>
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
                                <xsl:value-of
                                        select="concat(ancestor::*/author[attribute::authorID = $idref]/lastname, ', ', ancestor::*/author[attribute::authorID = $idref]/firstname)"/>
                                <xsl:if test="position() != last()">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </author>
                        <isbn>
                            <xsl:value-of select="substring-after(@bookID, 'ID')"/>
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
                <xsl:attribute name="booksCount">
                    <xsl:value-of select="count(library/book)"/>
                </xsl:attribute>
                <xsl:attribute name="authorsCount">
                    <xsl:value-of select="count(library/author)"/>
                </xsl:attribute>

                <categories>
                    <xsl:for-each
                            select="library/book/category[generate-id() = generate-id(key('categoriesKey', .)[1])]">
                        <xsl:variable name="catName">
                            <xsl:choose>
                                <xsl:when test="contains(., ' ')">
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="."/>
                                        <xsl:with-param name="replace" select="' '"/>
                                        <xsl:with-param name="by" select="'_'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="."/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>

                        <xsl:element name="{$catName}">
                            <xsl:attribute name="booksCount">
                                <xsl:variable name="cate">
                                    <xsl:call-template name="replace">
                                        <xsl:with-param name="text" select="$catName"/>
                                        <xsl:with-param name="replace" select="'_'"/>
                                        <xsl:with-param name="by" select="' '"/>
                                    </xsl:call-template>
                                </xsl:variable>

                                <xsl:value-of select="count(/library/book[category=$cate])"/>
                            </xsl:attribute>
                        </xsl:element>

                    </xsl:for-each>
                </categories>
                <date_generated>
                    <xsl:value-of
                            select="concat(substring-before(ex:date-time(), 'T'), ' ', substring-before(substring-after(ex:date-time(), 'T'), '+'))"/>
                </date_generated>
            </summary>

        </bookstore>

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
