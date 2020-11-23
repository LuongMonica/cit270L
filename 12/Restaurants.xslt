<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<!-- Monica Luong -->
<xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title> Restaurants </title>
            </head>
            <body>
                <h1> Recommended Restaurant </h1>
                <p>
                    I recommend <xsl:value-of select="Restaurants/Restaurant/@Name"/>
                </p>
                <h1> Restaurants with Vegetarian Options </h1>
                <p>
                    <table border="1">
                        <THEAD>
                            <TR>
                                <TD><B> Restaurant Name </B> </TD>
                                <TD><B> Vegetarian Menu Items </B> </TD>
                            </TR>
                        </THEAD>
                        <TBODY>
                            <xsl:for-each select="Restaurants/Restaurant/Menu/MenuItem">
                                <xsl:if test="@IsVegetarian='True'">
                                <TR>
                                    <TD><xsl:value-of select="../../@Name"/> </TD>
                                    <TD><xsl:value-of select="@Name"/> </TD>
                                </TR>
                                </xsl:if>
                            </xsl:for-each>
                        </TBODY>
                    </table>
                    
                </p>
                <h1> Restaurants by Location </h1>
                <p>
                    <table border="1">
                        <THEAD>
                            <TR>
                                <TD><B> Restaurant Name </B> </TD>
                                <TD><B> City </B> </TD>
                                <TD><B> State </B> </TD>
                                <TD><B> Quality </B> </TD>
                                <TD><B> Price </B> </TD>
                            </TR>
                        </THEAD>
                        <TBODY>
                            <xsl:for-each select="Restaurants/Restaurant">
                            <TR>
                                <TD><xsl:value-of select="@Name"/></TD>
                                <TD><xsl:value-of select="Location/City"/></TD>
                                <TD><xsl:value-of select="Location/State"/></TD>
                                <TD><xsl:value-of select="@QualityRating"/></TD>
                                <TD><xsl:value-of select="@PriceRange"/></TD>
                            </TR>
                            </xsl:for-each>
                        </TBODY>
                    </table>
                </p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>