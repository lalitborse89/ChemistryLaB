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
<title>LoginStudent</title>

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
 <header>


        <h1>
          <strong>CASTLE</strong>
          <p>Chemistry Laboratory System</p> 
        </h1>

        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>
           
</header>
<%
String username=(String)session.getAttribute("username");

String msg1=(String)request.getAttribute("msg1");
String msg2=(String)request.getAttribute("msg2");

String netid=(String)session.getAttribute("user");
//out.print(netid);
pageContext.setAttribute("netid", netid);
%>

<sql:setDataSource var="myDS" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/castleexpt" user="root" password="rootSquare89" />

    <div id="error"
        style="color: red; font-family: arial; text-align: center; z-index: 99; position: relative;"></div>
<br><br>


        <div>
        <%
        if(msg1!=null && msg2!=null){
        
         out.print("<h2>"+msg1+" "+username+"\n"+msg2+"</h2>");
        %>
               
              <form action="LogoutCon" method="post">
                    <p class="submit">
              
                <button type="submit">Log Out <i class=" icon-large"></i>
                </button>
            </p> 
                  </form> 
        
        <% 	
        	
        } 
        
        %>    
       <h3>Welcome <%=username %></h3>
    </div>
            
            
          <div>     
    </div>  
            
             <c:set var="netid" value="<%=netid%>"/>
            
             <div id="tabs" style="left: 50px; right:200px;">
        <ul>
            <li><a href="#tabs-1">View Assignments</a></li>
<!--             <li><a href="#tabs-2">MY Grades</a></li>
 -->            
        </ul>
        <div id="tabs-1">
            <div id="horizBorder"></div>
            <div id="register">
                <!-- <form action="CatalogueCon" method="post"> -->
                <sql:query var="listMenu" dataSource="${myDS}">
                    select *from attemptstat where netid=?  
                    <sql:param value="${netid}" />  

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
                               
                               <a href="StartAssignmt.jsp?num=${stud.expno}"><c:out value="${stud.expname}"/></a>
                               
                               
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
                                      <c:when test="${stud.prelab == '1'}">
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
        
        
        <!-- <div id="tabs-2">
            <div id="horizBorder"></div>
            <div id="register">
                </div> 
            </div>
        </div> -->
        
        
        
   </div>
            
            
            
            
            
            
            
            
            
      
      
      
        
    
      
    
   
    
</body>
</html>