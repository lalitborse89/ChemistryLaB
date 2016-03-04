package controller;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Dao;
import model.PDFDao;
import model.PDFGeneration;
import model.PostLab;
import model.PreLab;

/**
 * Servlet implementation class PostlabCon
 */
@WebServlet("/PostlabCon")
public class PostlabCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostlabCon() {
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
		
		String ans1 = request.getParameter("ans1");
		String ans2 = request.getParameter("ans2");
		String ans3 = request.getParameter("ans3");
		String ans4 = request.getParameter("ans4");
		String ans5 = request.getParameter("ans5");
		

		System.out.println("Objective 2 : "+ans1);
		System.out.println("Hypothesis 2 : "+ans2);
		System.out.println("Variables 2 : "+ans3);
		System.out.println("Experiment 2 : "+ans4);
		System.out.println("Chemical 2 : "+ans5);

		PostLab postlab = new PostLab();
		postlab.setAnswer1(ans1);
		postlab.setAnswer2(ans2);
		postlab.setAnswer3(ans3);
		postlab.setAnswer4(ans4);
		postlab.setAnswer5(ans5);
		
		session.setAttribute("postlab", postlab);

		/*ServletOutputStream os = response.getOutputStream();
		response.setContentType("application/pdf");*/

//		byte[] document = generate.createPDFs(content, postlab, os);
//		generate.createPDFs(content, postlab);
//		System.out.println("PDF Store : "+new PDFDao().storePDF(document, name, name+".pdf"));

/*		FileOutputStream stream = new FileOutputStream("H:\\newone.pdf");
		stream.write(document);*/
		
		
	    int x=dd.updateattemptcomp(name, 1);
	
/*	    request.setAttribute("msg1","Congratulations");
	    request.setAttribute("msg2","You have completed the experiment");
	    */
	    
		requestd = getServletContext().getRequestDispatcher("/files.jsp");
//		requestd = getServletContext().getRequestDispatcher("/WelcomeStud.jsp");
		requestd.forward(request, response);
	}

}
