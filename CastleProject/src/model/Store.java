package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.PriorityQueue;

public class Store {

	static final String JDBC_DRIVER2 = "com.mysql.jdbc.Driver";  
	 static final String DB_URL2 = "jdbc:mysql://localhost/castleexpt";
	static final String USER2 = "root";
	static final String PASS2 = "rootSquare89";
	static Connection connection = null;
	
	static {
	      try {
	    	  Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("Connecting to database...");

		      connection = DriverManager.getConnection(DB_URL2,USER2,PASS2);
		      System.out.println("Established");

	      } catch (ClassNotFoundException e) {
			e.printStackTrace();
	      } catch (SQLException e) {
			e.printStackTrace();
	      }
		
	}
	
	public static Connection getConnection() {
		return connection;
	}
}
