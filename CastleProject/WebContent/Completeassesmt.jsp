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
<title>Completeassesmt</title>

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



<body>
<%
String username=(String)session.getAttribute("username");
pageContext.setAttribute("username", username);
String netid=(String)session.getAttribute("user");
pageContext.setAttribute("netid", netid);


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
      
        <form class="form-7" method="post" name="login"
            action="LoginCon">
            
            
          <div>     
    </div>  
            
            
            
             <div id="tabs" style="left: 50px; right:200px;">
        <ul>
            <li><a href="#tabs-1">Completion</a></li>
             <li><a href="#tabs-2">Status</a></li>
            
        </ul>
        <div id="tabs-1">
            <div id="horizBorder"></div>
            <div id="register">
            
             <c:set var="username" value="<%=username%>"/>
             <c:set var="netid" value="<%=netid%>"/>
             
             <%-- <c:out value="${username}"/>
              --%>
                <!-- <form action="CatalogueCon" method="post"> -->
                <sql:query var="listMenu" dataSource="${myDS}">
                   select *from attemptstat where netid=? 
                     <sql:param value="${netid}"/>
                                            
            </sql:query>

                <div align="left">
                    <table border="1" cellpadding="2">
                        
                           
                          
                           <h3>Congratulations <%=username %>, you have completed the lab comprehension assessment questions! Its time to move on to
the written pre-lab. You now have access to review the entire experiment at any time. Remember, you cannot
begin the lab until you have completed the written pre-lab. Which part would you like to complete first.
</h3>                         
                 
                               
                 <c:forEach var="stud" items="${listMenu.rows}">
                  <tr>
                            
               1)<a href="Wplabone.jsp?name=${stud.expname}">Volumetric Glassware</a><br><br>
               
               2)<a href="Wplabtwo.jsp?name=${stud.expname}">Acid-Base Titration</a><br><br>
                 
                            
                            
                                       </tr>
                                 
        
                </c:forEach> 
                    </table>
                </div>
            </div>
        </div>
        
                <div id="tabs-2">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from attemptstat where netid=? 
                     <sql:param value="${netid}"/>
                                            

            </sql:query>

                <div align="left">
                    <table border="1" cellpadding="2">
                         <caption>
                            <h2>VIEW Assignments</h2>
                          </caption>
                           <tr>
                            <th>Experiment number</th>
                            <th>Experiment name</th>
                             <th>Due Date</th>
                           <th>Assessment</th>
                            <th>Pre-Lab</th>
                           
                            
                            <th>Experiment</th>
                            <th>Postlab</th>
                        </tr>
                          
                                              
                 <c:forEach var="stud" items="${listMenu.rows}">
                  <tr>
                               <td><c:out value="${stud.expno}" /></td> 
                       
                               <td>
                               
                               <c:out value="${stud.expname}"/></a>
                               
                               
                               </td>
                               
                               <td>                            
                                <c:out value="${stud.date}" /></td>
                               
                               <td>    
                               
                               <c:choose> 
                                      <c:when test="${stud.Assesmt == '1'}">
                                          <h5>DONE</h5>
                                    </c:when>
                                <c:otherwise>
                                          <h5>PENDING</h5>
                                    </c:otherwise>
                                      </c:choose>                   
                                </td>
                               
                               
                               <td>    
                               
                               <c:choose> 
                                      <c:when test="${stud.prelabstat == '1'}">
                                          <h5>DONE</h5>
                                    </c:when>
                                <c:otherwise>
                                          <h5>PENDING</h5>
                                    </c:otherwise>
                                      </c:choose>                   
                                </td>
                                      <td>    
                               
                               <c:choose> 
                                      <c:when test="${stud.expmt == '1'}">
                                          <h5>DONE</h5>
                                    </c:when>
                                <c:otherwise>
                                          <h5>PENDING</h5>
                                    </c:otherwise>
                                      </c:choose>                   
                                </td>
                                  <td>    
                               
                               <c:choose> 
                                      <c:when test="${stud.postlab == '1'}">
                                          <h5>DONE</h5>
                                    </c:when>
                                <c:otherwise>
                                          <h5>PENDING</h5>
                                    </c:otherwise>
                                      </c:choose>                   
                                </td>
                                 
                                 
                                 
             
             
                </tr>
                                 
        
                </c:forEach>
                    </table>
                </div>
            </div>
        </div>

        
        
        
   </div>
            
            
            
            
            
            
            
            
            
             <!-- <p class="submit">
                <button type="submit" name="submit">
                    <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p> -->
      
      
      
      
        </form>
      <!--   </section>
        --> 
       <!--  <section class="main">  -->
         
        
        </section>
    
      
    </div>
    
   
    
</body>
</html>