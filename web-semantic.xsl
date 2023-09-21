<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="https://github.com/aliou-ly/semantic-web/blob/main/semantic-web.rdf"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:foaf="http://xmlns.com/foaf/0.1/"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                version="1.0">
    <xsl:output method="html" encoding="UTF-8"/>


    <!-- Modèle pour correspondre à la racine du document RDF -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>FOAF Visualization</title>
            </head>
            <body>
                <h1>My FOAF Information</h1>
                <!-- Appliquer le modèle aux personnes (foaf:Person) dans le document -->
                <xsl:apply-templates select="//foaf:Person"/>
            </body>
        </html>
    </xsl:template>

    <!-- Modèle pour correspondre à chaque personne (foaf:Person) -->
    <xsl:template match="foaf:Person">
        <div class="person">
            <h2><xsl:value-of select="foaf:name"/></h2>
            <p><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>
            <p><strong>Knows:</strong></p>
            <ul>
                <!-- Appliquer le modèle aux personnes connues (foaf:knows/foaf:Person) -->
                <xsl:apply-templates select="foaf:knows/foaf:Person"/>
            </ul>
        </div>
    </xsl:template>

    <!-- Modèle pour correspondre à chaque personne connue -->
    <xsl:template match="foaf:knows/foaf:Person">
        <li><a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:name"/></a></li>
    </xsl:template>
</xsl:stylesheet>
