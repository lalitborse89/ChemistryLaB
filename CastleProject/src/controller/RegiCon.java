package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Dao;

/**
 * Servlet implementation class RegiCon
 */
@WebServlet("/RegiCon")
public class RegiCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegiCon() {
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
		String netid=request.getParameter("netid");
		String fname=request.getParameter("fname");
		/*String lname=request.getParameter("lname");
		String batch=request.getParameter("batch");
		String passw=request.getParameter("passw");
		String email=request.getParameter("email");
		*/
		request.setAttribute("netid", netid);
		request.setAttribute("fname", fname);
		/*request.setAttribute("lname", lname);
		request.setAttribute("batch", batch);
		request.setAttribute("passw", passw);
		request.setAttribute("email", email);
		*/
		Dao dd=new Dao();
		dd.initiatestatus(fname,netid);
		
		dd.Regis(netid, fname, null, null, null,null);
		RequestDispatcher re=null;
		
		
		re = getServletContext().getRequestDispatcher("/login.jsp");
		re.forward(request, response);
	}

}
