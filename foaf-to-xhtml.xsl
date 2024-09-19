<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

  <!-- Sortie au format HTML -->
  <xsl:output method="html" encoding="UTF-8" indent="yes" 
              doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
              doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  
  <!-- Template de base pour la page -->
  <xsl:template match="/rdf:RDF">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>FOAF Profile of <xsl:value-of select="foaf:Person/foaf:name"/></title>
      </head>
      <body>
        <h1>Profil FOAF de <xsl:value-of select="foaf:Person/foaf:name"/></h1>

        <div>
          <h2>Informations générales</h2>
          <p><strong>Nom complet :</strong> <xsl:value-of select="foaf:Person/foaf:name"/></p>
          <p><strong>Adresse e-mail :</strong> 
            <a href="{foaf:Person/foaf:mbox/@rdf:resource}">
              <xsl:value-of select="foaf:Person/foaf:mbox/@rdf:resource"/>
            </a>
          </p>
          <p><strong>Page d'accueil :</strong> 
            <a href="{foaf:Person/foaf:homepage/@rdf:resource}">
              <xsl:value-of select="foaf:Person/foaf:homepage/@rdf:resource"/>
            </a>
          </p>
          <p><strong>Nom d'utilisateur :</strong> <xsl:value-of select="foaf:Person/foaf:nick"/></p>
          <p><strong>Genre :</strong> <xsl:value-of select="foaf:Person/foaf:gender"/></p>
          <p><strong>Brève description :</strong> <xsl:value-of select="foaf:Person/foaf:title"/></p>
        </div>

        <div>
          <h2>Image de profil</h2>
          <img src="{foaf:Person/foaf:img/@rdf:resource}" alt="Photo de profil"/>
        </div>

        <div>
        <h2>Connaissances</h2>
        <xsl:for-each select="foaf:Person/foaf:knows/foaf:Person">
            <div class="friend">
            <h3><xsl:value-of select="foaf:name"/></h3>
            <p><strong>Email :</strong> 
                <a href="{foaf:mbox/@rdf:resource}">
                <xsl:value-of select="foaf:mbox/@rdf:resource"/>
                </a>
            </p>
            <p><strong>Page d'accueil :</strong> 
                <a href="{foaf:homepage/@rdf:resource}">
                <xsl:value-of select="foaf:homepage/@rdf:resource"/>
                </a>
            </p>
            <p><strong>Nom d'utilisateur :</strong> <xsl:value-of select="foaf:nick"/></p>
            <p><strong>Titre :</strong> <xsl:value-of select="foaf:title"/></p>
            </div>
        </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>