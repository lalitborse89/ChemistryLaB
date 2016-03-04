package model;
import java.sql.*;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.PriorityQueue;


public class Dao {
	//PriorityQueue<Question> pq = new PriorityQueue<>();
	/*public static Comparator<Question> comparator = new Comparator<Question>(){

	@Override
	public int compare(Question c1, Question c2) {

		
		
		return (c1.getStartTime() > c2.getStartTime()) ? 1 : (c1.getStartTime() < c2.getStartTime()) ? -1 : 0;
	}
	};	
*/	 private static Connection conn = null;
		private static ResultSet rs = null;
		
		
		// JDBC driver name and database URL
		 static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		 static final String DB_URL = "jdbc:mysql://localhost/castleexpt";
		//  Database credentials........
		static final String USER = "root";
		static final String PASS = "rootSquare89";
	
		
		static Comparator<Question> comparator = new OrderComparator();
       static PriorityQueue<Question> queue = 
            new PriorityQueue<Question>(20, comparator);
		
		
		
		
		
		
		
		public Dao(){
			
			try {
				 
				
				//STEP 2: Register JDBC driver

			      Class.forName("com.mysql.jdbc.Driver");

			      //STEP 3: Open a connection

			      System.out.println("Connecting to database...");
			      System.out.println("");

			      conn = DriverManager.getConnection(DB_URL,USER,PASS);

			      //STEP 4: Execute a query

			      System.out.println("Connection done...Now Creating statement...");
		       } 
		   catch (ClassNotFoundException e) {
			e.printStackTrace();
		               }
		    catch(Exception e){
			 System.out.println(e.getMessage());
		          }

		}
		
	
		public List<String> gethints(int hintid){
	String hint1,hint2,hint3;
			conn = null;
			PreparedStatement prepareds;
	List<String>entries = new ArrayList<>();		
    try
			{
			Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(DB_URL, USER,PASS);

				String sql = "select *from questions_hints where hint_id= ?";
				prepareds = conn.prepareStatement(sql);
				prepareds.setInt(1, hintid);
				//System.out.println("Entered Hashtag is"+Hashtag);
				ResultSet rs = prepareds.executeQuery();
				
				while (rs.next()) {
				hint1  = rs.getString(2);
				hint2 = rs.getString(3);
				hint3=rs.getString(4);	
					
		        entries.add(hint1);
		        entries.add(hint2);
		        entries.add(hint3);
				
		        
				}
			}
			catch (Exception e) {
				e.printStackTrace();
				return entries;
			} 
	System.out.println("List here is"+entries);	
    return entries;
}
		
		public int checkuser(String netid, String password) {
			
			
			 conn = null;
				PreparedStatement prepareds;
				int match=0 ;

				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select netid,password from user where netid = ?";
					prepareds = conn.prepareStatement(sql);
					prepareds.setString(1, netid);
					System.out.println("Valid netid is"+netid);
					ResultSet rs = prepareds.executeQuery();
					System.out.println("Valid netid isss"+netid);
					
					if (rs.next()) {
						String dbUser = rs.getString(1);
						String dbPass = rs.getString(2);
						//int dbId = rs.getInt(3);
						System.out.println("Valid netid is "+dbUser);
						System.out.println("Valid psw is "+dbPass);
						if(dbUser.equals(netid) && dbPass.equals(password))
						{	
							match = 1;
					     System.out.println("Valid User");
						}
						}
				}
				catch (Exception e) {
					e.printStackTrace();
					return match;
				}
				return match;
			
		}

		public String getusername(String netid) {
			
			
			 conn = null;
				PreparedStatement prepareds;
				//int match = -1;
		String username="";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select username from user where netid = ?";
					prepareds = conn.prepareStatement(sql);
					prepareds.setString(1, netid);
					ResultSet rs = prepareds.executeQuery();
					if (rs.next()) {
						 username = rs.getString(1);
						
									System.out.println("Valid User of type"+username);
					}
				
				}
				catch (Exception e) {
					e.printStackTrace();
					return username;
				}
				return username ;
			
		}

		public static int updateattempt(String username,int expno)
		{
			System.out.println(username+"'s Experiment number"+expno);
			   Statement stmt = null;
			   int x=0;
			   	   try{


			   	      stmt = conn.createStatement();
			           
			   	      
			   	      PreparedStatement ps;
			   	      
			   	         String insertTableSQL = "update attemptstat set assesmt=? where username=? and expno=?";
			   	   		ps = conn.prepareStatement(insertTableSQL);
			   	   	    
			   	   		ps.setString(2,username);
			   	   		ps.setInt(1,1);
			   	   		ps.setInt(3,expno);
			   	   		 
			   	         
			   	       
			   	   	 if(ps.executeUpdate()==0);
			   			//newUser =0;
			   	  		{	System.out.println("Record is inserted into  student's Attempt Status table for assesmt completion!");
			   		    x=1;
			   	  		}

			   	  	stmt.close();
			   	  	
			   	      }catch(SQLException se){

				      //Handle errors for JDBC

				      se.printStackTrace();

				   }catch(Exception e){

				      //Handle errors for Class.forName

				      e.printStackTrace();

				   }
			   	  		
			return x;	

		}

		
		public String getQuestion(int modid,int quenum) {
			
			
			 conn = null;
				PreparedStatement prepareds;
				//int match = -1;
		String question="";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select  question from  questextarea where mod_id= ? and type_ques_no= ? ";
					prepareds = conn.prepareStatement(sql);
					prepareds.setInt(1, modid);
					prepareds.setInt(2, quenum);
					
					ResultSet rs = prepareds.executeQuery();
					if (rs.next()) {
						 question = rs.getString(1);
						
									System.out.println("Question is :"+question);
					}
				
				}
				catch (Exception e) {
					e.printStackTrace();
					return question;
				}
				return question ;
			
		}

		
		
		public void initiatestatus(String Username,String netid){

			 Statement stmt = null;
			   int x=0;
			   try{ 
				   stmt = conn.createStatement();
		 
			   	      PreparedStatement ps;
//expno, username, expname, prelabstat, date, assesmt, prelab, expmt, postlab,netid			   	      
			   	      
			   	      String insertTableSQL = "insert into attemptstat (expno, username, expname, prelabstat, date, assesmt, prelab, expmt, postlab,netid) VALUES"
			   	   			+ "(?,?,?,?,?,?,?,?,?,?)";
			   	   		ps = conn.prepareStatement(insertTableSQL);
			   	   		ps.setInt(1, 1);
			   	   		ps.setString(2, Username);
			   	   	    ps.setString(3,"Acid Base Titration");
		   	   		
			   	   		ps.setInt(4,0);
			   	   	ps.setDate(5, java.sql.Date.valueOf("2016-03-11"));
			   //	   		ps.setString(5,"'2012-01-01'");
			   	        ps.setInt(6,0);
			   	        ps.setInt(7,0);
			   	        ps.setInt(8,0);
			   	        ps.setInt(9,0);
			   	     ps.setString(10,netid);
			   	         
			   	         
			   	       
			   	   	 if(ps.executeUpdate()==0)
			   			//newUser =0;
			   	  		{	System.out.println("Record is inserted into USER table!");
			   		    x=1;
			   	  		}
			   	   
			   	   
			   	   
			   	   

			   	      //STEP 6: Clean-up environment

			   	   
			   	   }catch(SQLException se){

			   	      //Handle errors for JDBC

			   	      se.printStackTrace();

			   	   }catch(Exception e){

			   	      //Handle errors for Class.forName

			   	      e.printStackTrace();

			   	   }

			   	      //finally block used to close resources


			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		public String checkusertype(String netid) {
			
			
			 conn = null;
				PreparedStatement prepareds;
				//int match = -1;
		String Username="";
				try
				{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select fname from user where netid = ?";
					prepareds = conn.prepareStatement(sql);
					prepareds.setString(1, netid);
					ResultSet rs = prepareds.executeQuery();
					if (rs.next()) {
						 Username = rs.getString(1);
						
									System.out.println("Valid User of type"+Username);
					}
				
				}
				catch (Exception e) {
					e.printStackTrace();
					return Username;
				}
				return Username ;
			
		}

		
		
///Get All Questions for a module		
public PriorityQueue<Question> QchcekBox(int i)
		{
	int q_cb_id=0;
	String question=null;
	String ansoption=null;
	String answer_1 =null;
	String answer_2=null;
	String answer_3=null;
	String answer_4=null;
	String type_ques_n=null;
	String hint1=null;
	String hint2=null;
	String hint3=null;
	int q_num_id =0;
	int q_txt_id =0;
	
	double answer=0.000;
	int hint_id=0;
    double uplimit,lowerlmit; 
    
			
      conn = null;
				PreparedStatement prepareds;
        try
				{
        	
        	         Dao dp=new Dao();
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select *from  quescheckbox where mod_id= ?";
					prepareds = conn.prepareStatement(sql);
					prepareds.setInt(1, i);
					//System.out.println("Entered Hashtag is"+Hashtag);
					ResultSet rs = prepareds.executeQuery();
					
					while (rs.next()) {
						q_cb_id = rs.getInt(1);
					question=rs.getString(2);
					answer_1=rs.getString(3);
					answer_2=rs.getString(4);
					answer_3=rs.getString(5);
					answer_4=rs.getString(6);
					type_ques_n=rs.getString(7);
					hint_id=rs.getInt(8);
					ansoption=rs.getString(9);
					
		          	List<String> l=	dp.gethints(hint_id);
		          	 
//		             System.out.println("List of hints"+l);
		             
		             hint1=l.get(0);
		          	hint2=l.get(1);
		             hint3=l.get(2);    
			Question q = new Question(q_cb_id,question, ansoption,answer_1, answer_2, answer_3,answer_4,
					 type_ques_n,hint1, hint2, hint3, 0, 0,0, 0, 0,0);
						
						queue.add(q);
						}
				}
				catch (Exception e) {
					e.printStackTrace();
				} 
				
        
        ///////////////////////////////////////////////////////////
        try
		{
			String sql = "select *from  quesnumerical where mod_id= ?";
			prepareds = conn.prepareStatement(sql);
			prepareds.setInt(1, i);
			ResultSet rs = prepareds.executeQuery();
			Dao dd =new Dao();
		while (rs.next()) {
 					q_num_id= rs.getInt(1);
       			question=rs.getString(2);
		  	  // answer=rs.getInt(3);
			   type_ques_n=rs.getString(4);
			   hint_id=rs.getInt(5);
			      uplimit= rs.getDouble(7);
			         lowerlmit=rs.getDouble(8);	

			     	List<String> l=	dd.gethints(hint_id);
			        hint1=l.get(0);
			     	hint2=l.get(1);
			        hint3=l.get(2);

				
	Question q = new Question(0, question, "",
			"", "", "", "", type_ques_n, hint1, hint2, hint3, q_num_id,0, 0, 0, uplimit,lowerlmit);
				
			/*Question(int q_cb_id, String question, String ansoption, String answer_1, String answer_2, String answer_3,
	String answer_4, String type_ques_n, String hint1, String hint2, String hint3, int q_num_id, double answer,
	int hint_id, double uplimit, double lowerlimit)	
				
				*/
	                  queue.add(q);
	                 /* Question qq =new Question(0, question, "",
	              			"", "", "", "", type_ques_n, hint1, hint2, hint3, q_num_id, 0, 0, uplimit,lowerlmit);
	                *///  queue.add(qq);
	                  
				}	
		}
		catch (Exception e) {
			e.printStackTrace();
		} 
//////////////////////////////////////////////////////////////////////////////////////
          // conn = null;
        try
				{
        	
        	         Dao dp=new Dao();
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL, USER,PASS);

					String sql = "select *from  questextarea where mod_id= ?";
					prepareds = conn.prepareStatement(sql);
					prepareds.setInt(1, i);
					//System.out.println("Entered Hashtag is"+Hashtag);
					ResultSet rs = prepareds.executeQuery();
					
					while (rs.next()) {
						q_txt_id = rs.getInt(1);
					question=rs.getString(2);
					type_ques_n=rs.getString(4);
					hint_id=rs.getInt(5);
					
		          	List<String> l=	dp.gethints(hint_id);
		          	 
		             System.out.println("List of hints"+l);
		             
		             hint1=l.get(0);
		          	hint2=l.get(1);
		             hint3=l.get(2);    
			Question q = new Question(0,question, "","", "","","",
					 type_ques_n,hint1, hint2, hint3, 0,q_txt_id, 0,0, 0, 0);
						
			/*Question(int q_cb_id, String question, String ansoption, String answer_1, String answer_2, String answer_3,
			String answer_4, String type_ques_n, String hint1, String hint2, String hint3, int q_num_id,int q_txt_id, double answer,
			int hint_id, double uplimit, double lowerlimit)	
						
						*/
			        
						queue.add(q);
						}
				}
				catch (Exception e) {
					e.printStackTrace();
				} 

         
        
        
        
        
        
        
        return queue;

		}

	
		
public static int updateattemptplab(String username,int expno)
{
	System.out.println(username+"'s Experiment number"+expno);
	   Statement stmt = null;
	   int x=0;
	   	   try{


	   	      stmt = conn.createStatement();
	           
	   	      
	   	      PreparedStatement ps;
	   	      
	   	         String insertTableSQL = "update attemptstat set prelab=? where username=? and expno=?";
	   	   		ps = conn.prepareStatement(insertTableSQL);
	   	    
	   	   		ps.setInt(1,1);
	   	   		ps.setString(2,username);
	   	   		
	   	   		ps.setInt(3,expno);
	   	   		 
	   	         
	   	       
	   	   	 if(ps.executeUpdate()==0);
	   			//newUser =0;
	   	  		{	System.out.println("Record is inserted into  student's Attempt Status table for prelab completion!");
	   		    x=1;
	   	  		}

	   	  	stmt.close();
	   	  	
	   	      }catch(SQLException se){

		      //Handle errors for JDBC

		      se.printStackTrace();

		   }catch(Exception e){

		      //Handle errors for Class.forName

		      e.printStackTrace();

		   }
	   	  		
	return x;	

}

public static int updateattemptExpt(String username,int expno)
{
	System.out.println(username+"'s Experiment number"+expno);
	   Statement stmt = null;
	   int x=0;
	   	   try{


	   	      stmt = conn.createStatement();
	           
	   	      
	   	      PreparedStatement ps;
	   	      
	   	         String insertTableSQL = "update attemptstat set expmt=? where username=? and expno=?";
	   	   		ps = conn.prepareStatement(insertTableSQL);
	   	    
	   	   		ps.setInt(1,1);
	   	   		ps.setString(2,username);
	   	   		
	   	   		ps.setInt(3,expno);
	   	   		 
	   	         
	   	       
	   	   	 if(ps.executeUpdate()==0)
	   			//newUser =0;
	   	  		{	System.out.println("Record is inserted into  student's Attempt Status table for Expmt completion!");
	   		    x=1;
	   	  		}

	   	  	stmt.close();
	   	  	
	   	      }catch(SQLException se){

		      //Handle errors for JDBC

		      se.printStackTrace();

		   }catch(Exception e){

		      //Handle errors for Class.forName

		      e.printStackTrace();

		   }
	   	  		
	return x;	

}

public static int updateattemptcomp(String username,int expno)
{
	System.out.println(username+"'s Experiment number"+expno);
	   Statement stmt = null;
	   int x=0;
	   	   try{


	   	      stmt = conn.createStatement();
	           
	   	      
	   	      PreparedStatement ps;
	   	      
	   	         String insertTableSQL = "update attemptstat set postlab=? where username=? and expno=?";
	   	   		ps = conn.prepareStatement(insertTableSQL);
	   	    
	   	   		ps.setInt(1,1);
	   	   		ps.setString(2,username);
	   	   		
	   	   		ps.setInt(3,expno);
	   	   		 
	   	         
	   	       
	   	   	 if(ps.executeUpdate()==0);
	   			//newUser =0;
	   	  		{	System.out.println("Record is inserted into  student's Attempt Status table!");
	   		    x=1;
	   	  		}

	   	  	stmt.close();
	   	  	
	   	      }catch(SQLException se){

		      //Handle errors for JDBC

		      se.printStackTrace();

		   }catch(Exception e){

		      //Handle errors for Class.forName

		      e.printStackTrace();

		   }
	   	  		
	return x;	

}






public void Regis(String netid,String fname,String lname,String batch,String passw,String email){	
	
	//User u =new User();

		   Statement stmt = null;
		   int x=0;
		   try{ 
			   stmt = conn.createStatement();
	 
		   	      PreparedStatement ps;
		   	      //netid, type, password, fname, lname, username, netid, id
		   	      
		   	      String insertTableSQL = "insert into user (netid,type,password,fname,lname,username) VALUES"
		   	   			+ "(?,?,?,?,?,?)";
		   	   		ps = conn.prepareStatement(insertTableSQL);
		   	   	    String type= "student";
		   	   	    //String type= "student";
	   	   	        String username=fname;
		   	   		ps.setString(1, netid);
		   	   		ps.setString(2, type);
		   	   	    ps.setString(3, passw);
	   	   		
		   	   		ps.setString(4, fname);
		   	   		ps.setString(5, lname);
		   	   	    ps.setString(6, username);
	   	   		
		   	         
		   	         
		   	       
		   	   	 if(ps.executeUpdate()==0)
		   			//newUser =0;
		   	  		{	System.out.println("Record is inserted into USER table!");
		   		    x=1;
		   	  		}
		   	   
		   	   
		   	   
		   	   

		   	      //STEP 6: Clean-up environment

		   	   

		   	      //rs.close();

		   	      stmt.close();

		   	    //  conn.close();

		   	   
		   	      
		   	         
		   	   

		   	   }catch(SQLException se){

		   	      //Handle errors for JDBC

		   	      se.printStackTrace();

		   	   }catch(Exception e){

		   	      //Handle errors for Class.forName

		   	      e.printStackTrace();

		   	   }

		   	      //finally block used to close resources

		   		  
		   		   
		   	   


		   		
		   	   
		   	   
		   }

		
		
		
		
		/***
		
		public static void main(String args[]){
			
			
			Dao dd= new Dao();
			queue=dd.QchcekBox(4);
			System.err.println(queue.size());
			System.out.println();
			int i=1;
			while(!queue.isEmpty()){
				
				Question q = queue.poll();
		       if(q.getQ_num_id()!=0){
			
			System.out.println("Qnum"+q.getType_ques_n());
			System.out.println("Question"+q.getQuestion());
			System.out.println("upper limit "+q.getUplimit());
			System.out.println("lower limit "+q.getLowerlimit());
			
			
			
		}else if(q.getQ_cb_id()!=0){
				System.out.println("Qnum"+q.getType_ques_n());
				System.out.println("Question"+q.getQuestion());
				System.out.println("answer "+q.getAnswer_1());
				System.out.println("hint "+q.getHint1());
				System.out.println("hint "+q.getHint2());
				System.out.println("hint "+q.getHint3());
				
				
			
				
		         }
		else if(q.getQ_txt_id()!=0){
			
			System.out.println("***********************Qnum"+q.getType_ques_n());
			System.out.println("Question"+q.getQuestion());
			System.out.println("upper limit "+q.getUplimit());
			System.out.println("lower limit "+q.getLowerlimit());
			
			System.out.println("Qnum"+q.getType_ques_n());
			System.out.println("Question"+q.getQuestion());
			System.out.println("answer "+q.getAnswer_1());
			System.out.println("hint "+q.getHint1());
			System.out.println("hint "+q.getHint2());
			System.out.println("hint ***********************************"+q.getHint3());
			
			
			
		
			
	         }
				i++;
			}
			
			
			
			
			//System.out.println("list is"+l);
		
		}
		
		***/











		


















}

