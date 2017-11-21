package DAO;

import java.sql.*;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.*;


import BEAN.Vocabulary;


public class VocabularyDAO {
	
	public static List<Vocabulary> DisplayVocabulary(Connection conn) {
		
		List<Vocabulary> list = new ArrayList<Vocabulary>();
		
		String sql = "select * from Vocabulary";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				
				Vocabulary vol = new Vocabulary();
				
				vol.setVocabularyname(rs.getString("vocabularyname"));
				vol.setVocabularymean(rs.getString("vocabularymean"));
				
				list.add(vol);
				
			}
			stmt.close();
			rs.close();
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
		
	}

}
