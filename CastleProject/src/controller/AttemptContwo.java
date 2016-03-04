package controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
//import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import javax.swing.text.html.HTMLDocument.Iterator;
import org.apache.poi.ss.usermodel.Row;

import org.apache.poi.ss.usermodel.Cell;
//import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;

import model.PDFDao;

/*import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File; 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
*/

/**
 * Servlet implementation class AttemptContwo
 */
@WebServlet("/AttemptContwo")
public class AttemptContwo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AttemptContwo() {
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
	/*
	public class Attemptcontwo extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 public Attemptcontwo() 
	    {
	        super();
	        // TODO Auto-generated constructor stub
	    }*/
	 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			doGet(request, response);
		JSONArray ja = null;
//		File file = null;
	//	String filename = null;
		String json=request.getParameter("q");
		System.out.println("-->>>"+json);
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("LabTwo");
		/* String str = json.replace("[", "").replace("]", "");
		 System.out.println("Hey"+str);

		[{"attempt":1,"reading1":"1","reading2":"1"},{"attempt":2,"reading1":"1","reading2":"1"}]
		[{"reading1":"1","reading2":"1","attempt":1},{"reading1":"1","reading2":"1","attempt":2}]
		 */
		try{
			ja = new JSONArray(json);
			System.out.println(ja);
			JSONObject jo = null;

			String[] a = new String[100];
			String[] b = new String[100];
			String[] c = new String[100];
			String[] d = new String[100];
			String[] e = new String[100];
			String[] g = new String[100];
			String[] f = new String[100];
				String[] h = new String[100];


			a[0] = "Trial";
			b[0] = "Initial Burette Reading(mL)";
			c[0] ="Final Burette Reading(mL)";
			d[0]="Volume of NaOH used in Titration";
			e[0] ="Molarity of HCL(M)";
			f[0]= "Average Molarity(M)";
			g[0]= "RSD (ppt)";
			h[0]= " ";
			//h[0]="";

			System.out.println(" con two here 5");System.out.println(" con two here 5");
			for (int i = 0; i < 4; i++) {
				//	jo = (JSONObject) ja.get(i);
				int k=i+1;
				String kk=""+k+")";
				a[i+1]=kk ;   
				// int df=( ja.get(i);
				b[i+1]= ja.get(i).toString();
				c[i+1]= ja.get(i+1).toString();

				/*a[i+1] = ""+jo.get("attempt");
				b[i+1] = ""+jo.get("reading1");
				c[i+1] = ""+jo.get("reading2");	
				 */
				d[i+1] = "";
				e[i+1] = "";
				f[i+1] = "";	
				g[i+1] = "";	
				h[i+1]= "";	

			}
			


			Object[][] bookData = {
					{a[0],b[0],c[0],d[0],e[0],f[0],g[0]},
					{a[1],b[1],c[1],d[1],e[1],f[1],g[1]},
					{a[2],b[2],c[2],d[2],e[2],f[2],g[2]},
					{a[3],b[3],c[3],d[3],e[3],f[3],g[3]},
					{a[4],b[4],c[4],d[4],e[4],f[4],g[4]},
					{a[5],b[5],c[5],d[4],e[5],f[5],g[5]},
					{a[6],b[6],c[6],d[4],e[6],f[6],g[6]},
					{a[7],b[7],c[7],d[4],e[7],f[7],g[7]},

			}; 


			int rowCount = 0;

			for (Object[] aBook : bookData) {
				Row row = sheet.createRow(++rowCount);

				int columnCount = 0;

				for (Object field : aBook) {
					Cell cell = row.createCell(++columnCount);
					if (field instanceof String) {
						cell.setCellValue((String) field);
					} else if (field instanceof Integer) {
						cell.setCellValue((Integer) field);
					}
				}

			}

			//Date day = new Date();
			//filename = "H:\\"+day.getTime()+".xlsx";
		//	filename = "H:\\Second.xlsx";
			
			/*file = new File(filename);

			if (file.createNewFile()){
				System.out.println("File is created!");
			}else{
				System.out.println("File already exists.");
			}
*/

			// file = File.createTempFile("parttwo", ".xlsx");
	//		System.out.println("Location : "+file.getAbsolutePath());

			HttpSession session = request.getSession();			
			session.setAttribute("excel2", workbook);

	/*		ByteArrayOutputStream baos = new ByteArrayOutputStream();
			workbook.write(baos);

			HttpSession session = request.getSession();			
			session.setAttribute("excel2", baos.toByteArray());*/

/*			ServletOutputStream os = response.getOutputStream();
			response.setContentType("application/excel");

			os.write(baos.toByteArray());
*/
			/*HttpSession session = request.getSession();
			String userName = (String) session.getAttribute("username");
			System.out.println("Worksheet tables");
			System.out.println("Excel 2 : "+new PDFDao().storeExcel2(baos.toByteArray(), userName, "excelfile2.xlsx"));

			FileOutputStream stream = new FileOutputStream("H:\\two.xlsx");
			stream.write(baos.toByteArray());*/

/*		try (FileOutputStream outputStream = new FileOutputStream("H:\\Second.xlsx")) {
				workbook.write(outputStream);
					
		} */
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}

		/////////////////////////////////////

/* 
 * 
poi-examples-3.9
poi-excelant-3.9
poi-ooxml-3.9
poi-ooxml-schemas-3.9
poi-scratchpad-3.9

stax-api-1.0.1

 *     
 *     
 *     
 *     //   FileInputStream fileread = new FileInputStream(filename);
          
        //Get the xlsx workbook
      XSSFWorkbook  workbookread = new XSSFWorkbook ();
      workbookread=new XSSFWorkbook ();
     */    
      /*  //Get first sheet from the workbook
        XSSFSheet sheet = workbook.getSheetAt(0);
        
      */  
        //Get iterator to all cells of current row
/////////////////
	
/*		Iterator<Row> rowIterator = sheet.rowIterator();
   
     while(rowIterator .hasNext())
     {
          
         Row row = rowIterator.next();
      
        //For each row, iterate through each columns
        Iterator<org.apache.poi.ss.usermodel.Cell> cellIterator = row.cellIterator();

        while(cellIterator.hasNext()) 
            {
                  
                Cell cell = cellIterator.next();
                 
                switch(cell.getCellType())
                {
                          
                      case Cell.CELL_TYPE_BOOLEAN:
                      System.out.print(cell.getBooleanCellValue() + "\t\t");
                      break;
                          
                      case Cell.CELL_TYPE_NUMERIC:
                      System.out.print(cell.getNumericCellValue() + "\t\t");
                      break;
                 
                      case Cell.CELL_TYPE_STRING:
                      System.out.print(cell.getStringCellValue() + "\t\t");
                      break;
                }     
       
            }               
                      System.out.println("");
           }    
          //   file.close();
       
      
         
   response.setContentType("application/vnd.ms-excel");
   workbook.write(response.getOutputStream());
   response.getOutputStream().close();
	*/	
/*	/////////////////////////////////////////////	
//		response.setContentType("text/html");
		//filename="H:\\Home.xslx";
		/////////////////////////////
		System.out.println("here 1----------------");
		PrintWriter out = response.getWriter();  

		System.out.println("here 2------------------");

		response.setContentType("APPLICATION/OCTET-STREAM");   
		//response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");

		//use inline if you want to view the content in browser, helpful for pdf file
		response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");
		FileInputStream fileInputStream = new FileInputStream(filename);  
		System.out.println("here 3-------------------");

		int i;  
		while ((i=fileInputStream.read()) != -1) {  
			out.write(i);   
			System.out.println("reading");
		}   
		System.out.println("here ending");

		fileInputStream.close();   
		out.close();   
/////////////////////////////
*/	}

}
