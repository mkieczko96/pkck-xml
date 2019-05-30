<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" indent="yes" omit-xml-declaration="yes"/>
<xsl:strip-space elements="*"/>
<xsl:template match="bookstore">
# Księgarnia
<xsl:apply-templates select="summary"/>
### Zbiór książek na dzień <xsl:value-of select="summary/date_generated"/>

| Tytuł | Autor | Kategoria | Wydawnictwo | Cena | Liczba stron | Data wydania |
|:---|:---|:---|:---|:---:|:---:|---:|
<xsl:for-each select="library"><xsl:apply-templates select="book"/>
</xsl:for-each>

<xsl:for-each select="creators">
### Twórcy

<xsl:apply-templates select="creator"/>
</xsl:for-each>
</xsl:template>

<xsl:template match="summary">
###  Statystyki
| Kategoria | Liczba książek |
|:---|:---:|
<xsl:for-each select="categories/*"><xsl:sort select="./@booksCount" order="descending" data-type="number"/>|<xsl:call-template name="replace"><xsl:with-param name="text" select="name(.)"/><xsl:with-param name="replace" select="'_'"/><xsl:with-param name="by" select="' '"/></xsl:call-template> | <xsl:value-of select="@booksCount"/> |
</xsl:for-each>
</xsl:template>

<xsl:template match="book">| **<xsl:value-of select="title"/>** (*<xsl:value-of select="isbn"/>*) | **<xsl:value-of select="author"/>** | <xsl:value-of select="category"/> | <xsl:value-of
select="publisher"/> | <xsl:value-of select="price"/> *<xsl:value-of select="price/@currency"/>* | <xsl:value-of
select="page_count"/> | <xsl:value-of select="release_date"/>|
</xsl:template>

<xsl:template match="creator">
* **<xsl:value-of select="name"/>** *<xsl:value-of select="e-mail"/>* <xsl:value-of select="study"/>
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

<xsl:template match="text()[not(string-length(normalize-space()))]"/>

<xsl:template match="text()[string-length(normalize-space()) > 0]">
<xsl:value-of select="translate(.,'&#xA;&#xD;', '  ')"/>
</xsl:template>

</xsl:stylesheet>