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
<title>Writtenprelabtwo</title>

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

        </header><div >    
<h2>Written Pre-Lab -Section TWO <br>
Acid-Base Titration </h2>

       <h3>Welcome <%=username %></h3>
    </div>

      <section class="main"> 
            
            
          <div>     
    </div>  
            
            
            
             <div id="tabs" style="left: 50px; right:200px;">
        <ul>
            <li><a href="#tabs-1">Key Concepts</a></li>
            <li><a href="#tabs-2">Written Pre-Lab</a></li>
        </ul>
        <div id="tabs-1">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from expdet where expname!=?
                     <sql:param value="${'name'}" />                
            </sql:query>

                <div align="left">
                
                 <object width="100%" height=450px data="images/castle.pdf"></object> 
            
           <%--    
                    <table border="0" cellpadding="5">
                         <caption>
                            <h2>Volumetric Glassware</h2>
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
                    </table>
              --%>
                
          
                </div>
            </div>
        </div>
         
         
         
         
         
         <div id="tabs-2">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from wprelabone where expname=?
                     <sql:param value="${'name'}" />                
            </sql:query>
 <c:forEach var="stud" items="${listMenu.rows}">
                <c:set var="num" value="${stud.expno}"/>
                </c:forEach>
                
                
<form action="WplabCon" method="post">

                <div align="left">
              
                    
      <!-- /////////////////////////////////////////////////////////////////////              
       -->       
             <div id="tabss" style="auto;">
             <ul>
             <li><a href="#tabss-7">Objective</a></li>
             <li><a href="#tabss-3">Hypothesis</a></li>
             <li><a href="#tabss-4">Variables</a></li>
            <li><a href="#tabs-5">Experimental Outline</a></li>
            <li><a href="#tabs-6">Chemical Hazards</a></li>
            
            
             </ul>
          <div id="tabss-7">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
             

                <div align="left">
              
              <textarea  name="objective" placeholder="Objective Content" rows="4" cols="50"></textarea>      
                                  
           <p class="submit">
                <button type="submit" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> 
                
                </div>
            </div>
        </div>
        <div id="tabss-3">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
              
                    
               <textarea  name="hypothesis" placeholder="Hypothesis Content" rows="4" cols="50"></textarea>                    
                    
          <p class="submit">
                <button type="submit" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> 
                  
         
                </div>
            </div>
        </div> 
                    
            
              <div id="tabss-4">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
              <textarea  name="variables" placeholder="Variables" rows="4" cols="50"></textarea>
                    
                                  
           <p class="submit">
                <button type="submit" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> 
                </div>
            </div>
        </div>        
                   
                     <div id="tabs-5">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
            
             

                <div align="left">
              
                    
                  <textarea  name="expoutline" placeholder="Experiment Outline" rows="4" cols="50"></textarea>     
                     <p class="submit">
                <button type="submit" name="submit">
                   Submit <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> 
                  
          
                </div>
            </div>
        </div> 
                   
                   
                     <div id="tabs-6">
             
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
              
             

                <div align="left">
              
                    
                    
             <textarea  name="chemhazards" placeholder="chemical Hazards" rows="4" cols="50"></textarea>  
               
                <button type="submit" name="name" value="<%=name%>">
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
            
            
            
            
            
            
            
            <br><br>
           <!--  <h4>  <p class="submit">
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                 
                 <button type="submit" name="submit">
                    
                <i class="fa fa- icon-small"><strong>PROCEED</strong></i>
                </button>
            </p> 
      </h4> -->
      
      
      
        </form>
      <!--   </section>
        --> 
       <!--  <section class="main">  -->
         
        
        </section>
    
      
    </div>
    
   
    
</body>
</html>