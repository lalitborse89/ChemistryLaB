<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.Console"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Readings</title>

<!-- <link rel="stylesheet" href="./css/jquery-ui.css">
 -->
<link href="CSS1/_assessmentStyles.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><for header n footer>
  -->
<script src="./js/jquery-1.10.2.js"></script>
<script src="./js/jquery-ui.js"></script>



<script>
    $(function() {
        $("#tabs").tabs();
    });
</script>
<script>
    $(function() {
        $("#tabss").tabs();
    });
</script>

<style type="text/css">
#tabs {
    margin-top: 5em;
}

#tabs>ul {
    list-style-type: none;
    display: inline-block;
    padding-left: 0px;
}

#tabs>ul>li {
    padding-bottom: 0.3em;
    display: inline-block;
}

#tabs>ul>li>a {
    text-decoration: none;
    font: 1em;
    color: cornflowerblue;
}

#tabs>ul>li>a:hover {
    font-weight: bold;
    cursor: pointer;
    color: black;
}

#tabs>ul .active {
    font-weight: bold;
    cursor: pointer;
    fontcolor: black;
}

#questionsList {
    width: 100%;
    height: 20em;
    border: 1px solid black;
}

#btn-submit {
    background-color: azure;
    padding: 7px 25px;
    font-size: 15px;
    margin-top: 1em;
}
</style>
<style>
body {
    position: relative;
    width: 80em;
    margin: 1em auto;
    background-color: darkgray;
}

main {
    width: 100%;
    height: 40em;
    margin: 0 auto;
    border: 1px solid black;
    clear: both;
    font-family: sans-serif;
    position: relative;
}

.pdfWindow {
    float: left;
    width: 55%;
    height: 95%;
    background-color: darkgray;
    margin: 1em 0 1em 1em;
}

.active {
    background-color: #CCFF66;
}

.questionTab {
    float: right;
    margin: 0.5em 1em 1em 1em;
    width: 40%;
    height: 95%;
}

.container {
    width: 90%;
    clear: both;
    height: 95%;
    background-color: darkgray margin: 0 auto;
}

#wrap {
    width: 95%;
    clear: both;
    height: 95%;
    background-color: darkgray margin: 0 auto;
}

#ldiv {
    background-color: white;
    width: 60%;
    float: left;
    height: 550px;
    margin: 0 auto;
}

#rdiv {
    background-color: white;
    width: 35%;
    float: right;
    height: 95%;
    margin: 10 auto;
    padding: 10 auto;
}
</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body >
<%
 %>
    <div id="ldiv">
        <%
            String json = request.getParameter("json");
            //out.print(json);

            JSONArray ja = null;
            String text1 = "";
            String text2 = "";
            String att = "";
            StringBuilder str = new StringBuilder();
    
            ja = new JSONArray(json);
            
            out.print("<table border='1' >");
        
        
            out.print("<tr><th>Trial</th><th>Initial Burette(mL)</th><th>Final Mass(mL)</th></tr>");
            //<th>Volume of Water(mL)</th>"+
                //  "<th>Average(mL)</th><th>RSD (ppt)</th><th>Percent Error</th></tr>");

            out.print(ja.get(0));
            for(int i=0;i<4;i++){
            int k=i+1;
            out.print("<tr>");
            out.print("<td>" + k + "</td>");
            out.print("<td>" + ja.get(i) + "</td>");
            out.print("<td>" + ja.get(i+1) + "</td>");
           
            
            out.print("</tr>");
            }
           out.print("</table>");

           
           
           /*           
           A   B   C   D   E   F   G   H
           1   Trial   Initial Mass (g)    Final Mass (g)  Mass of Water (g)   Volume of Water (mL)    Average (mL)    RSD (ppt)   Percent Error
           2   1   emptyflask  masstrial1  mass1=C3-B3 vol1=D2/density avg=AVERAGE(E2:E6)  stdev=stvdev(E2:E6)/F2*1000 PE=ABS(F2-5)/5*100
           3   2   masstrial1  masstrial2  mass2=C4-B4 vol2=D3/density          
           4   3   masstrial2  masstrial3  mass3=C5-B5 vol3=D4/density          
           5   4   masstrial3  masstrial4  mass4=C6-B6 vol4=D5/density          
           6   5   masstrial4  masstrial5  mass5=C7-B7 vol5=D6/density          
*/
           
            /* try {
                ja = new JSONArray(json);
                out.print("<table border='1' >");
                out.print("<tr><th>Attempt</th><th>Initial Mass</th><th>Final Mass</th></tr>");

                for (int i = 0; i < ja.length(); i++) {
                    try {
                        JSONObject jo = (JSONObject) ja.get(i);
                        str.append(jo);
                        out.print("<tr>");
                        out.print("<td>" + jo.get("attempt") + "</td>");
                        out.print("<td>" + jo.get("reading1") + "</td>");
                        out.print("<td>" + jo.get("reading2") + "</td>");
                        out.print("</tr>");

                    } catch (Exception e) {

                    }
                }
                System.out.println(str);
                out.print("</table>");

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
 */     %>
    </div>
    
    <button id="att" onclick="sendAt()">ExportToCSV</button>
    <button id="att" onclick="loadPage()">Go Back</button>
    
 
    
    <script>
function loadPage(){
	seccurrQ = localStorage.getItem("seccurrQ");    
    console.log("*********************************Attempone*********************************"+seccurrQ)    
  window.location.href="Actexptwo.jsp?json="+11;
    
}
    </script>
    <script>

    
    function sendAt(){
            var json= <%=request.getParameter("json")%>
        console.log("<---->"+json)
        var jsonMap = JSON.stringify(json);

       console.log("---->>>"+jsonMap);
        
    $.ajax({
          method: "POST",
          url: "./AttemptContwo",
          data: { q: jsonMap }
        })
          .done(function( msg ) {
            console.log( "Data Saved: " + msg );
          });
    
    //window.location.href="AttemptCon.java?json="+jsonMap; 
    
    }   
    </script>
    
</body>
</html>