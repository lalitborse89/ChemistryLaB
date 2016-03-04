package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

import model.Dao;

/**
 * Servlet implementation class LoginCon
 */
@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session =request.getSession();
		
		RequestDispatcher rd=null;
	String netid =request.getParameter("netid");
	String fname=request.getParameter("fname");
	System.out.println("Valid netid and psw"+netid+fname);
	
	Dao dd=new Dao();
	String username=dd.getusername(netid);
	String oo=dd.checkusertype(netid);
	
	/*int i=dd.checkuser(netid,Password);
	System.out.println("one"+i);
	if(i==1){
		String oo=dd.checkusertype( netid);
		//System.out.println("two");
			
		    if(oo.equals("TA"))
		            {
		            rd= getServletContext().getRequestDispatcher("/WelcomeTA.jsp");
	                 rd.forward(request, response);
		             }
		    else if(oo.equals("student"))
			         {
System.out.println("three");
	*/	    
	if(username!=null){
		    
		    	session.setAttribute("user",netid);
		    	
		    	
		    	//session.setAttribute("loggedIn", loggedIn);
				session.setAttribute("username",username);
		    	
		    	
			         rd=getServletContext().getRequestDispatcher("/WelcomeStud.jsp");
			         rd.forward(request, response);
			         
		   /* else if(oo.equals("instructor"))
	              { 
		    	     rd=getServletContext().getRequestDispatcher("/WelcomeIns.jsp");
	                 rd.forward(request, response);
	                }
	
	}
*/	}
	else{
		
	rd=	getServletContext().getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}
	
	
	}

}
