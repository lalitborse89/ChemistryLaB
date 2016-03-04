package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PDFDao;
import model.PDFGeneration;
import model.PreLab;

/**
 * Servlet implementation class WplaboneCon
 */
@WebServlet("/WplaboneCon")
public class WplaboneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WplaboneCon() {
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
		System.out.println("got the WplabCon+"+name);
		request.setAttribute("name", name);
		HttpSession session = request.getSession();
		
		String userName = (String) session.getAttribute("username");
		
		String objective = request.getParameter("objective");
		String hypothesis = request.getParameter("hypothesis");
		String variables = request.getParameter("variables");
		String expoutline = request.getParameter("expoutline");
		String chemhazards = request.getParameter("chemhazards");
		
		System.out.println("Objective 2 : "+objective);
		System.out.println("Hypothesis 2 : "+hypothesis);
		System.out.println("Variables 2 : "+variables);
		System.out.println("Experiment 2 : "+expoutline);
		System.out.println("Chemical 2 : "+chemhazards);
		

		PreLab prelab = new PreLab();
		prelab.setChemical(chemhazards);
		prelab.setExperimental(expoutline);
		prelab.setHypothesis(hypothesis);
		prelab.setObjectie(objective);
		prelab.setVariables(variables);
		prelab.setModuleName("Volumetric Glassware");
		session.setAttribute("prelab1", prelab);
//		PDFGeneration generate = new PDFGeneration();
		
//		byte[] document = generate.createDocument(objective, hypothesis, variables, expoutline, chemhazards);
		
//		new PDFDao().storePDF(document, userName);
		requestd = getServletContext().getRequestDispatcher("/Wplabtwo.jsp");
		requestd.forward(request, response);
	}

}
