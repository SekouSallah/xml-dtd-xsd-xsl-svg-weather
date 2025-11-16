<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">

            <line x1="100" y1="100" x2="100" y2="600" stroke="blue" stroke-width="2"/>
            <line x1="100" y1="600" x2="1000" y2="600" stroke="blue" stroke-width="2"/>

            <xsl:for-each select="meteo/mesure[@date='2025-11-11']/ville">
                <xsl:variable name="posX" select="position()*120"/>
                <xsl:variable name="temp" select="@temperature * 10"/>
                <xsl:variable name="posY" select="600 - $temp"/>

                <text x="{$posX}" y="620" stroke="blue">
                    <xsl:value-of select="@nom"/>
                </text>

                <rect width="20"
                      height="{$temp}"
                      x="{$posX}"
                      y="{$posY}"
                      fill="orange"
                      stroke="blue">

                    <animate attributeName="height"
                             values="0;{$temp};0"
                             dur="3s"
                             repeatCount="indefinite"/>

                    <animate attributeName="y"
                             values="600;{$posY};600"
                             dur="3s"
                             repeatCount="indefinite"/>
                </rect>

                <text x="{$posX}" y="{$posY - 10}" stroke="blue">
                    <xsl:value-of select="concat(@temperature, '°')"/>
                </text>

            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
