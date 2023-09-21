<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>FOAF to XHTML</title>
            </head>
            <body>
                <h1>Personnes dans FOAF</h1>
                <ul>
                    <xsl:for-each select="//foaf:Person">
                        <li><xsl:value-of select="foaf:name"/></li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
