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
import model.PDFDao;
import model.PDFGeneration;
import model.PreLab;

/**
 * Servlet implementation class WplabCon
 */
@WebServlet("/WplabCon")
public class WplabCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WplabCon() {
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
		String name=request.getParameter("name");
		System.out.println("got the Wplabcon for updating prelab status+"+name);
		HttpSession session=request.getSession();
		
		name=(String) session.getAttribute("username");
		request.setAttribute("name", name);
		Dao dd=new Dao();
	    int x=dd.updateattemptplab(name, 1);
	
	    String objective = request.getParameter("objective");
		String hypothesis = request.getParameter("hypothesis");
		String variables = request.getParameter("variables");
		String expoutline = request.getParameter("expoutline");
		String chemhazards = request.getParameter("chemhazards");
		
		
		PreLab prelab1 = (PreLab) session.getAttribute("prelab1");
		
		PreLab prelab2 = new PreLab();
		prelab2.setExperimental(expoutline);
		prelab2.setChemical(chemhazards);
		prelab2.setHypothesis(hypothesis);
		prelab2.setObjectie(objective);
		prelab2.setVariables(variables);
		prelab2.setModuleName("Acid Base Titration");
		
		session.setAttribute("prelab2", prelab2);
		

		requestd = getServletContext().getRequestDispatcher("/CompletePrelab.jsp");
		requestd.forward(request, response);
		
	}

}
