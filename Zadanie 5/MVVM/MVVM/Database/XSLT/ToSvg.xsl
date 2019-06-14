<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/2000/svg">

    <xsl:output method="xml"
                indent="yes"
                standalone="no"
                doctype-public="-//W3C//DTD SVG 1.1//EN"
                doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"
                media-type="image/svg"/>

    <xsl:template match="bookstore">

        <svg width="500px" height="1000px">
            <xsl:apply-templates select="summary"/>
        </svg>

    </xsl:template>

    <xsl:template match="summary">
        <g transform="scale(1.25,1.25) translate(60 -30)">
            <text x="20" y="60">Ilosc ksiazek w danej kategorii</text>
        </g>
        <g transform="scale(1.25,1.25) translate(0 50) rotate(-90 {count(../library/book)*10 div 2} {count(../library/book)*10 div 2})">
            <line x1="50"
                  x2="{count(../library/book)*10}"
                  y1="40"
                  y2="40"
                  stroke-width="1"
                  stroke="black"/>
            <line x1="50"
                  x2="50"
                  y1="40"
                  y2="{count(../library/book)*10}"
                  stroke-width="1"
                  stroke="black"/>
        </g>
        <g transform="scale(1.25,1.25) translate(0 0)">
            <text x="20" y="60"><xsl:value-of select="count(../library/book)"/></text>
            <text x="20" y="{count(../library/book)*10}">0</text>
        </g>
        <g transform="scale(1.25,1.25) translate(0 50) rotate(-90 {count(../library/book)*10 div 2} {count(../library/book)*10 div 2})">
            <xsl:for-each select="categories/*">
                <xsl:sort select="./@booksCount" order="descending" data-type="number"/>
                <xsl:variable name="y" select="(position()-1)*30 + 50"/>
                <xsl:variable name="cnt"><xsl:value-of select="@booksCount"/></xsl:variable>
                <text x="45" y="{$y}" transform="rotate(90 40 {$y}) translate(0 {-$cnt*10 - 20})"><xsl:value-of select="$cnt"/></text>
                <rect x="50" y="{$y}" height="20" width="{10*$cnt}" fill="grey">
                    <animate attributeName="width"
                             attributeType="XML"
                             dur="1s"
                             values="0;{10*$cnt}"
                             repeatCount="1"
                    />
                </rect>
                <text x="40" y="{$y}" transform="rotate(135 40 {$y})"><xsl:value-of select="local-name(.)"/></text>
            </xsl:for-each>
        </g>

    </xsl:template>

</xsl:stylesheet>