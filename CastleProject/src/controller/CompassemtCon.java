package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dao;

/**
 * Servlet implementation class CompassemtCon
 */
@WebServlet("/CompassemtCon")
public class CompassemtCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompassemtCon() {
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
		RequestDispatcher requestd = null;
		String name=request.getParameter("num");
		System.out.println("got the CompassemtCon and expno is+"+name);
		HttpSession session=request.getSession();
		name=(String) session.getAttribute("username");
		//request.setAttribute("name", name);
		name="Lalit";
		Dao dd=new Dao();
		int x=dd.updateattempt(name, 1);
		
		requestd = getServletContext().getRequestDispatcher("/Completeassesmt.jsp");
		requestd.forward(request, response);
	}

}
