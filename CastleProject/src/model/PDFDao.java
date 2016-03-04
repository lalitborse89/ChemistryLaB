package model;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PDFDao {

	public int storePDF(byte[] content, String userName, String fileName) {
		
		String sql = "update attemptstat set pdf = ? where username = ?";
	//	InputStream is = new ByteArrayInputStream(content);
		
		try {
			FileInputStream fis = new FileInputStream(fileName);
			fis.read(content);

			PreparedStatement ps = Store.getConnection().prepareStatement(sql);
			ps.setBinaryStream(1, fis);
			ps.setString(2, userName);
			
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public byte[] getPDF(String userName) {

		String sql = "select pdf from attemptstat where username = "+userName;
		
		try {

			PreparedStatement ps = Store.getConnection().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getBytes(1);
			}
		}
		catch(SQLException ex) {
			
		}
		return null;
	}
	
	public int storeExcel1(byte[] content, String userName, String fileName) {
		
		String sql = "update attemptstat set excelfile = ? where username = ?";
//		InputStream is = new ByteArrayInputStream(content);
		try {
			FileInputStream fis = new FileInputStream(fileName);
			fis.read(content);

			PreparedStatement ps = Store.getConnection().prepareStatement(sql);
			ps.setBinaryStream(1, fis);
			ps.setString(2, userName);
			
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public int storeExcel2(byte[] content, String userName, String fileName) {
		
		String sql = "update attemptstat set excelfile2 = ? where username = ?";
//		InputStream is = new ByteArrayInputStream(content);
		try {
			FileInputStream fis = new FileInputStream(fileName);
			fis.read(content);

			PreparedStatement ps = Store.getConnection().prepareStatement(sql);
			ps.setBinaryStream(1, fis);
			ps.setString(2, userName);
			
			return ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
