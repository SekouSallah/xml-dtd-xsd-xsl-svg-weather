<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Météo Mali</title>
            </head>
            <body>
                <xsl:for-each select="meteo/mesure[@date='2025-11-11']">
                    <ul>
                        <li>
                            <b>Mesure du
                                <xsl:value-of select="@date"/>
                            </b>
                        </li>
                    </ul>
                    <table width="100%" border="1">
                        <tr>
                            <th>Ville</th>
                            <th>Température</th>
                        </tr>
                        <xsl:for-each select="ville">
                            <tr>
                                <td>
                                    <xsl:value-of select="@nom"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@temperature"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                        <tr>
                            <td>Moyennne des températures</td>
                            <td>
                                <xsl:value-of select="avg(ville/@temperature)"/>
                            </td>
                        </tr>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
