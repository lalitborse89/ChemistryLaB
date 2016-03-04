<%@page import="java.net.URLEncoder"%>
<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="java.io.Console"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Module5</title>

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
    height: 1050px;
    clear: both;
    height: 95%;
    background-color: darkgray margin: 0 auto;
}

#ldiv {
    background-color: white;
    width: 60%;
    float: left;
    height: 850px;
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

#q77, #q78, #89 {
    margin-top: 3cm;
    margin-left: 2cm;
    background-color: white;
    margin: 30 auto;
    padding: 30 auto;
}
</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body onload="loadPage()">
    <%
    Dao dk = new Dao();
    PriorityQueue<Question> pp=dk.QchcekBox(5);
    int noofQ=pp.size();
  
    String ss=request.getParameter("json");
    if(ss!=null){
        pageContext.setAttribute("seccurrQ", ss);
        request.setAttribute("seccurrQ", ss);
       // out.println("ss is"+ss);
        
    }
 //   Httpsession session =request.getSession();
    String username=(session.getAttribute("username")).toString();
    String q1=dk.getQuestion(5,16);
    %>

    

    <h1>
        <strong>CASTLE</strong>
        Chemistry Laboratory System
    </h1>
    <h2>Experiment-I</h2>
    Welcome<h4><%=username %></h4>
    <div class="support-note">
        <span class="note-ie">Sorry, only modern browsers.</span>
    </div>

    
    <div id="error"
        style="color: red; font-family: arial; text-align: center; z-index: 99; position: relative;"></div>
    <div class="container">
        <div id="wrap">


            <input type="hidden" id="hiddens" value="<%=noofQ %>">

            <div id="ldiv" align="left">

                <object width="100%" height="100%" data="images/castle.pdf"></object>

            </div>




            <div id="rdiv" align="right">

                <article id="questionTab"> <section class="main">

                <div id="tabs" style="">


                    <ul>


                        <%for(int i=1;i<noofQ;i++)
                                 {
                                 
                                 
                                    %>
                        <li><a href="#tabs<%=i%>" id="q9<%=i%>">Q.<%=i %></a></li>
                        <% 
                                 }
                               %>
                    </ul>
                    <%
                           for(int i=1;i<noofQ;i++){
                                     %>
                    <div id="tabs<%=i%>">
                        Que no:
                        <%=i %>

                        <div id="register">
                            <div align="left">
                                <br>
                                <h5>
                                    <p id="hint_<%=i%>"></p>
                                    <p id="hint_<%=i%>t"></p>
                                    <p id="hint_<%=i%>e"></p>
                                </h5>
                                <br>
                                <br>
                                <br>
                                <%
                 Question q= new Question();
                 q=pp.poll();
                /*  out.println("***"+q.getHint1());
                 out.println(q.getHint2());
                 out.println(q.getHint3()+"**");
                 out.println(); */
                 
                 
                 
                 String a=q.getQuestion();
                 
                 out.println(a);
                 System.out.println("qnumid"+q.getQ_num_id()+" "+i);
                 System.out.println("Qcbid "+q.getQ_cb_id()+" "+i);
                                    
                  String h11=q.getHint1();               
                  String h12=q.getHint2();
                  String h13=q.getHint3();  
                  String h1 = URLEncoder.encode(h11, "UTF-8")   
                          .replaceAll("\\%28", "(")                          
                          .replaceAll("\\%29", ")")        
                          .replaceAll("\\+", "%20")                          
                          .replaceAll("\\%27", "'")               
                          .replaceAll("\\%21", "!")
                          .replaceAll("\\%7E", "~");     

               
                String h2 = URLEncoder.encode(h11,"UTF-8").replaceAll("\\%28", "(")                          
                        .replaceAll("\\%29", ")")        
                        .replaceAll("\\+", "%20")                          
                        .replaceAll("\\%27", "'")               
                        .replaceAll("\\%21", "!")
                        .replaceAll("\\%7E", "~"); 
                String h3 = URLEncoder.encode(h11,"UTF-8").replaceAll("\\%28", "(")                          
                        .replaceAll("\\%29", ")")        
                        .replaceAll("\\+", "%20")                          
                        .replaceAll("\\%27", "'")               
                        .replaceAll("\\%21", "!")
                        .replaceAll("\\%7E", "~"); 

                  %>
                                <input type="hidden" id="ahint<%=i%>e" value=<%=h1 %>
                                    maxlength="100"> <input type="hidden" id="ahint<%=i%>"
                                    value=<%=h1 %> maxlength="100"> <input type="hidden"
                                    id="bhint<%=i%>" value=<%=h2 %> maxlength="100"> <input
                                    type="hidden" id="chint<%=i%>" value=<%=h3 %> maxlength="100">
                                    
                                    
        <input type="hidden" id="ahint<%=i%>t"value=<%=h1 %> maxlength="100"> 
        <input type="hidden" id="bhint<%=i%>t" value=<%=h2 %> maxlength="100">
        <input type="hidden" id="chint<%=i%>t" value=<%=h3 %> maxlength="100">

                                <table>
                                    <% if(q.getQ_num_id()!=0){
                      
                      if(i!=12 ){
                 System.out.println("i am inside Qnum"+i);
                %>

                                    <tr>
                                        <td>
                                            <%  System.out.println("i am inside1");
                       %>
                                            <h4>Answer:</h4>
                                            <input type="text" id="ans<%=i%>t"> <input
                                            type="hidden" id="<%=i%>tup" value=<%=q.getUplimit() %>>
                                            <input type="hidden" id="<%=i%>tdown"
                                            value=<%=q.getLowerlimit() %>> 
                                         <%if(i!=11 && i!=13 && i!=14 && i!=15 ){ %>   
                                            Range:<%=q.getLowerlimit() %>
                                            to <%=q.getUplimit() %>
                                            <%} %>
                                            <button type="submit" id="<%=i%>t"
                                                onclick="getitchecked(this)">Submit</button>
                                        </td>
                                        <%  }
                      System.out.println("***********************inside 2****** endd*******************************"+i); 
                 
             %>
                                    </tr>

                                </table>


                                <%  }else if(q.getQ_cb_id()!=0){%>
                                <table>

                                    <tr>
                                        <td><input type="radio" name="opt" id="<%=i%>a"
                                            value="one"><%=q.getAnswer_1() %><br></td>
                                    </tr>
                                    <tr>
                                    <tr>
                                        <td><input type="radio" name="opt" id="<%=i%>b"
                                            value="two"><%=q.getAnswer_2() %><br></td>
                                    </tr>
                                    <tr>
                                        <%  String q3=q.getAnswer_3();
                     String q4=q.getAnswer_4();   
                
                     if (q3!=null && q4!=null){        %>
                                    
                                    <tr>
                                        <td><input type="radio" name="opt" id="<%=i%>c"
                                            value="three"><%=q.getAnswer_3() %><br></td>
                                    </tr>

                                    <tr>

                                        <td><input type="radio" name="opt" id="<%=i%>d"
                                            value="four"><%=q.getAnswer_4() %><br>
                                        <br></td>
                                    </tr>
                                    <%} %>
                                </table>
                                <%String s=q.getAnsoption();
             out.println(s);%>
                                <button type="submit" id=<%=i%> onclick="checkk(this)"
                                    value=<%=s%>>Submit</button>
                                <br>
                                <br>

                                <%}%>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            </div>

                        </div>
                    </div>



                    <%} %>

                </div>
                <% pp.clear(); %> </section> </article>
                </br> </br> </br> </br>



            </div>

        </div>



    </div>





    <div>
        <br>
        <br>
    </div>

    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <div id="q77">
        <br> t1initial Weight:<input type="text" id="t1initial">g.<br>
        t1final:<input type="text" id="text1">g.<br>
        <button id="att" onclick="Enter()">Enter</button>
        <br>
        <p id="hintagain"></p>
    </div>

    <div id="q78">
        <table>
            <tr>
                <td><p id="mastrial"></p>
                    <input id="triall" type="text" /></td>
                <td>
                    <button id="attmass" onclick="AddMass()">New Initial Volume</button>
                </td>
                <td><p id="msg"></p></td>

            </tr>
            <!--   <tr> 
          <td><input id="text3" type="text"/></td>
          
          <td><input id="text4" type="text"/></td>
    </tr>
   -->
        </table>




        <br>
        <table>


            <tr>
                <td>
                    <p id="flask"></p>
                </td>
            </tr>


            <tr>
                <td>
                    <p id="masst1"></p>
                </td>


            </tr>


            <tr>
                <td>
                    <p id="masst2"></p>
                </td>
            </tr>



            <tr>
                <td>
                    <p id="masst3"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <p id="masst4"></p>
                </td>
            </tr>

            <tr>
                <td>
                    <p id="masst5"></p>
                </td>
            </tr>




        </table>


        <br> <br>
        <div id="q88">
            <button id="attmass" onclick="sendAtt()">Build Table</button>
        </div>

    </div>


    <div id="q89">
        <button onclick="myFunction()">Get Formula</button>





    </div>

<div id="q44">
    Question:<%=q1 %>
    <br>
<!--     <input id="qa14" type="text" />
 -->    <textarea  placeholder="Explanation" rows="4" cols="35"></textarea>
        <button onclick="qtxt(this)" id="q14">Submit</button>





    </div>







    <div id="q66">
    </div>

    <script>
 var t1initial=0;
 var mass1=0;
 var reading=[];
 var counter=1;
 var t1final=0;
 var jlist=[];
 var rsdup=0;
 var rsddown=0;
 var avgup=0;
 var avgdown=0;
 var counterr=0;
 function Enter(){
     var inval=parseFloat($("#t1initial").val());
     var massk=parseFloat($("#text1").val());
     upper=inval+11.5;
     lower=inval+9.5;
     
     if(inval<35 && inval>0){
      
      t1initial= parseFloat($("#t1initial").val());
     
              if(massk<upper && massk>lower){ 
             mass1=massk;
             //parseFloat($("#t1initial").val());
             document.getElementById("hintagain").innerHTML =" New t1initial and t1final one entered";
             counter=1;
            
             document.getElementById("flask").innerHTML="";
             document.getElementById("masst1").innerHTML="";
          
              $("#q78").show();
              }
              else
              {
                    document.getElementById("hintagain").innerHTML ="Only New t1initial mass entered choose new t1final within Range";
  
              }
     }
     else
     {
         document.getElementById("hintagain").innerHTML ="The t1initial is different than expected, please try again.";
     }
      console.log("NEW Flask weight is"+t1initial+mass1);
  
 }
  </script>
    <script>
  function AddMass(){
      
        reading[0]=t1initial;
        reading[1]=mass1;
       masstrial= parseFloat($("#triall").val());
       
       document.getElementById("flask").innerHTML="Flask:"+reading[0];
       document.getElementById("masst1").innerHTML="Masstrial 1:"+reading[1];
       
      
      /* var map = [];
        var attempt = 0;
        function doAttempt(){
            var smallMap = {}; 
            var t1 = $("#text1").val();
            var t2 = $("#text2").val();
            var t3 = $("#text3").val();
            var t4 = $("#text4").val();
            attempt++;
            smallMap["attempt"] = attempt;
            smallMap["reading1"] = t1;
            smallMap["reading2"] = t2;
            map.push(smallMap);
            var smallMap = {};
            attempt++;
            smallMap["attempt"] = attempt;
            smallMap["reading1"] = t3;
            smallMap["reading2"] = t4;
            map.push(smallMap);
             sendAtt();
        }
       */
      
      
      
      
    if(counter==1){  
           var prev =parseFloat(reading[1]);
           loww=prev+9.5;
           upp=prev+11.5;
           if( masstrial>loww && masstrial<upp){
               document.getElementById("msg").innerHTML ="Mass Trial 2 entered";
               reading[2]=masstrial;
               document.getElementById("masst2").innerHTML="Masstrial 2:"+reading[2];
               counter++;
           }
           else{
               document.getElementById("msg").innerHTML ="Mass Trial 2 out of range..Try Again";
           }
    
    }else if(counter==2){  
        var prev =parseFloat(reading[2]);
        loww=prev+9.5;
        upp=prev+11.5;
        if( masstrial>loww && masstrial<upp){
            document.getElementById("msg").innerHTML ="Mass Trial 3 entered";
            reading[3]=masstrial;
            document.getElementById("masst3").innerHTML="Masstrial 3:"+reading[3];
            counter++;
        }
        else{
            document.getElementById("msg").innerHTML ="Mass Trial 3 out of range..Try Again";
        }
 
 }else if(counter==3){  
     var prev =parseFloat(reading[3]);
     loww=prev+9.5;
     upp=prev+11.5;
     if( masstrial>loww && masstrial<upp){
         document.getElementById("msg").innerHTML ="Mass Trial 4 entered";
         reading[4]=masstrial;
         document.getElementById("masst4").innerHTML="Masstrial 4:"+reading[4];
         counter++;
         $("#q88").show("slow");
     }
     else{
         document.getElementById("msg").innerHTML ="Mass Trial 4 out of range..Try Again";
     }

}/* else if(counter==4){  
    var prev =parseFloat(reading[4]);
    loww=prev+9.5;
    upp=prev+11.5;
    if( masstrial>loww && masstrial<upp){
        document.getElementById("msg").innerHTML ="Mass Trial 5 entered";
        reading[5]=masstrial;
        document.getElementById("masst5").innerHTML="Masstrial 5:"+reading[5];
        counter++;
        $("#q88").show("slow");
        
    }
    else{
        document.getElementById("msg").innerHTML ="Mass Trial 5 out of range..Try Again";
    }

} */
//  sendAtt();
       
      
    
      
  }
  </script>
<script>
  function qtxt(ele){
      console.log("came");
      var id = $(ele).attr("id");
      
       
             console.log("here");
            // $("#"+id).toggleClass('active'); 
            // $("#"+id).prop("disabled",true);
             $("#q66").show();
           //  $("#tabs").tabs("option", "active", 15);
           
             $.ajax({
                 method: "POST",
                 url: "./CompleteExptCon",
                 data: {  }
               })
                 .done(function( msg ) {
                   console.log( "Data Saved: " + msg );
                 });
             window.location.href="CompletExpmt.jsp";
      
  }
  </script>



    <script>
function myFunction() {
    var myWindow = window.open("", "myWindow", "width=900, height=300");
    
    
myWindow.document.write("<table border='1'><tr><th></th><th>A </th><th>B </th><th>C </th><th>D </th><th>E </th><th></th><th></th></tr>");
myWindow.document.write("<tr><td>1</td><td>Trial</td><td>Initial Burette Reading (ml)</td><td>Final Burette Reading (ml)</td><td>Volume of NaOH Used in Titration</td>"+       
  "<td>Molarity of HCL (M)</td><td>Average Molarity(M)</td><td>RSD(ppt)</td></tr>");
myWindow.document.write("<tr><td>2</td><td>1</td><td>t1initial</td><td>t1final</td><td>= C2-B2</td><td>MHClt1 =D2/1000*0.1/0.005</td><td>avg=average(e2:E5) </td>"+ 
		"<td>RSD=G2/STDEB(e2:E5)*1000</td></tr>");
myWindow.document.write("<tr><td>3</td><td>2</td><td>t1final</td><td>t2final</td><td>= C3-B3</td><td>MHClt2 =D3/1000*0.1/0.005</td><td></td><td></td></tr>");
myWindow.document.write("<tr><td>4</td><td>3</td><td>t2finalinitial</td><td>t3final</td><td>= C4-B4</td><td>MHClt3 =D4/1000*0.1/0.005</td><td></td><td></td></tr>");
myWindow.document.write("<tr><td>5</td><td>4</td><td>t3final</td><td>t4final</td><td>= C5-B5</td><td>MHClt4 =D5/1000*0.1/0.005</td><td></td><td></td></tr></table>");
    
    
myWindow.document.write("<br><br><h2>Example</h2><br><br>");


myWindow.document.write("<table border='1'><tr><th></th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th></tr>");
myWindow.document.write("<tr><td>1</td><td>Trial</td><td>Initial Burette Reading (ml)</td><td>Final Burette Reading (ml)</td>"
+"<td>Volume of NaOH Used in Titration</td><td>Molarity of HCL (M)</td></tr>");
myWindow.document.write("<tr><td>2</td><td>1</td><td>10.31</td><td>23.27</td><td>= C2-B2</td><td>= D2/1000*0.1/0.005</td></tr></table>");

    
    
    
}


</script>
<script>
function calculate(){
    
t1initial= reading[0];
m1=reading[1]
m2=reading[2]
m3=reading[3]
m4=reading[4]
m5=reading[5]
    
/* wm1=m2-m1;
wm2=m3-m2;
wm3=m4-m3;
wm4=mh-m4;

v1=wm1/den;
v2=wm2/den;
v3=wm3/den;
v4=wm4/den;
    
avg= v1+v2+v3+v4/4;

stdev=stvdev(v1,v2,v3,v4)/avg*1000;

pe=abs(avg-5)/500; */
}
</script>

    <script>
  function loadPage(){
     console.log("set");   
     seccurrQ="<%= request.getAttribute("seccurrQ") %>"
     console.log("***************************************************************************"+seccurrQ) 
     
    // seccurrQ=  "<% request.getAttribute("seccurrQ"); %>";
    var noOFQ = $("#hiddens").val();
    
   if(seccurrQ!="11"){
    for(i=1;i<=noOFQ; i++){
        if(i != 1){
         $("#q9"+i).hide();
         
      }
     }
      
      $("#q66").hide();
      $("#q77").hide();
      $("#q78").hide();
      $("#q88").hide();
      $("#q89").hide();
      $("#q44").hide();
      
   
      countt=0;
   }else{
       
     
      
        console.log("***************************************************************************"+seccurrQ)  
  //    seccurrQ="  <%= pageContext.getAttribute("seccurrQ", PageContext.SESSION_SCOPE) %>";
      
    console.log("***************************************************************************"+seccurrQ)   
       
      var seccurrQ = parseInt(seccurrQ);
  //  seccurrQ= parseFloat($("#seccurrQ").val());
        console.log("***************************************************************************"+seccurrQ)   
       
    console.log(" some Attempted")
    console.log("***************************************************************************"+seccurrQ)   
    for(i=1;i<13; i++){
            
             $("#q9"+i).show();
             
             $("#"+i).toggleClass('active');
             $("#"+i).prop("disabled",true);   
          
             $("#"+i+"t").toggleClass('active'); 
             $("#"+i+"t").prop("disabled",true);
      }
        $("#q66").hide();
         
       $("#q77").hide();
          $("#q78").hide();
          $("#q44").hide();
               
          $("#q88").hide();
          $("#q89").show();
       for(i=13;i<noOFQ; i++){
           
           var temp = i+1;  
           $("#q9"+temp).hide();
             var temp = i+1;
          //   $("#q9"+temp).show();
             //alert("111")
             $("#tabs").tabs("option", "active", 12);
          
         }
        
       
       
   }
  
  
  }
   
  
</script>

    <script>

function checkk(ele){
    console.log("Only for MCQ Questions");
    var noOFQ = $("#hiddens").val();
    var id = $(ele).attr("id");
    var answer=$(ele).attr("value");
    //var opt= $(ele).attr("opt");
//console.log("id is-->"+id);
 //console.log("answer is-->"+answer);

  // alert(answer);
 // console.log("id---" +id);
 // alert(parseInt('"answer"'));   
//  int ans =Integer.parseInt(answer);
 // alert(countt);
  var ans=id+answer;
 // alert(ans);
 // console.log("radio id - "+ans);
  h="hint";
  hid=h+id;
  hid0="a"+hid;
 // alert(hid0);
// alert("combined id - "+hid);
  var i;
  //console.log(document.getElementById(hid0).value);
 // console.log($("#"+hid0).val());
  var text= "Hint1:"+decodeURIComponent(document.getElementById(hid0).value)
  //var text= "Hint1:"+$("#"+hid0).val();
 // alert(text);
  var hid1="b"+hid;
  var text1="Hint2:"+decodeURIComponent($("#"+hid1).val());
// alert(text1);
  hid2="c"+hid; 
 //var text2="Hint3:"+document.getElementById(hid2).value
  var text2="Hint3:"+decodeURIComponent($("#"+hid2).val());
  
  
//console.log("HINT--"+text);
//console.log("HINT--"+text1);
//console.log("HINT--"+text2);
  

        
                      if(document.getElementById(ans).checked) {
                          $("#"+id).toggleClass('active');
                           $("#"+id).prop("disabled",true);
                           localStorage.setItem("seccurrQ", id);
         
                           console.log("seccurrQ"+localStorage.getItem("seccurrQ"));
                           
                           document.getElementById(ans).disabled = true;
                          countt=0;
                           
                           for (x=0;x<2;x++){
                               if(id == "q9"+x)
                                   {
                                   alert(89);
                                   }
                               
                           }
                           
                           
                           
                           for( i=1;i<17;i++){
                               if(id==6){
                                  // alert("Here");
                                   $("#q78").show("slow");
                                   
                               }
                               if(id == i && (i!=noOFQ)){
                                   var temp = i+1;
                                       $("#q9"+temp).show();
                                       //alert("111")
                                       $("#tabs").tabs("option", "active", id);
                                       //alert("222")
                               }                 
                           }
                           
                           if(id ==noOFQ){
                               console.log("Last tab")
                               $("#q66").show("slow");
                               $("#tabs").tabs("option", "active", noOFQ);
                          
                               
                                }
                       
                           
                          
                           
                           
                      }else{
                          
                    //      alert(countt +"is countt");
                          if (countt==2){
                              document.getElementById("hint_"+id+"e").innerHTML =
                                  text2; 
                            countt=0;
                              
                               }else if (countt==1){
                                   document.getElementById("hint_"+id+"t").innerHTML =
                                       text1; 
                                   countt=2;
                                   }
                               else if(countt==0){
                          
                               document.getElementById("hint_"+id).innerHTML =
                                text; 
                            countt=1;     
                          }
                      //    alert(countt +"is countt Now");
       }
  
  
}
</script>


    <script>
function getitchecked(ee){
    var id;
    var id = $(ee).attr("id");
    
    hid0="ahint"+id;
    hid1="bhint"+id;
    hid2="chint"+id;
  //  var answer=$(ee).attr("value");
//alert(id);
//alert(answer);
var ans="ans"+id;
var noOFQ = $("#hiddens").val();

     inval=document.getElementById(ans).value
     var id = $(ee).attr("id");
  var up =id+"up";
  var down=id+"down";
     up=document.getElementById(up).value
     down=document.getElementById(down).value

     
     
   // 
     up=Number(up);
     down=Number(down);
      inval=Number(inval); 
      if(id==11+"t"){
        up=t1initial+11.5;
        down=t1initial+9.5;
          console.log("for 11th Q between"+up+"and"+down);
       //   alert(up);
         //  alert(down);
          // alert(inval);
      }
     // var res="";

 
 
 if(id==13+"t"){
	 
t1i=localStorage.getItem("t1i")
t1f=localStorage.getItem("t1f")

      d2=t1f-t1i;
     console.log("****NaoH used Difference here is--->>**"+d2);
     var x= d2/1000;
     console.log("****x--->>**"+x);
     x= x * 20;
     console.log("****final x--->>**"+x);
     up =x+0.01;
     down=x-0.01;
     console.log("Question 13 range is :"+down +"to "+up);
     ////////////////////////////////////////////////////////////
          t1i=localStorage.getItem("t1i")
         t1f=localStorage.getItem("t1f")
         t2f=localStorage.getItem("t2f")
         t3f=localStorage.getItem("t3f")
         t4f=localStorage.getItem("t4f")
         //t5f=localStorage.getItem("t5f")
          console.log("Burette readings are t1i:"+t1i+"t1f: "+t1f+" t2f"+t2f+" t3f:"+t3f+"t4f:"+t4f);   
          wm1=t1f-t1i;
          wm2=t2f-t1f;
          wm3=t3f-t2f;
          wm4=t4f-t3f;
          console.log("NaoH differences(NaoH used in titration) are  d1:"+wm1+"d2: "+wm2+" d3"+wm3+" d4:"+wm4);
          
          v1=wm1/1000;
          v2=wm2/1000;
          v3=wm3/1000;
          v4=wm4/1000;
         
          v1=v1*20;
          v2=v2*20;
          v3=v3*20;
          v4=v4*20;
         
          
          console.log("Molarity of HCL/ Volumes are v1:"+v1+"v2: "+v2+" V3"+v3+" v4:"+v4);              
       
          
          sum= v1+v2+v3+v4;
          avg=sum/4;
          
          console.log("Average is"+avg);          
          
          
          avgup=avg+0.01;
          avgdown=avg-0.01;

          console.log("Average Range up:"+avgup+"Down: "+avgdown);
          
   vv1=v1-avg;
   vv2=v2-avg;
   vv3=v3-avg;
   vv4=v4-avg;
  
   
console.log("Volumes Variances are v1:"+vv1+"v2: "+vv2+" V3"+vv3+" v4:"+vv4);       

a1=vv1*vv1; 
a2=vv2*vv2;
a3=vv3*vv3;
a4=vv4*vv4;

console.log("Volumes Variances Sqaure are v1:"+a1+"v2: "+a2+" V3"+a3+" v4:"+a4);       

a=a1+a2+a3+a4;
a=a/4;
a=Math.sqrt(a);

console.log("StDEv is "+a)
aup=a+5;
adown=a-5;
console.log("STDEV UP"+aup)
console.log("STDEV Down"+adown)

rsd=a/avg;
rsd=rsd*1000;


rsdup=aup/avg;
rsdup=rsdup*1000;

rsddown=adown/avg;
rsddown=rsddown*1000;

console.log("RSD :"+rsd);
console.log("RSD MAX:"+rsdup);
console.log("RSD Min:"+rsddown);
console.log("Q.13 Range"+down+" to "+up);
     
     ///////////////////////////////////////
}
 if(id==14+"t"){

	 up=avgup;
	 down=avgdown;
	 console.log("Q.14 Range of avg "+down+" to "+up);

 }
 if(id==15+"t"){

     up=rsdup;
     down=rsddown;
     console.log("Q.15 Range"+down+" to "+up);
    
 }
 
 
     if(inval < up && inval > down){
         //alert("Qualified");
         counterr=0;
         $("#"+id).toggleClass('active'); 
         $("#"+id).prop("disabled",true);
         
         for( i=1;i<17;i++){
             
            // console.log(i);
            
          
             if(id == 10+"t"){
                 t1initial=inval;
             $("#t1initial").val(t1initial);
           //  var myElem = document.getElementById("q77");
         //    if (myElem === null) alert('does not exist!');
             $("#q77").show("slow");
             console.log("See the first div");
             }
             if(id==11+"t"){
            	    mass1=inval;
                    document.getElementById("text1").innerHTML =
                        mass1; 
                    $("#text1").val(mass1);
                
                    reading[0]=t1initial;
                    reading[1]=mass1;
                    
             }
             if(id==15+"t"){
            	 $("#q44").show("slow");
             }
             /* if(id == 5+"t"){
                 mass1=inval;
                 document.getElementById("text1").innerHTML =
                     mass1; 
                 $("#text1").val(mass1);
               // document.getElementById("mastrial").innerHTML="MassTrial 1:"; 
                 
             } */
             
             
             /* if(id==6+"t"){
                 alert("Here");
                 $("#q78").show("slow");
                 
             }
 */
             if(id == i+"t" && i<noOFQ){
                            k=i+1;
                            $("#q9"+k).show("slow");
                            console.log(k+"shown");
                           $("#tabs").tabs("option", "active", i);
                            
                           }
                           
         }
     
     if(id ==noOFQ+"t"){
         console.log("Last tab")
         $("#q66").show("slow");
         $("#tabs").tabs("option", "active", noOFQ);
    
         
          }
             
     res = id.split("t");
     localStorage.setItem("seccurrQ", res);
     
     console.log("seccurrQ"+localStorage.getItem("seccurrQ"));
         
         
        
    }else{
    	if(counterr==2){
            var text3= "Hint3:"+decodeURIComponent(document.getElementById(hid2).value)
            document.getElementById("hint_"+id).innerHTML =
                text3;
            counterr=0;
            }else if(counterr==1){
                var text2= "Hint 2:"+decodeURIComponent(document.getElementById(hid1).value)
                document.getElementById("hint_"+id).innerHTML =
                    text2;
                counterr=2;
                }else  if(counterr==0){
       var text1= "Hint1:"+decodeURIComponent(document.getElementById(hid0).value)
       document.getElementById("hint_"+id).innerHTML =
           text1;
       counterr=1;
       }
    }
     
}
    </script>



    <script>
    var map = [];
    var attempt = 0;
    function doAttempt(){
        var smallMap = {}; 
        var t1 = $("#text1").val();
        var t2 = $("#text2").val();
        var t3 = $("#text3").val();
        var t4 = $("#text4").val();
        attempt++;
        smallMap["attempt"] = attempt;
        smallMap["reading1"] = t1;
        smallMap["reading2"] = t2;
        map.push(smallMap);
        var smallMap = {};
        attempt++;
        smallMap["attempt"] = attempt;
        smallMap["reading1"] = t3;
        smallMap["reading2"] = t4;
        map.push(smallMap);
         sendAtt();
    }
    


    function sendAtt(){
        
        console.log(reading);
        
        var jsonMap = JSON.stringify(reading);

       console.log(jsonMap);
        
/*     $.ajax({
          method: "POST",
          url: "./CartCon",
          data: { q: jsonMap+globe }
        })
          .done(function( msg ) {
            console.log( "Data Saved: " + msg );
          });*/
          
          var varName = 7;
          
          localStorage.setItem("t1i",reading[0]);
          localStorage.setItem("t1f",reading[1]);
          
          
          localStorage.setItem("t2f",reading[2]);
          localStorage.setItem("t3f",reading[3]);
          localStorage.setItem("t4f",reading[4]);
        //  localStorage.setItem("t5f",reading[5]);
          console.log("reading"+localStorage.getItem("reading"));

          
              
         t1i=localStorage.getItem("t1i")
         t1f=localStorage.getItem("t1f")
         t2f=localStorage.getItem("t2f")
         t3f=localStorage.getItem("t3f")
         t4f=localStorage.getItem("t4f")
        // t5f=localStorage.getItem("t5f")
         
         
              console.log(t1i+"are"+t1f+"are"+t2f+"are"+t3f+"are"+t4f+"are");
          
          window.location.href="Attempttwo.jsp?json="+jsonMap+"&currQ="+varName; 
    
    }   
    
  function check(ele){
    
    var id = $(ele).attr("id");
    var answer=$(ele).attr("value");
  //  alert("Actual answer:"+answer);
  //  alert("Question no"+id);
   // var i=id;
   // var s= i+"b";
ans=id+answer;   
    if(document.getElementById(ans).checked){
        //alert("---"); 
         document.getElementById(ans).disabled = true;
    
         $("#"+id).toggleClass('active');
         $("#"+id).prop("disabled",true);
    
    }
  }
    </script>
    <script>
    function getitcheck(ele)
    {
         var id = $(ele).attr("id");
            var answer=$(ele).attr("value");
           // alert("Actual answer:"+answer);
        //   alert("Question no"+id);
    inpans="ans"+id;
    if(document.getElementById(inpans).value==answer)
        {
    //  alert("Right Answer");
         $("#"+id).toggleClass('active');
         $("#"+id).prop("disabled",true);
        }
    }
/*   // alert(parseInt('"answer"'));
   <!--  //var opt= $(ele).attr("opt");
    //alert(opt);
  console.log("id---" +id);
 // alert(parseInt('"answer"'));   
//  int ans =Integer.parseInt(answer);
  
  var ans=id+answer;
  console.log("radio id - "+ans);
  h="hint";
  hid=h+id;
  console.log("combined id - "+hid);
  var i;
  var text= "Hint:"+document.getElementById(hid).value
  console.log("HINT--"+text);
  for (i = 1; i <= 3; i++) {
        
                      if(document.getElementById(ans).checked) {
                          $("#"+id).toggleClass('active');
                           $("#"+id).prop("disabled",true);
                           document.getElementById(ans).disabled = true;
                           }else{
                          document.getElementById("hint_"+id).innerHTML =
                                text; 
                      }
         
                      
                     
                     
      
       }
  --> 
     */

</script>


</body>
</html>