<%@page import="java.io.Console"%>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PreAsignmtSectOne</title>

<link rel="stylesheet" href="./css/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><!-- <for header n footer> -->
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
  

<style>
body {
    background-color: #E1D7FA;
     }
.active{background-color:#CCFF66;}
</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body onload="loadPage()">

<% 
String name=request.getParameter("name");
String expname=name;
System.out.print("name"+name);
String username=(String)session.getAttribute("username");


%>


<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/castle" user="root" password="rootSquare89" />

    <div id="error"
        style="color: red; font-family: arial; text-align: center; z-index: 99; position: relative;"></div>
    <div class="container">


        <header>

        <h1>
          <strong>CASTLE</strong>
          <p>Chemistry Laboratory System</p> 
        </h1>

        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

        </header>
        <div >    
       <h3>Welcome <%=username %>, Lab Comprehension Assessment -Section ONE start here</h3>
    </div>

      <section class="main"> 
      
      
            
          <div>     
    </div>  
            
            
            
             <div id="tabs" style="left: 50px; right:200px;">
        <ul>
            <li><a href="#tabs-1">Pre-Assignment</a></li>
            <li><a href="#tabs-2">Questions</a></li>
        </ul>
        <div id="tabs-1">
            <div id="horizBorder"></div>
            <div id="register">
                
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from expdet where expno ='${param.num}'  
                                    
            </sql:query>

                <div align="left">
              
                    <table border="0" cellpadding="5">
                        <c:forEach var="stud" items="${listMenu.rows}">
                         <caption>
                            <h2><c:out value="${stud.expname}" /></h2>
                          </caption>
                           
                          
                                              
                 
                 <tr>
                  <td><c:out value="${stud.pretextone}" /></td> 
                  </tr>
                  <tr>
                  <td><img src="${stud.preimagepath}" alt="${stud.preimagename}" width="700px">
                  </td>                    
                  </tr>
                  <tr>
                  
                  <td><c:out value="${stud.pretexttwo}" /></td> 
                  </tr>
                </c:forEach>
                    </table>
             
                
          
                </div>
            </div>
        </div>
         
         
         
         
         
         <div id="tabs-2">
            <div id="horizBorder"></div>
            <div id="register">
             
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from expdet where expno='${param.num}'
                                    
            </sql:query>
 <c:forEach var="stud" items="${listMenu.rows}">
                <c:set var="num" value="${stud.expno}"/>
                </c:forEach>
                
                


                <div align="left">
              
                    <%int counter=1; %>  
      <!-- /////////////////////////////////////////////////////////////////////              
       -->       
             <div id="tabss" style="auto;" onload="reload();">
             <ul>
             <li><a href="#tabss-7" id="q1">First Question</a></li>
             <li><a href="#tabss-3" id="q2">Second Question</a></li>
             <li><a href="#tabss-4" id="q3">Third Question</a></li>
            <li><a href="#tabss-5" id="q4">Fourth Question</a></li>
            <li><a href="#tabss-6" id="q5">Fifth Question</a></li>
          
            
             </ul>
          <div id="tabss-7">
             
            <div id="horizBorder"></div>
            <div id="register">
                
               
             

                <div align="left">
                
                 <sql:query var="listMenuu" dataSource="${myDS}">
                    select * from objectiveque where expno='${param.num}' and queno=?
                    
                     <sql:param value="${'1'}"/>                
                </sql:query> 
              
                    
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 <tr>
                <h4>Question:1</h4>   
                 
                  <td><c:out value="${stud.que}" /></td> 
                  </tr>
                  <tr>
                  
                  <td> <p id="hint_one"></p> 
                  
                  <input type="hidden" id="hintone" value="${stud.hint}" >
                  </td> </tr>
               
                    
               
                <h4>options:</h4>   
                    
             

                 <tr>
                  <td><input type="radio" name="opt" id="onea" value="one"> <c:out value="${stud.optone}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt" id="oneb" value="two"> <c:out value="${stud.opttwo}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt" id="onec" value="three"> <c:out value="${stud.optthree}" /><br></td> 
                  </tr>
                  <tr>
                  
                  <td><input type="radio" name="opt" id="oned" value="four"> <c:out value="${stud.optfour}" /><br><br></td> 
                  </tr>
                  <button  id="one" onclick="check(this)" value="${stud.answer}">Submit</button>
                </c:forEach>
                    
          
                
                </div>
            </div>
        </div>
        
        
        
        <div id="tabss-3">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
               <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from objectiveque where expno='${param.num}' and queno=?
                     
                     <sql:param value="${'2'}"/>                
                </sql:query> 
                    
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 <tr>
                 <h4>Question:2</h4>
                  <td><c:out value="${stud.que}" /></td> 
                  </tr>
                  <tr>
                  
                  <td> <p id="hint_two"></p> 
                  
                  <input type="hidden" id="hinttwo" value="${stud.hint}" >
                  </td>
                  </tr>
               
                    

               
                <h4>options:</h4>   
                    
                

                 <tr>
                  <td><input type="radio" name="opt" id="twoa" value="twoone"> <c:out value="${stud.optone}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt" id="twob" value="twotwo"> <c:out value="${stud.opttwo}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt" id="twoc" value="twothree"> <c:out value="${stud.optthree}" /><br></td> 
                  </tr>
                  <tr>
                  
                  <td><input type="radio" name="opt"  id="twod" value="four"> <c:out value="${stud.optfour}" /><br><br></td> 
                  </tr>
                  
                  <button  id="two" onclick="check(this)" value="${stud.answer}">Submit</button>
                </c:forEach>                    
                    
       
              
         
                </div>
            </div>
        </div> 
                    
       
              <div id="tabss-4">
             
            <div id="horizBorder"></div>
            <div id="register">
            
            
             

                <div align="left">
              
                    <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from objectiveque where expno='${param.num}' and queno=?
                 
                     <sql:param value="${'3'}"/>     </sql:query>
                    <c:forEach var="stud" items="${listMenuu.rows}">
                 <tr><h4>Question 3:</h4> 
                  <td><c:out value="${stud.que}" /></td> 
                  </tr>
                  <tr>
                  
                  <td> <p id="hint_three"></p> 
                  
                  <input type="hidden" id="hintthree" value="${stud.hint}" >
                  </td> </tr>
              
                                      
                                               
                 
                <h4>options:</h4>   
                    
                 
                <tr>
                  <td><input type="radio" name="opt" id="threea"  value="one"> <c:out value="${stud.optone}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt"  id="threeb" value="two"> <c:out value="${stud.opttwo}" /><br></td> 
                  </tr>
                  <tr>
                  <tr>
                  <td><input type="radio" name="opt"  id="threec" value="three"> <c:out value="${stud.optthree}" /><br></td> 
                  </tr>
                  <tr>
                  
                  <td><input type="radio" name="opt" id="threed"  value="four"> <c:out value="${stud.optfour}" /><br><br></td> 
                  </tr>
                  <button  id="three" onclick="check(this)" value="${stud.answer}">Submit</button>
                </c:forEach>
                    
         
                  
                </div>
            </div>
        </div>        
                   
                     <div id="tabss-5">
             
            <div id="horizBorder"></div>
            <div id="register">
               
                
           
             

                <div align="left">
                <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from objectiveque where expno='${param.num}' and queno=?
                
                     <sql:param value="${'4'}"/>     </sql:query>
              
                    
                    <c:forEach var="stud" items="${listMenuu.rows}">
                 <tr>
                  <%-- <label id="ansfourlow" value="${stud.down}"><h4>Question 4:</h4> </label> --%> 
                 
                  <td><c:out value="${stud.que}" /></td> 
                  </tr>
                  <tr>
                  
                  <td> <p id="hint_four"></p> 
                  
                  <input type="hidden" id="hinttwo" value="${stud.hint}" >
                  </td>
                  </tr>
                <input type="hidden" id="fourup" value="${stud.up}" >
                <input type="hidden" id="fourdown"value="${stud.down}" >
                    
                <h4> Answer: </h4><input type="text" id="ansfour" >
                    
                     
                
            
                  </c:forEach>
          
          <button type="submit" id="four" onclick="getitchecked(this)" name="submit">
                   Submit 
                </button>
                </div>
            </div>
        </div> 
                   
                   
            <div id="tabss-6">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
         
             

                <div align="left">
              
              <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from objectiveque where expno='${param.num}' and queno=?
                    
                     <sql:param value="${'5'}"/>     </sql:query>
              
                    
                    <c:forEach var="stud" items="${listMenuu.rows}">
                 <tr>
                  <%-- <label id="ansfourlow" value="${stud.down}"><h4>Question 4:</h4> </label> --%> 
                 
                  <td><c:out value="${stud.que}" /></td> 
                  </tr>
                  <tr>
                  
                  <td><c:out value="${stud.hint}" /></td> 
                  </tr>
                <input type="hidden" id="fiveup" value="${stud.up}" >
                <input type="hidden" id="fivedown"value="${stud.down}" >
                    
                <h4> Answer: </h4><input type="text" id="ansfive" >
                    
                    
                
            
                  </c:forEach>
          
                    
                    
              
              
             <!--  <form action="PreasgmtCon" method="post">
              -->   <button type="submit" id="five" onclick="getitchecked(this)" value="<%=name%>">
                   Submit 
                </button>
            
           
            <div id="q6">
       
          <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from objectiveque where expno='${param.num}' and queno=?
                    
                     <sql:param value="${'5'}"/>
           
           </sql:query>
           <c:forEach var="stud" items="${listMenuu.rows}">
           <a href="PreasgmtSecttwo.jsp?num=${stud.expno}">Go_For_Next</a>
            </c:forEach>
            
            </div> 
           
           
      
            
                 <!--  </form>
           -->
                </div>
            </div>
        </div> 
                   
                   
                   
                 </div>  
                    
        
                
          
                </div>
            </div>
        </div>
        

        
        
        
   </div>
            
            
            
            
            
            
            
            <br><br>
      
      
      
      
      
     
        
        </section>
    
   
    
   <script>
  function loadPage(){
      $("#q2").hide();
      $("#q3").hide();
      $("#q4").hide();
      $("#q5").hide();
      $("#q6").hide();
      
  }
   
function check(ele){
    
    var id = $(ele).attr("id");
    var answer=$(ele).attr("value");
    //var opt= $(ele).attr("opt");
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
                           if(id == "one"){
                            
                               $("#q2").show("slow"); 
                               $("#tabss").tabs("option", "active", 1);
                           }else if(id == "two"){
                               $("#q3").show("slow");
                               $("#tabss").tabs("option", "active", 2);
                           }else if(id == "three"){
                               $("#q4").show("slow");
                               $("#tabss").tabs("option", "active", 3);
                           }else if(id == "four"){
                               $("#q5").show("slow");
                               $("#tabss").tabs("option", "active", 4);
                           }
                           
                           
                           <%counter=+1; %>
                      }else{
                          document.getElementById("hint_"+id).innerHTML =
                                text; 
                      }
         
                      
                     
                     
      
       }
  
    
}
</script><script>
function getitchecked(ee){
    var id;
    var id = $(ee).attr("id");
  //  var answer=$(ee).attr("value");
alert(id);
//alert(answer);
var ans="ans"+id;


     inval=document.getElementById(ans).value
     var id = $(ee).attr("id");
  var up =id+"up";
  var down=id+"down";
     up=document.getElementById(up).value
     down=document.getElementById(down).value

     
     
     alert(up);
     alert(down);
     up=Number(up);
     down=Number(down);
      inval=Number(inval); 
      
        
     if(inval > up && inval < down){
         $("#"+id).toggleClass('active'); 
         
         $("#"+id).prop("disabled",true);
         
         if(id == "four"){
             $("#q5").show("slow");
             $("#tabss").tabs("option", "active", 4);
         }
         else if(id == "five"){
             $("#q6").show("slow");
             //$("#tabss").tabs("option", "active", 4);
         }
             
             
         
        
    }
     
//    var a = "<div id='abc_"+a+"''>"
}
    </script>
    <script>
    function reload(){
        window.location.reload();}
    </script>
</body>
<!-- </html>
 -->

















<!-- /*




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type = "text/javascript" 
         src = "http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>


<input id="doo"  type="text" >
<button  onclick="doit()">Do_it</button>
<button onclick="getit()">Get_it</button>


<p id="demo"></p>
<p id="demos"></p>
<script>
var count=1;
var text; 
function doit(){
    text="";
var x = document.getElementById("doo").value;
document.getElementById("demo").innerHTML = "Readings taken are:"+count;
 
 var objj = {number: count, value: x}
 
document.getElementById("demos").innerHTML =
    objj.number + "<br>" +
    objj.value ;  

   text=  text +{number: count, value: x};
    
    
    count = +count + 1;

}
</script>
<script>
function getit(){
    
     document.getElementById("demo").innerHTML =
        text; 
    var obj = JSON.parse(text);

     document.getElementById("demo").innerHTML =
    obj.number +" "+    obj.value + "<br>"; 
}
</script>
</body> -->
</html>












