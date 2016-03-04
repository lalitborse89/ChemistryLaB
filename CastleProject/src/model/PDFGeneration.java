package model;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class PDFGeneration {
	
	
	public byte[] createPDFs(PreLab[] prelab, PostLab postlab) {
		Document document = new Document(PageSize.A4);
		ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
		System.out.println("Came to convertion");
		PdfWriter writer, writer2;
		try {
			writer = PdfWriter.getInstance(document, outputStream);

			document.open();

			Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD);
			document.add(createPara("Acid Base Titration", chapterFont, 10, 15));
			
			for(int i = 0; i < prelab.length; i++) {
				System.out.println("Prelab : "+i);
				PreLab pre = prelab[i];
				createDocument(document, pre);
			}

			System.out.println("Document created");
			document.newPage();
			createPostLab(document, postlab);

			document.close();

			writer.close();
			
			System.out.println("Done PDF");
			return outputStream.toByteArray();
		} catch (DocumentException e) {
			e.printStackTrace();
		} 
		return null;
	}
	
	
	private void createPostLab(Document document, PostLab postlab) throws DocumentException {
		Font moduleFont = FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLDITALIC);
		Font pointsFont = FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD);
		Font paraFont = FontFactory.getFont(FontFactory.HELVETICA, 12);

		document.add(createPara("Post Lab", moduleFont, 10, 10));
		document.add(createPara("Answer 1", pointsFont, 10, 10));
		document.add(createPara(postlab.getAnswer1(), paraFont, 15, 5));
		document.add(createPara("Answer 2", pointsFont, 10, 10));
		document.add(createPara(postlab.getAnswer2(), paraFont, 15, 5));
		document.add(createPara("Answer 3", pointsFont, 10, 10));
		document.add(createPara(postlab.getAnswer3(), paraFont, 15, 5));
		document.add(createPara("Answer 4", pointsFont, 10, 10));
		document.add(createPara(postlab.getAnswer4(), paraFont, 15, 5));
		document.add(createPara("Answer 5", pointsFont, 10, 10));
		document.add(createPara(postlab.getAnswer5(), paraFont, 15, 5));

		
	}
	
	public void createDocument(Document document, PreLab prelab) throws DocumentException {
		Font chapterFont = FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD);
		Font moduleFont = FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLDITALIC);
		Font pointsFont = FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLD);
		Font paraFont = FontFactory.getFont(FontFactory.HELVETICA, 12);
		
		System.out.println("Came for Only 1");
		document.add(createPara(prelab.getModuleName(), moduleFont, 0, 10));
			
		document.add(createPara("Objective", pointsFont, 10, 10));
			document.add(createPara(prelab.getObjectie(), paraFont, 15, 5));
			document.add(createPara("Hypothesis", pointsFont, 10, 10));
			document.add(createPara(prelab.getHypothesis(), paraFont, 15, 5));
			document.add(createPara("Variables", pointsFont, 10, 10));
			document.add(createPara(prelab.getVariables(), paraFont, 15, 5));
			document.add(createPara("Experimental Outline", pointsFont, 10, 10));
			document.add(createPara(prelab.getExperimental(), paraFont, 15, 5));
			document.add(createPara("Chemical Hazards", pointsFont, 10, 10));
			document.add(createPara(prelab.getChemical(), paraFont, 15, 5));
			
	}
	
	private Paragraph createPara(String content, Font font, float intendation, int space) {
		Paragraph para = new Paragraph(content, font);
		para.setIndentationLeft(intendation);
		para.setSpacingBefore(space);
		para.setSpacingBefore(space);
		return para;
	}
	

}
