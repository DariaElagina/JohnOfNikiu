<?xml version="1.0" encoding="UTF-8"?>
<!--PIETRO: was there a reason for the ISO encoding? your file is in UTF-8, 
I would stay on that.-->
<!--PIETRO: below I changed the version to 2.0. that is a minimum version, 1.0 is really old, i do not think I ever used it myself.-->
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:t="http://www.tei-c.org/ns/1.0">
  <!-- PIETRO: you are working in TEI, so your standard xmlns is that of TEI, which I would prefix, just not to cut out anything else-->
  <xsl:output method="html"/>
  <xsl:template match="/">
    <!--  PIETRO:  using  / will just match anything, even without need to specify your root, TEI-->
    <html xmlns="https://www.w3.org/1999/xhtml">
<!--      you need a head in an HTML file.-->
      <head>
        <title>John</title>
      </head>
      <body>
<!--        PIETRO: you want to loop each teiHeader, but there is only one, perhaps
        that can be just omitted?-->
        <xsl:for-each select="//t:teiHeader">
<!--          PIETRO: note the // because the template matches the root, we take any descendant
          t:teiHeader, below the context is t:teiHeader so // is any descendant of t:teiHeader-->
          <xsl:value-of select="//t:titleStmt/t:title"/><br/>
<!--          PIETRO: value-of really takes only value of. perhaps you can try a standard technique
          of XSLT, apply-templates. At first it may look strange, but soon it will be indispensable.
          this small statement here will look for any template matching the selection and apply them-->
          <xsl:apply-templates select="//t:titleStmt/t:author"/>
        </xsl:for-each>

      </body>
    </html>

    </xsl:template>
<!--  PIETRO: if you want to take a look at my private copy of Michael Kay, XSLT 2.0, it is in my office,
  feel free to use it, it is a great book, jut leave it there, it is a reference work which I use 
   frequently when I am in office-->
  <xsl:template match="t:author">
    <p><b><xsl:value-of select="."/></b></p>
  </xsl:template>
</xsl:stylesheet>
