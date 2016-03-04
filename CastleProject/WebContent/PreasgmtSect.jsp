<%@page import="java.net.URLEncoder"%>
<%@page import="com.mysql.jdbc.EscapeTokenizer"%>
<%@page import="java.io.*"%>
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
<title>Module1</title>

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
    String username= (session.getAttribute("username")).toString();
  
    %>
    
    <header>

        <h1>
          <strong>CASTLE</strong>
          <p>Chemistry Laboratory System</p> 
               
        </h1>

            <h2>Assesment</h2>
            <h4>Part-I</h4>
           <h3>Welcome <%=username %> </h3> 
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
                <h5> <p id="hint_<%=i%>"></p> <p id="hint_<%=i%>t"></p><p id="hint_<%=i%>e"></p>
                   </h5>       <br><br><br>
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
                		   // InputStream h1 = new ByteArrayInputStream(h11.getBytes("UTF-8"));
                		    //InputStream h2 = new ByteArrayInputStream(h12.getBytes("UTF-8"));
                		    //InputStream h3 = new ByteArrayInputStream(h13.getBytes("UTF-8"));
                  %>
                  
                 
                  <input type="hidden" id="ahint<%=i%>e" value=<%=h1 %> maxlength="100" >
                   <input type="hidden" id="ahint<%=i%>" value=<%=h1 %>  maxlength="100">
                    <input type="hidden" id="bhint<%=i%>" value=<%=h2 %>  maxlength="100">        
                   <input type="hidden" id="chint<%=i%>" value=<%=h3 %>  maxlength="100">  
                   
                   <input type="hidden" id="ahint<%=i%>t"value=<%=h1 %> maxlength="100"> 
        <input type="hidden" id="bhint<%=i%>t" value=<%=h2 %> maxlength="100">
        <input type="hidden" id="chint<%=i%>t" value=<%=h3 %> maxlength="100">      
            
            
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
                     
                     Range:<%=q.getLowerlimit() %> to <%=q.getUplimit() %>
                       <button type="submit" id="<%=i%>t" onclick="getitchecked(this)">
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
             <%String s=q.getAnsoption();
             out.println(s);%>
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
  
  
  <div id="q6">
       
          
           <a href="PreasgmtSecttwo.jsp?num=1">Go_For_Next</a>
            
            </div> 
  
  
   <script>
  function loadPage(){
     console.log("set");   
    
          
    var noOFQ = $("#hiddens").val();
      
      for(i=1;i<=noOFQ; i++){
     
      if(i != 1){
         $("#q9"+i).hide();
         
      }
        
      }
      
      $("#q6").hide();
      countt=0;
      counterr=0;
  }
   
  
</script>

<script>

function checkk(ele){
    console.log("Only for MCQ Questions");
    var noOFQ = $("#hiddens").val();
    var id = $(ele).attr("id");
    var answer=$(ele).attr("value");
    //var opt= $(ele).attr("opt");
console.log("id is------------------>"+id);
 console.log("answer is------------------->"+answer);

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
  console.log("=====>"+decodeURIComponent($("#"+hid0).val()));
  //var theString = IOUtils.toString(document.getElementById(hid0).value, encoding);
  var text= "Hint1:"+decodeURIComponent($("#"+hid0).val());
  //document.getElementById(hid0).value
  //var text= "Hint1:"+$("#"+hid0).val();
 // alert(text);
  var hid1="b"+hid;
  var text1="Hint2:"+decodeURIComponent($("#"+hid1).val());
// alert(text1);
  hid2="c"+hid; 
 //var text2="Hint3:"+document.getElementById(hid2).value
  var text2="Hint3:"+decodeURIComponent($("#"+hid2).val());
  
  
console.log("HINT--"+text);
console.log("HINT--"+text1);
console.log("HINT--"+text2);
  

        
                      if(document.getElementById(ans).checked) {
                          $("#"+id).toggleClass('active');
                           $("#"+id).prop("disabled",true);
                           document.getElementById(ans).disabled = true;
                           countt=0;
                           
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


console.log("Question----------->"+id);
console.log("Question answer range----------->"+down+"to"+up);

var ans="ans"+id;


     inval=document.getElementById(ans).value
     var id = $(ee).attr("id");
  var up =id+"up";
  var down=id+"down";
     up=document.getElementById(up).value
     down=document.getElementById(down).value

     
     
  //   alert(up);
   //  alert(down);
     up=Number(up);
     down=Number(down);
      inval=Number(inval); 
      
        
     if(inval < up && inval > down){
//    	 alert("Qualified");
         counterr=0;
         $("#"+id).toggleClass('active'); 
         
         $("#"+id).prop("disabled",true);
         
         if(id == "4t"){
             $("#q5").show("slow");
             $("#tabs").tabs("option", "active", 4);
         }
         else if(id == "5t"){
             $("#q6").show("slow");
             $("#tabs").tabs("option", "active", 5);
         }
             
             
         
        
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





    </body>
</html>
