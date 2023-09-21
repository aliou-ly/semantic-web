<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>FOAF Visualization</title>
            </head>
            <body>
                <h1>My FOAF Information</h1>
                <xsl:apply-templates select="//foaf:Person"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="foaf:Person">
        <div class="person">
            <h2><xsl:value-of select="foaf:name"/></h2>
            <p><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>
            <p><strong>Knows:</strong></p>
            <ul>
                <xsl:for-each select="foaf:knows/foaf:Person">
                    <li><a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:name"/></a></li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
