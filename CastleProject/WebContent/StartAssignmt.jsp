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
<title>ProceedtoAsignmt</title>

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
  

<style>
body {
    background-color: #E1D7FA;
     }

</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<% 
String name=request.getParameter("num");
%>
<body>
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

      <section class="main"> 
        <form class="form-7" method="post" name="login"
            >
            
            
          <div>     
    </div>  
            
            
            
             <div id="tabs" style="left: 50px; right:200px;">
        <ul>
            <li><a href="#tabs-1">Key Concept for Experiment</a></li>
            
        </ul>
        <div id="tabs-1">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                
                
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from expdet where expno='${param.num}'
                                  
            </sql:query>

                <div align="left">
              <c:forEach var="stud" items="${listMenu.rows}">
                    <table border="1" cellpadding="2">
                         <caption>
                            <h2><c:out value="${stud.expname}" /></h2>
                          </caption>
                           
                          
                                              
                 
                               <%--   <td><c:out value="${stud.expno}" /></td> 
                --%>  <td><c:out value="${stud.intromsg}" /></td>                    
        
                <td>
                
                 <a href="PreasgmtSect.jsp?num=${stud.expno}"><strong>Proceed</strong></a>
                </td>
                </c:forEach>
                    </table>
             
                
          
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