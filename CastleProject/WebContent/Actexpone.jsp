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
<title>Module4</title>

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

#q77, #q78, #89,#q44,#q45 {
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
    PriorityQueue<Question> pp=(PriorityQueue<Question>)dk.QchcekBox(4);
    int noofQ=pp.size();
  //  out.println(pp.size());
    String ss=request.getParameter("json");
    if(ss!=null){
    	pageContext.setAttribute("firstcurrQ", ss);
    	request.setAttribute("firstcurrQ", ss);
    //	out.println("ss is"+ss);
        
    }
    
   String q1=dk.getQuestion(4,14);
   String q2=dk.getQuestion(4,15);
   
    %>


	<h1>
		<strong>CASTLE</strong>
		Chemistry Laboratory System
	</h1>
	<h2>Experiment-I</h2>
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

				<!-- <article id="questionTab"> <section class="main"> -->

				<div id="tabs">


					<ul>


						<%for(int i=1;i<noofQ-1;i++){
                                 
                                // int i=k+1;
                                    %>
						<li><a href="#tabs<%=i%>" id="q9<%=i%>">Q.<%=i %></a></li>
						<% 
                                 }
                               %>
					</ul>
					<%
                           for(int i=1;i<noofQ-1;i++){
                        	  // int i=k+1;
                        	  
                        	  
                        	  
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
               if(!pp.isEmpty()){
                     q=pp.poll();
               }else{
            	   System.out.println("Over");
                     
               }
                 
                 
                 String a=q.getQuestion();
                 
                 out.println(a);
                 System.out.println(i+"------------>"+a);
/*                  if(i==13){
                     q=pp.poll();
                     String b=q.getQuestion();          
                     out.println("================>"+b);
                 } */
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
								
		<input type="hidden" id="ahint<%=i%>e" value=<%=h1 %> maxlength="100"> 
		<input type="hidden" id="ahint<%=i%>"value=<%=h1 %> maxlength="100"> 
		<input type="hidden" id="bhint<%=i%>" value=<%=h2 %> maxlength="100">
		<input type="hidden" id="chint<%=i%>" value=<%=h3 %> maxlength="100">

        <input type="hidden" id="ahint<%=i%>t"value=<%=h1 %> maxlength="100"> 
        <input type="hidden" id="bhint<%=i%>t" value=<%=h2 %> maxlength="100">
        <input type="hidden" id="chint<%=i%>t" value=<%=h3 %> maxlength="100">


								
							<%-- 	<table><%if(q.getQ_txt_id()!=0){ %>
                            
                            <button type="submit" id=<%=i%>p onclick="checkk(this)">Submit</button>
                            
                            </table> --%>
                           <%--  <%} %> --%>
								
								 <table>
									<% if(q.getQ_num_id()!=0){
                	  
                	  if(i!=7){
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
											
										<%if(i!=5 && i!=10 && i!=11 && i!=12 && i!=13 ){ %>	
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
								 <button type="submit" id=<%=i%> onclick="checkk(this)" value=<%=s%>>Submit</button>
								<br>
								<br>

								<%}%>
							</div>

						</div>
					</div>



					<%} %>
</div>
				<!-- </section> </article> -->
				<% pp.clear(); %> 
				</br> </br> </br>  </br>

       <div id="q77">
        <br> Empty flask Weight:<input type="text" id="emptyflask">g.<br>
        MassTrial One:<input type="text" id="text1">g.<br>
        <button id="att" onclick="Enter()">Enter</button>
        <br>
        <p id="hintagain"></p>
    </div>

    <div id="q44">
    Question:<%=q1 %>
    <br>
<!--     <input id="qa14" type="text" />
 -->   
  <textarea  placeholder="Explanation" rows="4" cols="35"></textarea>
        <button onclick="qtxt(this)" id="q14">Submit</button>





    </div>
    
    <div id="q45">
  Question:<%=q2 %>
    <br>
    
    <textarea  placeholder="Explanation" rows="4" cols="35"></textarea>
    
        <button onclick="qtxt(this)" id="q15">submit</button>





    </div>




			</div>

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


	<div id="q78">
		<table>
			<tr>
				<td><p id="mastrial"></p>
					<input id="triall" type="text" /></td>
				<td>
					<button id="attmass" onclick="AddMass()">New Mass trial</button>
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







	<div id="q66">
		<a href="Actexptwo.jsp?num=1">Go_For_Next</a>
	</div>

	<script>
	
 var emptyflask=0;
 var mass1=0;
 var reading=[];
 var counter=1;
 var den=0;
 var rsd=0;
 var rsdup=0;
 var rsddown=0;
 var Percenterror=0;
 var Percenterrorup=0;
 var Percenterrordown=0;
 function Enter(){
	 var inval=parseFloat($("#emptyflask").val());
	 var massk=parseFloat($("#text1").val());
	 upper=inval+5.2;
	 lower=inval+4.8;
	 
	 if(inval<25 && inval>12){
	  
	  emptyflask= parseFloat($("#emptyflask").val());
	 
	          if(massk<upper && massk>lower){ 
	         mass1=massk;
	         //parseFloat($("#emptyflask").val());
	         document.getElementById("hintagain").innerHTML =" New EmptyFlask and MassTrial one entered";
	         counter=1;
	        
	         document.getElementById("flask").innerHTML="";
	         document.getElementById("masst1").innerHTML="";
	        	          }
	          else
	          {
	        	    document.getElementById("hintagain").innerHTML ="Only New EmptyFlask mass entered choose new MassTrial 1 within Range";
  
	          }
	 }
	 else
	 {
		 document.getElementById("hintagain").innerHTML ="The mass of your flask is different than expected, please try again.";
	 }
	  console.log("NEW Flask weight is"+emptyflask+mass1);
  
 }
  </script>
  <script>
  function qtxt(ele){
	  console.log("came");
	  var id = $(ele).attr("id");
	  console
	  if (id=="q14")
	     {
	         $("#"+id).toggleClass('active'); 
	         $("#"+id).prop("disabled",true);
	         $("#q45").show();
	     
	     }
	     else if (id=="q15")
	     {
	    	 console.log("here");
	        // $("#"+id).toggleClass('active'); 
	        // $("#"+id).prop("disabled",true);
	         $("#q66").show();
	       //  $("#tabs").tabs("option", "active", 15);
	     }
	  
  }
  </script>
	<script>
  function AddMass(){
	  
	    reading[0]=emptyflask;
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
	       loww=prev+4.7;
	       upp=prev+5.3;
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
        loww=prev+4.7;
        upp=prev+5.3;
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
     loww=prev+4.7;
     upp=prev+5.3;
     if( masstrial>loww && masstrial<upp){
         document.getElementById("msg").innerHTML ="Mass Trial 4 entered";
         reading[4]=masstrial;
         document.getElementById("masst4").innerHTML="Masstrial 4:"+reading[4];
         counter++;
     }
     else{
         document.getElementById("msg").innerHTML ="Mass Trial 4 out of range..Try Again";
     }

}else if(counter==4){  
    var prev =parseFloat(reading[4]);
    loww=prev+4.7;
    upp=prev+5.3;
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

}
//	sendAtt();
	   
	  
	
	  
  }
  </script>




	<script>
function myFunction() {
    var myWindow = window.open("", "myWindow", "width=900, height=300");
 myWindow.document.write("<table border='1'>"+"<tr><td>index</td><td>A</td><td>B</td><td>C</td><td>D</td><td>E</td><td>F</td><td>G</td><td>H</td>");
 myWindow.document.write("</tr><tr><td>1</td><td>Trial</td><td>Initial Mass(g)</td><td>Final Mass (g)</td><td>Mass of Water (g)</td><td>Volume of Water(mL)</td><td>Average(mL)</td><td>RSD(ppt)</td>");
 myWindow.document.write("<td>Percent Error</td></tr><tr><td>2</td> <td> 1 </td><td>  emptyflask </td><td> masstrial1 </td><td> mass1=C3-B3 </td><td>vol1=D2/density</td>");
 myWindow.document.write("<td> avg=AVERAGE(E2:E6)</td><td>  stdev=stvdev(E2:E6)/F2*1000</td><td> PE=ABS(F2-5)/5*100</td></tr>");
 myWindow.document.write("<tr><td>3</td><td>2</td><td>masstrial1</td><td> masstrial2 </td><td> mass2=C4-B4</td><td> vol2=D3/density</td></tr>");
 myWindow.document.write("<tr><td>4</td><td>3</td><td>masstrial2</td><td>  masstrial3</td><td>  mass3=C5-B5</td><td> vol3=D4/density</td></tr>");
 myWindow.document.write("<tr><td>5</td><td>4</td><td>masstrial3</td><td>  masstrial4</td><td>  mass4=C6-B6</td> <td>vol4=D5/density</td></tr>");
 myWindow.document.write("<tr><td>6</td><td>5</td> <td>  masstrial4</td> <td> masstrial5 </td> <td>mass5=C7-B7 </td><td>vol5=D6/density</td></tr></table>");


 
 myWindow.document.write("<br><br><h2>Example</h2><br><br>");
 
 myWindow.document.write("<table border='1'><tr><th> </th><th>A</th><th>B</th><th>C</th><th>D</th><th>E</th></tr>");
 myWindow.document.write("<tr><td>1</td><td>Trial</td><td>Initial Mass(g)</td><td>Final Mass(g)</td><td>Mass of Water(g)"+
                     +"</td><td>Volume of Water(ml)</td></tr>");
 myWindow.document.write("<tr><td>2</td><td>1</td><td>Emptyflask</td><td>Masstrial1</td><td>=C2-B2</td><td>=D2/0.9982</td></tr></table>");
 
 
 
}


</script>
<script>
function calculate(){
	
emptyflask=	reading[0];
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
    counterr=0;
	  console.log("set");   
     firstcurrQ="<%= request.getAttribute("firstcurrQ") %>"
     console.log("***************************************************************************"+firstcurrQ) 
     
    // firstcurrQ=  "<% request.getAttribute("firstcurrQ"); %>";
    var noOFQ = $("#hiddens").val();
    
   if(firstcurrQ!=6){
    for(i=1;i<=noOFQ; i++){
        if(i != 1){
         $("#q9"+i).hide();
         
      }
     }
    $("#q44").hide();
    $("#q45").hide();
    
      $("#q66").hide();
      $("#q77").hide();
      $("#q78").hide();
      $("#q88").hide();
      $("#q89").hide();
   
      countt=0;
   }else{
	   
	 
	  
	    console.log("***************************************************************************"+firstcurrQ)  
	  firstcurrQ= "<%= pageContext.getAttribute("firstcurrQ", PageContext.SESSION_SCOPE) %>";
	  
    console.log("***************************************************************************"+firstcurrQ)   
	   
	  var firstcurrQ = parseInt(firstcurrQ);
    firstcurrQ= parseFloat($("#firstcurrQ").val());
	    console.log("***************************************************************************"+firstcurrQ)   
	   
	console.log(" some Attempted")
	console.log("***************************************************************************"+firstcurrQ)   
	for(i=1;i<7; i++){
	        
	         $("#q9"+i).show();
	         
	         $("#"+i).toggleClass('active');
             $("#"+i).prop("disabled",true);   
	      
             $("#"+i+"t").toggleClass('active'); 
             $("#"+i+"t").prop("disabled",true);
	  }
	    $("#q44").hide();
	      $("#q45").hide();
	      
	    $("#q66").hide();
	     
	    $("#q77").hide();
	      $("#q78").hide();
	      
	      $("#q88").hide();
	      $("#q89").show();
	   for(i=8;i<=noOFQ; i++){
	       
		   var temp = i+1;  
		   $("#q9"+temp).hide();
	         var temp = i+1;
          //   $("#q9"+temp).show();
             //alert("111")
             $("#tabs").tabs("option", "active", 7);
	      
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
console.log("id is-->"+id);
 console.log("answer is-->"+answer);

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
 // alert("hid0---> "+hid0);
// alert("combined id - "+hid);
  var i;
  console.log(document.getElementById(hid0).value);
  console.log($("#"+hid0).val());
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
                           localStorage.setItem("firstcurrQ", id);
         
                           console.log("firstcurrQ"+localStorage.getItem("firstcurrQ"));
                           
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
function getitchecked(ee)
{
     var id;
     var id = $(ee).attr("id");
     hid0="ahint"+id;
     hid1="bhint"+id;
     hid2="chint"+id;
     
     if(id==13+"t"){
    	 $("#"+id).toggleClass('active'); 
         $("#"+id).prop("disabled",true);
       
    	 $("#q44").show();
     
     }
  //  var answer=$(ee).attr("value");
//alert(id);
//alert(answer);
if(id!=13+"t"&&id!=14+"t"&&id!=15+"t"){
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
     
      if(id==5+"t"){
        up=emptyflask+5.3;
        down=emptyflask+4.7;
          console.log("for 5th Q between"+up+"and"+down);
       //   alert(up);
         //  alert(down);
          // alert(inval);
                  }
     
      if(id==10+"t"){
    	 m1=  parseFloat(localStorage.getItem("m1"));
    	 
          m2= parseFloat(localStorage.getItem("m2"));
         console.log("Q10th initial and m1 is"+m1+","+m2)
    	d1=  m2/m1;
    	console.log("Q 10th :Final-initial mass = "+d1);
    	vol=d1/0.9982;
    	console.log("Exact Volume = "+vol);
        
    	up= vol+0.1;
    	down=vol-0.1;
    	console.log("Range for Q10th: "+down+"to"+up );
        
      }
      
      if(id==11+"t"){
    	  m1=  parseFloat(localStorage.getItem("m1"));
          m2= parseFloat(localStorage.getItem("m2"));
          m3= parseFloat(localStorage.getItem("m3"));
          m4= parseFloat(localStorage.getItem("m4"));
          m5= parseFloat(localStorage.getItem("m5"));
          m6= parseFloat(localStorage.getItem("m6"));
          console.log("masses are m1:"+m1+"m2: "+m2+" m3"+m3+" m4:"+m4+"m5:"+m5);   
          wm1=m2-m1;
          wm2=m3-m2;
          wm3=m4-m3;
          wm4=m5-m4;
          wm5=m6-m5;
          console.log("differences are  d1:"+wm1+"d2: "+wm2+" d3"+wm3+" d4:"+wm4+"d5:"+wm5);
          v1=wm1/den;
          v2=wm2/den;
          v3=wm3/den;
          v4=wm4/den;
          v5=wm5/den;
 console.log("Volumes are v1:"+v1+"v2: "+v2+" V3"+v3+" v4:"+v4+"v5:"+v5);              
          sum= v1+v2+v3+v4+v5
          avg=sum/5;
          console.log("Average is"+avg);          
          up=avg+0.1;
          down=avg-0.1;

          console.log("Q11 Range up:"+up+"Down: "+down);
          
   vv1=v1-avg;
   vv2=v2-avg;
   vv3=v3-avg;
   vv4=v4-avg;
   vv5=v5-avg;
   
console.log("Volumes Variances are v1:"+vv1+"v2: "+vv2+" V3"+vv3+" v4:"+vv4+"v5:"+vv5);       

a1=vv1*vv1; 
a2=vv2*vv2;
a3=vv3*vv3;
a4=vv4*vv4;
a5=vv5*vv5;

console.log("Volumes Variances Sqaure are v1:"+a1+"v2: "+a2+" V3"+a3+" v4:"+a4+"v5:"+a5);       

a=a1+a2+a3+a4+a5;
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

Percenterror= Math.abs(avg-5);
Percenterror= Percenterror *20;
Percenterrorup=Percenterror+0.5;
Percenterrordown=Percenterror-0.5;
console.log("Percent Error :"+Percenterror);
console.log("Percent Error up :"+Percenterrorup);
console.log("Percent Error down :"+Percenterrordown);

      }
if(id==12+"t")
{
	console.log("RSD is:"+rsd)
	up=rsdup;
    down=rsddown;
	console.log("RSD range:"+down+" to  "+up);
    
	}
if(id==13+"t")
{
	console.log("Percent Error :"+Percenterror);
	console.log("Percent Error up :"+Percenterrorup);
	console.log("Percent Error down :"+Percenterrordown);
    up=Percenterrorup;
    down=Percenterrordown;
    console.log("P.E. range:"+down+" to  "+up);
    
    }	
	
	
if(inval < up && inval > down){
         //alert("Qualified");
         $("#"+id).toggleClass('active'); 
         $("#"+id).prop("disabled",true);
         counterr=0;
       
             if(id == 3+"t"){
            	 console.log("3t");
            	 emptyflask=inval;
             $("#emptyflask").val(emptyflask);
            /*  alert(1);
            var k= document.getElementById("q77"); 
             
            k.style.display = 'block';
             *///
             $("#q77").show();
           //  $("#q77").show();
            // $("#q66").show();
            // $("#q89").show();
             
     /*         var myElem = document.getElementById("q77");
             if (myElem === null) alert('does not exist!');
             document.getElementById("q77").style.display = 'block';
             document.getElementById("q77").style.visibility = "visible";
 */
          //   alert(2);
             }
             
             if(id == 5+"t"){
                 mass1=inval;
                 document.getElementById("text1").innerHTML =
                     mass1; 
                 $("#text1").val(mass1);
               // document.getElementById("mastrial").innerHTML="MassTrial 1:"; 
                reading[0]=emptyflask;
                reading[1]=mass1;
                 
                        }
             if(id==9+"t"){
                 
                 if(inval==18){
                     den=0.9986;  
                 }
                
                 if(inval==19){
                     den=0.9984;  
                 }
               
                 if(inval==20){
                     den=0.9982;  
                 }
               
                 if(inval==21){
                     den=0.9980;  
                 }
               
                 if(inval==22){
                     den=0.9977;  
                 }
               
                 if(inval==23){
                     den=0.9975;  
                 }
               
                 if(inval==24){
                     den=0.9973;  
                 }
               
                 if(inval==25){
                     den=0.9970;  
                 }
               
                 if(inval==26){
                     den=0.9967;  
                 }
               
                 if(inval==27){
                     den=0.9965;  
                 }
               
                 
                 console.log("Question 9  density is set"+den);
             }
             for( i=1;i<17;i++){
             
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
     localStorage.setItem("firstcurrQ", res);
     
     console.log("firstcurrQ"+localStorage.getItem("firstcurrQ"));
         
         
        
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
                 }else	if(counterr==0){
    	var text1= "Hint1:"+decodeURIComponent(document.getElementById(hid0).value)
    	document.getElementById("hint_"+id).innerHTML =
            text1;
    	counterr=1;
    	}

    	
    	
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
          
          localStorage.setItem("reading",reading);
          localStorage.setItem("m1",reading[0]);
          localStorage.setItem("m2",reading[1]);
          localStorage.setItem("m3",reading[2]);
          localStorage.setItem("m4",reading[3]);
          localStorage.setItem("m5",reading[4]);
          localStorage.setItem("m6",reading[5]);
          console.log("reading"+localStorage.getItem("reading"));

          
          jlist=localStorage.getItem("reading");
          console.log(localStorage.getItem("m1"));
         console.log(localStorage.getItem("m2"));
              
         m1=localStorage.getItem("m1")
         m2=localStorage.getItem("m2")
         m3=localStorage.getItem("m3")
         m4=localStorage.getItem("m4")
         m5=localStorage.getItem("m5")
         m6=localStorage.getItem("m6")
         
         
              console.log(m1+"are"+m2+"are"+m3+"are"+m4+"are"+m5+"are"+m6);
          
    window.location.href="Attempt.jsp?json="+jsonMap+"&currQ="+varName; 
    
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
    //	alert("Right Answer");
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