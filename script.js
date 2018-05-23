//<![CDATA[

window.onload = function() {

  console.log("inicio");
  var Connect = new XMLHttpRequest();
  
  Connect.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          var TheDocument = Connect.responseXML;
          var CurrrencyL = TheDocument.getElementsByTagName('Currency');
          var select = document.getElementById("base_currency");
          var select2= document.getElementById("target_currency");
          for (i = 0; i < CurrrencyL.length; i++) {
            //console.log(CurrrencyL[i].children[0].innerHTML);
            var opt= CurrrencyL[i].children[0].innerHTML;
            var el= document.createElement("option");
            var el2= document.createElement("option");

            el.textContent= opt;
            el.value=CurrrencyL[i].children[1].innerHTML;
            el2.textContent= opt;
            el2.value=CurrrencyL[i].children[1].innerHTML;
            select.appendChild(el);
            select2.appendChild(el2);
          }
        }
  };



  Connect.open("GET", "currency.xml", true);
  Connect.send();
}
    function getXML() {
      //document.getElementById("converted").innerHTML = "sdsaf";
      console.log("entrou");
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
        //console.log("entour1");
        var xmlDoc = xml.responseXML;
        var x = xmlDoc;
        var first1 = document.getElementById("base_currency");
        var first2 = first1.options[first1.selectedIndex].value;
        var second1 = document.getElementById("target_currency");
        var second2 = second1.options[second1.selectedIndex].value;
        var value1 = document.getElementById("base_value").value;
        var temp1 = 0;
        var temp2 = 0;
        var x = xmlDoc.getElementsByTagName('Currency');
        
        for (i = 0; i < x.length; i++) {
          //console.log(x[i].children[2].innerHTML);
          //console.log(first2);
          if (first2=="EUR"){
            temp1=1;
            break;
          }
            if (x[i].children[1].innerHTML/*country*/ == first2) {
              temp1 = x[i].children[2].innerHTML; /*rate*/

              break;
            }
        }
        for (i = 0; i < x.length; i++) { 
          if (second2=="EUR"){
            temp2=1;
            break;
          }
            if (x[i].children[1].innerHTML == second2) {
              temp2 = x[i].children[2].innerHTML;
              break;
            }
        }
        var end = value1 / temp1;
        var end1 = end * temp2;
        document.getElementById('converted').innerHTML = end1;

        var table = document.getElementById("output");
        var row = table.insertRow(1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);

        cell1.innerHTML = first2;
        cell2.innerHTML = value1;
        cell3.innerHTML = second2;
        cell4.innerHTML = end1;



    }

    /*function getXML1() {
      console.log("entour2");

      var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            myFunction1(this);
        }
    };
    xhttp.open("GET", "currency.xml", true);
    xhttp.send();
    }*/


    /*function myFunction1(xml) {
        console.log("entour3");

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

    }*/
//]]>