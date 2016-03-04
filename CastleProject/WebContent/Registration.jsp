<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
    <div id="error"
        style="color: red; font-family: arial; text-align: center; z-index: 99; position: relative;"></div>
    <div class="container">


        <header>

        <h1>
          <strong>CASTLE</strong>
          <p>Chemistry Laboratory System</p>
           
        </h1>
          <h2>Registration Page</h2>
        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

        </header>

        <section class="main">
        <form class="form-1" method="post" name="registration"
            action="RegiCon">
           
           <p class="field">
                <input type="text" name="netid" placeholder="NetID"> <i
                    class="fa fa-user icon-large"></i>
            </p>
           
           <p class="field">
                <input type="text" name="fname" placeholder="FisrtName"> <i
                    class="fa fa-user icon-large"></i>
            </p>
           
          <!--  <p class="field">
                <input type="text" name="lname" placeholder="LastName"> <i
                    class="fa fa-user icon-large"></i>
            </p>
            
            <p class="field">
                <input type="text" name="email" placeholder="Email"> <i
                    class="fa fa-user icon-large"></i>
            </p>
           <p class="field">
                <input type="text" name="batch" placeholder="LabBatch"> <i
                    class="fa fa-user icon-large"></i>
            </p>
            <p class="field">
                <input type="text" name="passw" placeholder="Password"> <i
                    class="fa fa-user icon-large"></i>
            </p>
    -->        
          
           
           
           
   
            <p class="submit" >
                <button type="submit" name="submit">
                    <i class="fa fa-arrow-right icon-large"></i>
                </button>
            </p>
      
      
      
      
        </form>
        </section>
        
        <section class="main"> 
         
        
        </section>
    
      <div align="center"> 
      <!-- <h5>
         <p>Don't have a Account?</p></h5>
         <h4><strong><a href="Register.jsp">Register Here</a></strong>
        </h4>     
    --> 
       </div>
    </div>
    
   
    
</body>
</html>