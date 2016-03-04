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
<title>Basic Trial</title>

<!-- <link rel="stylesheet" href="./css/jquery-ui.css">
 --> <link href="CSS1/_assessmentStyles.css" rel="stylesheet" type="text/css">
       
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <!--  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"><for header n footer>
  --> <script src="./js/jquery-1.10.2.js"></script>
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

            #tabs { margin-top: 5em;}
            #tabs > ul { list-style-type: none; display: inline-block; padding-left: 0px;}
            #tabs > ul > li {padding-bottom: 0.3em; display: inline-block;}
            #tabs > ul >li > a {  text-decoration: none; font: 1em; color: cornflowerblue;}
            #tabs > ul > li > a:hover { font-weight: bold; cursor: pointer; color:black;}
            #tabs > ul .active { font-weight: bold; cursor: pointer; fontcolor:black;}
            
            #questionsList {width: 100%; height:20em; border: 1px solid black; }
        
            #btn-submit {background-color: azure; padding: 7px 25px; font-size: 15px; margin-top: 1em;}
            
        </style>
<style>

body {position: relative; width:80em; margin: 1em auto;background-color: darkgray;}
main { width: 100%; height: 40em; margin: 0 auto; border: 1px solid black; clear:both; font-family: sans-serif; position: relative;}
.pdfWindow { float: left; width:55%; height: 95%; background-color: darkgray; margin: 1em 0 1em 1em;}

.active{background-color:#CCFF66;}

.questionTab {float: right; margin: 0.5em 1em 1em 1em; width: 40%; height: 95%; }


.container {
  width:90%;
  clear:both;
  height: 95%;
  background-color: darkgray
   margin: 0 auto;
}
#wrap {
  width:95%;
 
  clear:both;
  height: 95%;
  background-color: darkgray
   margin: 0 auto;
}


#ldiv {
  background-color:white;
  width:60%;
  float:left;
  height: 550px;
   margin: 0 auto;
}
#rdiv {
  background-color:white;
  width:35%;
  float:right;
  height: 95%;
   margin: 10 auto;
padding: 10 auto;
}









</style>



<link rel="stylesheet" type="text/css" href="css/style.css" />
    </head>
    <body onload ="loadPage()">
     <%
    Dao dk = new Dao();
    PriorityQueue<Question> pp=dk.QchcekBox(1);
    int noofQ=pp.size();
  
  
    %>
    
    <header>

        <h1>
          <strong>CASTLE</strong>
          <p>Chemistry Laboratory System</p> 
        </h1>

        <div class="support-note">
            <span class="note-ie">Sorry, only modern browsers.</span>
        </div>

        </header>
         <div id="error"
        style="color: red; font-family: arial; text-align: center; z-index: 99; position: relative;"></div>
<div class="container">
        <div id="wrap">
   

           <input type="hidden" id="hiddens" value="<%=noofQ %>" >
  
  <div id="ldiv" align="left">
   
              <object width="100%" height="100%" data="images/castle.pdf"></object>       
            
  </div>
  
  
  
  
  <div id="rdiv" align="right">
  
  <article id="questionTab"> 
  
  
  
  
  <section class="main"> 
            
               <div id="tabs" style="auto;" > 
            
            
                        <ul>
                           
                            
                             <%for(int i=1;i<=noofQ;i++)
                                 {
                            	 
                            	 
                                    %> <li><a href="#tabs<%=i%>" id="q9<%=i%>">Q.<%=i %></a></li>
                                    <% 
                                 }
                               %> 
                        </ul>
         <%
                           for(int i=1;i<=noofQ;i++){
                                     %>
            <div id="tabs<%=i%>">Que no: <%=i %> 
                    
            <div id="register" >
                         <div align="left">
                 <p id="hint_<%=i%>"></p> <p id="hint_<%=i%>t"></p><p id="hint_<%=i%>e"></p>
                          
                               <%
                 Question q= new Question();
                 q=pp.poll();
                 out.println("***"+q.getHint1());
                 out.println(q.getHint2());
                 out.println(q.getHint3()+"**");
                 out.println();
                 
                 
                 
                 String a=q.getQuestion();
                 
                 out.println(a);
                 System.out.println("qnumid"+q.getQ_num_id()+" "+i);
                 System.out.println("Qcbid "+q.getQ_cb_id()+" "+i);
                                    
                  String h1=q.getHint1();               
                  String h2=q.getHint2();
                  String h3=q.getHint3();  

                  %>
                    <input type="hidden" id="ahint<%=i%>e" value=<%=h1 %> maxlength="100" >
                   <input type="hidden" id="ahint<%=i%>" value=<%=h1 %>  maxlength="100">
                    <input type="hidden" id="bhint<%=i%>" value=<%=h2 %>  maxlength="100">        
                   <input type="hidden" id="chint<%=i%>" value=<%=h3 %>  maxlength="100">        
            
            
            <%HashMap<String,String>h=new HashMap<>();
            
            h.put("ahint"+i+"e",h1);
            h.put("ahint"+i,h1);
            h.put("bhint"+i,h2);
            h.put("chint"+i,h3);
            session.setAttribute("hint", h);
                       
            %> 
              <table>              
                  <% if(q.getQ_num_id()!=0){
                 System.out.println("i am inside Qnum"+i);
                %> 
                
                 <tr>
                     <td>
                     <%  System.out.println("i am inside1");
                       %>
                           <h4> Answer: </h4><input type="text" id="ans<%=i%>t">
                           
                        <input type="hidden" id="<%=i%>tup" value=<%=q.getUplimit() %> >
                     <input type="hidden" id="<%=i%>tdown"value=<%=q.getLowerlimit() %> >   
                     
                       <button type="submit" id="<%=i%>t" onclick="">
                        Submit 
                     </button>
                          </td>
                  <%  
                      System.out.println("***********************inside 2****** endd*******************************"+i); 
                 
             %>
                 </tr>
                 
                </table> 
                 
             
            <%  }else if(q.getQ_cb_id()!=0){%>
                  <table>
                   
                  <tr>
                   <td><input type="radio" name="opt" id="<%=i%>a" value="one"><%=q.getAnswer_1() %><br></td> 
                   </tr>
                   <tr>
                   <tr>
                   <td><input type="radio" name="opt" id="<%=i%>b" value="two"><%=q.getAnswer_2() %><br></td> 
                   </tr>
                   <tr>
                <%  String q3=q.getAnswer_3();
                     String q4=q.getAnswer_4();   
                %>   
                   <tr>
                   <td><input type="radio" name="opt" id="<%=i%>c" value="three"><%=q.getAnswer_3() %><br></td> 
                   </tr>
                    
                   <tr>
                   
                   <td><input type="radio" name="opt" id="<%=i%>d" value="four"><%=q.getAnswer_4() %><br><br></td> 
                   </tr>
             <% %>
             </table>
             <%String s=q.getAnsoption(); %>
                             <button type="submit" id=<%=i%> onclick="checkk(this)" value=<%=s%>>
                                 Submit 
                             </button>

                  
                 <%} %> </div>
                  
               </div>   
                    </div>
            
            
            
             <%} %>
               
               </div>       
                 <% pp.clear(); %>
             </section>      

   </article>          
           </br> </br> </br> </br>
    </div>  
  </div>   </div>    
   <script>
  function loadPage(){
	 console.log("set");   
	
	      
    var noOFQ = $("#hiddens").val();
      
      for(i=1;i<=noOFQ; i++){
     
      if(i != 1){
         $("#q9"+i).hide();
         
      }
        
      }
      countt=0;
  }
   
  
</script>

<script>

function checkk(ele){
    alert("Only for MCQ Questions");
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
  console.log("radio id - "+ans);
  h="hint";
  hid=h+id;
  hid0="a"+hid;
 // alert(hid0);
// alert("combined id - "+hid);
  var i;
  console.log(document.getElementById(hid0).value);
  console.log($("#"+hid0).val());
  var text= "Hint1:"+document.getElementById(hid0).value
  //var text= "Hint1:"+$("#"+hid0).val();
 // alert(text);
  var hid1="b"+hid;
  var text1="Hint2:"+$("#"+hid1).val();
// alert(text1);
  hid2="c"+hid; 
 //var text2="Hint3:"+document.getElementById(hid2).value
  var text2="Hint3:"+$("#"+hid2).val();
  
  
alert("HINT--"+text);
alert("HINT--"+text1);
alert("HINT--"+text2);
  

        
                      if(document.getElementById(ans).checked) {
                          $("#"+id).toggleClass('active');
                           $("#"+id).prop("disabled",true);
                           document.getElementById(ans).disabled = true;
                         //  countt=0;
                           
                           for (x=0;x<2;x++){
                               if(id == "q9"+x)
                                   {
                                   alert(89);
                                   }
                               
                           }
                           
                           
                           
                           
                           
                           
                           if(id ==noOFQ){
                               console.log("Here i shoul go for q6"+noOFQ);
                               console.log("This is last");
                               $("#q6").show("slow");
                               //$("#tabss").tabs("option", "active", 4);
                           }else if(id == 1){
                            // alert("@@@@@@@@@@@@@@@@@@@");
                               $("#q92").show("slow"); 
                             //  alert("@@@@@@@@@@@@@@@@@@@");
                               $("#tabs").tabs("option", "active", 1);
                              // alert("@@@@@@@@@@@@@@@@@@@");
                           }else if(id == 2){
                               $("#q93").show("slow");
                               $("#tabs").tabs("option", "active", 2);
                               
                           }else if(id == 3){
                               $("#q94").show("slow");
                               $("#tabs").tabs("option", "active", 3);
                           }else if(id == 4){
                               $("#q95").show("slow");
                               $("#tabs").tabs("option", "active", 4);
                           }
                           
                           
                           
                      }else{
                          
                          alert(countt +"is countt");
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
                          alert(countt +"is countt Now");
       }
  
  
}
</script>



    </body>
</html>
