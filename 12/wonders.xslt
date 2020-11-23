<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<!-- Monica Luong -->
<xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title> Wonders of the World </title>
            </head>
            <body>
                <h1> Seven Wonders of the Ancient World </h1>
                <h2> Overview </h2>
                    <table border="1">
                        <thead>
                            <tr> 
                                <td style="text-align:center"> <b> Wonder Name </b> </td>
                                <td style="text-align:center"> <b> Location </b> </td>
                                <td style="text-align:center"> <b> Height </b> </td>
                                <td style="text-align:center"> <b> Image </b> </td>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="/ancient_wonders/wonder">
                                <xsl:sort select="height" order="descending" data-type="number"/>
                            </xsl:apply-templates>
                        </tbody>
                    </table>
                <h2> History </h2>
                    <xsl:apply-templates select="/ancient_wonders/wonder/history">
                        <xsl:sort select="year_built" order="descending" data-type="number"/>
                    </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="wonder">
        <tr>
            <td>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="url"/>
                    </xsl:attribute>
                    <strong> <xsl:value-of select="name[@language='English']"/></strong>
                </a>
                <br/>
                <xsl:value-of select="name[@language!='English']"/>
            </td>
            <td>
                <xsl:value-of select="substring-before(location, ',')"/>
                <br/>
                <xsl:value-of select="substring-after(location, ',')"/>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="height != 0">
                        <xsl:value-of select="height"/>
                        &#160;<xsl:value-of select="height/@units"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <text> unknown </text>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <img width="250" height="125">
                    <xsl:attribute name="src">
                        <xsl:value-of select="image/@file"/>
                    </xsl:attribute>
                </img>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="history">
        <text>The </text>
        <xsl:value-of select="../name[@language='English']"/>
        &#160;&#40;        
        <xsl:value-of select="../name[@language!='English']"/>
        &#41;&#160;
        <text> was built in</text> 
        &#160;<xsl:value-of select="year_built"/>
        &#160;<xsl:value-of select="year_built/@era"/>
        <xsl:choose>
            <xsl:when test="how_destroyed">
                <text> and was destroyed by</text> 
                &#160;<xsl:value-of select="how_destroyed"/>
            </xsl:when>
            <xsl:otherwise>
                &#160;<text> and is still standing today</text>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="year_destroyed">
                <text> in</text>
                &#160;<xsl:value-of select="year_destroyed"/>
                &#160;<xsl:value-of select="year_destroyed/@era"/>
            </xsl:when>
        </xsl:choose>
        <text>.</text>
        <br/>
        <br/>
    </xsl:template>
</xsl:stylesheet>