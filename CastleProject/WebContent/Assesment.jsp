<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
"http://www.w3.org/TR/html4/strict.dtd">
<%@page import="java.util.PriorityQueue"%>
<%@ page import="model.*" %>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Trail</title>
        <meta name="author" content="Harish" />
        
        <link href="CSS1/_assessmentStyles.css" rel="stylesheet" type="text/css">
        <script src="_js/assessmentJs.js"></script>
    
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
        <!-- Date: 2016-01-26 -->
    </head>
    <body>
     <%
    Dao dk = new Dao();
    PriorityQueue<Question> pp=dk.QchcekBox(1);
    int noofQ=pp.size();
  
  
    %>
        <main>
            <article id="pdfWindow">
              <object width="100%" height="100%" data="https://www.adobe.com/enterprise/accessibility/pdfs/acro6_pg_ue.pdf"></object>       
            </article>
            <article id="questionTab">
                <form action="" method="post">
                    <section id="tabs">
                        <ul>
                            <li>Questions </li>
                            
                             <%for(int i=1;i<=noofQ;i++)
                                 {
                                    %> <li><a href="#tabpanel<%=i%>" id="tab<%=i%>"><%=i %></a></li><% 
                                 }
                               %> 
                            <!-- <li id="tab1"><a href="#tabpanel1">1</a></li>
                            <li id="tab2"><a href="#tabpanel2">2</a></li>
                            <li id="tab3"><a href="#tabpanel3">3</a></li>
                            <li id="tab4"><a href="#tabpanel4">4</a></li>
                            <li id="tab5"><a href="#tabpanel5">5</a></li> -->
                        </ul>
                    </section>  
                    <section id="questionsList">
                            <div>
                            </div>
                             <%
                           for(int i=1;i<=noofQ;i++){
                                     %>
                   <div id="#tabpanel<%=i%>" id="tab<%=i%>">Que no: <%=i %> 
             
                         
                 <p id="hint_<%=i%>"></p> <p id="hint_<%=i%>t"></p><p id="hint_<%=i%>e"></p>
                          
                               <%
                 Question q= new Question();
                 q=pp.poll();
                 
                 String a=q.getQuestion();
                 out.println(a);
                 System.out.println("qnumid"+q.getQ_num_id());
                 System.out.println("Qcbid "+q.getQ_cb_id());
                         
                                 %>
                   <input type="hidden" id="ahint<%=i%>e" value=<%=q.getHint1() %> >
                   <input type="hidden" id="ahint<%=i%>" value=<%=q.getHint2() %> >
                   <input type="hidden" id="bhint<%=i%>" value=<%=q.getHint3() %> >        
                            
                  <% if(q.getQ_num_id()!=0){
                 System.out.println("i am inside");
                %> 
                <table>
                 <tr>
                     <td><%  System.out.println("i am inside1"); %>
                           <h4> Answer: </h4><input type="text" id="ans<%=i%>t">
                           
                        <input type="hidden" id="<%=i%>tup" value=<%=q.getUplimit() %> >
                     <input type="hidden" id="<%=i%>tdown"value=<%=q.getLowerlimit() %> >   
                       <button type="submit" id="<%=i%>t" onclick="">
                        Submit 
                     </button>
                          </td>
                  <%  System.out.println("i am inside2");%>
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
                if(q3!=null){%>   
                   <tr>
                   <td><input type="radio" name="opt" id="<%=i%>c" value="three"><%=q.getAnswer_3() %><br></td> 
                   </tr>
                 <%}if(q4!=null){ %>  
                   <tr>
                   
                   <td><input type="radio" name="opt" id="<%=i%>d" value="four"><%=q.getAnswer_4() %><br><br></td> 
                   </tr>
             <%} %>
             </table>
                             <button type="submit" id=<%=i%> onclick="checkk(this)" value="answer">
                                 Submit 
                             </button>
                  
                  
                  
                  
                  
                  
                  
                 <%} %> 
                  
                  
                    
                    </div><%} %>
                    </section>
                    <% pp.clear(); %>
                </form>
            </article>
        </main>
    </body>
</html>
