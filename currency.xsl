<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
    <head>
      <title>Currency Converter</title>
    </head>
    <body>
      <p id="demo"></p>
  <form class="frConverter">
<div>
  <span>I Have</span>
  <select id="base_currency" onChange="getXML();">
    <option value="USD">U.S. Dollar</option>
    <option value="EUR">Euro</option>
    <option value="GBP">U.K. Pound Sterling</option></select>
  <input type="text" id="base_value" size="10" value="1" onChange="getXML();"/>
</div>
<div>
  <span>I Want</span>
  <select id="target_currency" onChange="getXML();">
    <option value="USD">U.S. Dollar</option>
    <option value="EUR">Euro</option>
    <option value="GBP">U.K. Pound Sterling</option></select>
  <input type="text" id="target_value" size="10" value="" onChange="getXML1();"/>
</div>
</form>


<script language="javascript">
  <![CDATA[
    function getXML() {
      var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myFunction(this);
        }
    };
    xhttp.open("GET", "currency.xml", true);
    xhttp.send();
    }


    function myFunction(xml) {
        var xmlDoc = xml.responseXML;
        var x = xmlDoc;
        var first1 = document.getElementById("base_currency");
        var first2 = first1.options[first1.selectedIndex].value;
        var second1 = document.getElementById("target_currency");
        var second2 = second1.options[second1.selectedIndex].value;
        var value1 = document.getElementById("base_value").value;
        var value2 = document.getElementById("target_value").value;
        var temp1 = 0;
        var temp2 = 0;
        var x = xmlDoc.getElementsByTagName('Currency');
        for (i = 0; i < x.length; i++) {
          if (first2=="EUR"){
            temp1=1;
            break;
          }
            if (x[i].getAttribute('Country') == first2) {
              temp1 = x[i].getAttribute('rate');
              break;
            }
        }
        for (i = 0; i < x.length; i++) { 
          if (second2=="EUR"){
            temp2=1;
            break;
          }
            if (x[i].getAttribute('Country') == second2) {
              temp2 = x[i].getAttribute('rate');
              break;
            }
        }
        var end = value1 / temp1;
        var end1 = end * temp2;
        document.getElementById("target_value").value = end1;

    }

    function getXML1() {
      var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myFunction1(this);
        }
    };
    xhttp.open("GET", "currency.xml", true);
    xhttp.send();
    }


    function myFunction1(xml) {
        var xmlDoc = xml.responseXML;
        var x = xmlDoc;
        var first1 = document.getElementById("base_currency");
        var first2 = first1.options[first1.selectedIndex].value;
        var second1 = document.getElementById("target_currency");
        var second2 = second1.options[second1.selectedIndex].value;
        var value1 = document.getElementById("base_value").value;
        var value2 = document.getElementById("target_value").value;
        var temp1 = 0;
        var temp2 = 0;
        var x = xmlDoc.getElementsByTagName('Currency');
        for (i = 0; i < x.length; i++) {
          if (first2=="EUR"){
            temp1=1;
            break;
          }
            if (x[i].getAttribute('Country') == first2) {
              temp1 = x[i].getAttribute('rate');
              break;
            }
        }
        for (i = 0; i < x.length; i++) { 
          if (second2=="EUR"){
            temp2=1;
            break;
          }
            if (x[i].getAttribute('Country') == second2) {
              temp2 = x[i].getAttribute('rate');
              break;
            }
        }
        var end = value2 / temp2;
        var end1 = end * temp1;
        document.getElementById("base_value").value = end1;

    }
]]></script>
      <h2>Country currencies</h2>
      <table border="1">
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
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>