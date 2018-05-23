<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="output.xsl"/>
<xsl:output method="html" omit-xml-declaration="yes" indent="no"/>
<xsl:template match="/">

  <html>
    <head>
      <title>Currency Converter</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous"></link>
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"></link>
      <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css"></link>
      <script  src="https://code.getmdl.io/1.3.0/material.min.js"></script>
      <link rel="stylesheet" href="style.css"></link>

      <script type="text/javascript" src="script.js"></script>

    </head>
    
    <body>
      <xsl:value-of select="Currency"/>
      <div class="demo-card-wide mdl-card mdl-shadow--2dp" >
        <h1>CURRENCY CONVERTER</h1>
      </div>
      <p id="demo"></p>
  <div class="demo-card-wide mdl-card mdl-shadow--2dp">
  <form class="frConverter">

  <span style="margin-left:20%">From </span>
  
  <div id="container1" >
  
  <select id="base_currency" class="btn  dropdown-toggle">
    <option value="EUR">Euro</option>
  </select>
  <input type="text" class="form-control" id="base_value" value="1"/>
  </div>


  <span style="margin-left:20%">To </span>
  <div id="container2">
  <select id="target_currency" class="btn  dropdown-toggle" >
    <option value="EUR">Euro</option>
  </select>

</div>
 <div class="text-center" style="padding-top: 10px;">
  <input class="btn btn-lg btn-success" type="button" onClick="getXML()" value="Convert" ></input>
  </div>
  <div class="mdl-card__actions mdl-card--border" style="margin-top:5%">
</div>
<label>BASE</label>
<p>
<label style="border-style: solid;" id="converted"> ....... </label></p>
  <label>RESULT</label>
<div class="mdl-card__actions mdl-card--border">
  
  <table id="output">
    <tr> 
        <th>Base Currency | </th> 
        <th>Value | </th> 
        <th>Output Currency | </th> 
        <th>Value</th>
    </tr> 
  </table>
</div>

</form>

      <h2>Country currencies</h2>
      <table border="1" class="table-bordered table-hover">
        <tr bgcolor="#9acd32">
          <th>Country</th>
          <th>Rate</th>
        </tr>
        <xsl:for-each select="catalog/Currency">
          <tr>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="rate"/></td>
          </tr>
        </xsl:for-each>
      </table>
      </div>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>