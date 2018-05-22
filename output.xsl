<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0">
 
<xsl:output method="html" indent="yes" name="html"/>
 
<xsl:template match="/">
<xsl:result-document href="{$dir}/output.txt" format="text">
    <xsl:apply-templates/>
</xsl:result-document>
</xsl:template>
</xsl:stylesheet>