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
<title>PostlabQ</title>

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

</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>

<% 
String name=request.getParameter("name");
String expname=name;
System.out.print("name"+name);
String username=(String)session.getAttribute("username");


%>


<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/castleexpt" user="root" password="rootSquare89" />

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
       <h3>Welcome <%=username %></h3>
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
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
               

                <div align="left">
                 <object width="100%" height=450px data="images/castle.pdf"></object> 
            
              
                   <%--  <table border="0" cellpadding="5">
                         <caption>
                            <h2><%=name %></h2>
                          </caption>
                           
                          
                                              
                 <c:forEach var="stud" items="${listMenu.rows}">
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
                    </table> --%>
             
                
          
                </div>
            </div>
        </div>
         
         
         
         
         
         <div id="tabs-2">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from expdet where expname=?
                     <sql:param value="${'name'}" />                
            </sql:query>
               <c:forEach var="stud" items="${listMenu.rows}">
                <c:set var="num" value="${stud.expno}"/>
                </c:forEach>
                
                


                <div align="left">
              
                    
      <!-- /////////////////////////////////////////////////////////////////////              
       -->       
             <div id="tabss" style="auto;">
             <ul>
             <li><a href="#tabss-7">First Question</a></li>
             <li><a href="#tabss-3">Second Question</a></li>
             <li><a href="#tabss-4">Third Question</a></li>
            <li><a href="#tabs-5">Fourth Question</a></li>
            <li><a href="#tabs-6">Fifth Question</a></li>
            
            
             </ul>
          <div id="tabss-7">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
           
             <form action="PostlabCon" method="post">

                <div align="left">
              
                    
                <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from postlab where quesno=?
                   
                     <sql:param value="${'1'}"/>                
                </sql:query> 
                
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 
                <td> Question:<c:out value="${stud.ques}" /></td>  
                  
                  
                </c:forEach>
                
               
                
                
                
        <textarea  name="ans1" placeholder="" rows="4" cols="50"></textarea>      
          <!--  <p class="submit">
                <button type="submit"  onlclick="check(this)" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p>  -->
                 
                </div>
            </div>
        </div>
        <div id="tabss-3">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
              
             <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from postlab where quesno=?
                   
                     <sql:param value="${'2'}"/>                
                </sql:query> 
                
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 
                <td> Question:<c:out value="${stud.ques}" /></td>  
                  
                  
                </c:forEach>
                
               
                
                
                
               <textarea  name="ans2" placeholder=" " rows="4" cols="50"></textarea>      
  
                    
         <!--  <p class="submit">
                <button type="submit" onclick="check(this)" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            
            </p>  -->
               
         
                </div>
            </div>
        </div> 
                    
            
              <div id="tabss-4">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
             

                <div align="left">
              
                    
                 <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from postlab where quesno=?
                   
                     <sql:param value="${'3'}"/>                
                </sql:query> 
                
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 
                <td> Question:<c:out value="${stud.ques}" /></td>  
                 
                  
                </c:forEach>
                
               
                
                
                
               <textarea  name="ans3" placeholder=" " rows="4" cols="50"></textarea>      
                     
          <!--  <p class="submit">
                <button type="submit" onlclick="check(this)" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p>  -->
                 
                </div>
            </div>
        </div>        
                   
                     <div id="tabs-5">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
             
             

                <div align="left">
              
                    
                  <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from postlab where quesno=?
                   
                     <sql:param value="${'4'}"/>                
                </sql:query> 
                
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 
                <td> Question:<c:out value="${stud.ques}" /></td>  
                 
                  
                </c:forEach>
                
               
                
                
                
               <textarea  name="ans4" placeholder=" " rows="4" cols="50"></textarea>      
           <!--  <p class="submit">
                <button type="submit" onlclick="check(this)" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p>  -->
                  
          
                </div>
            </div>
        </div> 
                   
                   
                     <div id="tabs-6">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
              
                    
                  
                  
                  
                  <sql:query var="listMenuu" dataSource="${myDS}">
                    select *from postlab where quesno=?
                   
                     <sql:param value="${'5'}"/>                
                </sql:query> 
                
                 <c:forEach var="stud" items="${listMenuu.rows}">
                 
                <td> Question:<c:out value="${stud.ques}" /></td>  
                  
                  
                </c:forEach>
                
               
                
                
                
               <textarea  name="ans5" placeholder="" rows="2" cols="25"></textarea>      
 
                  
              
                    <p class="submit">
              <%System.out.print("here"+name); %>
              
                <button type="submit" onlclick="check(this)" name="name" value="<%=name%>">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> 
                  </form>    
                  
                    
             
          
                </div>
            </div>
        </div> 
                   
                   
                   
                 </div>  
                    
        <!-- //////////////////// -->
                
          
                </div>
            </div>
        </div>
        

        
        
        
   </div>
            
            
            
            
            
            
      
        </form>
      <!--   </section>
        --> 
       <!--  <section class="main">  -->
         
        
        </section>
    
      
    </div>
    <script>
function getitchecked(ee){
    var id;
    var id = $(ee).attr("id");
  //  var answer=$(ee).attr("value");
//alert(id);
//alert(answer);
var ans="ans"+id;


     inval=document.getElementById(ans).value
     var id = $(ee).attr("id");
  var up =id+"up";
  var down=id+"down";
     up=document.getElementById(up).value
     down=document.getElementById(down).value

     
     
    // alert(up);
  //   alert(down);
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
    
   
    
</body>
</html>