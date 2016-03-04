package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.PDFGeneration;
import model.PostLab;
import model.PreLab;

/**
 * Servlet implementation class PDFFile
 */
@WebServlet("/PDFFile")
public class PDFFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDFFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("application/pdf");

		ServletOutputStream stream = response.getOutputStream();

		HttpSession session = request.getSession();
		
		PreLab prelab1 = (PreLab) session.getAttribute("prelab1");
		PreLab prelab2 = (PreLab) session.getAttribute("prelab2");
		PostLab postlab = (PostLab) session.getAttribute("postlab");
		
		PreLab[] content = new PreLab[2];
		content[0] = prelab1;
		content[1] = prelab2;
		
		PDFGeneration generate = new PDFGeneration();
		byte[] a = generate.createPDFs(content, postlab);
		
		response.setContentType("application/pdf");
		
		response.setContentLength(a.length);
		response.getOutputStream().write(a);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
