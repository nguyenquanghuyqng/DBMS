package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLTransientConnectionException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionUtils {

	public static Connection getMyConnection() throws SQLException,ClassNotFoundException{
		
		return DBConnection.getConnection();
	}
	
	 
	  //
	  // Test Connection ...
	  //
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		  System.out.println("Get connection ... ");
		  
	      // Lấy ra đối tượng Connection kết nối vào database.
	      Connection conn = ConnectionUtils.getMyConnection();
	 
	      System.out.println("Get connection " + conn);
	 
	      System.out.println("Done!");
	}

}
