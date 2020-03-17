package yr;

import java.util.List;

import web.petDAO.model.BoardDAO;
import web.petDAO.model.BoardDTO;

public class aaaaaaaaaaaaaaa {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		BoardDAO dao = new BoardDAO();				  
		  List list = dao.getArticles(1, 5);
		  BoardDTO dto = new BoardDTO();
		  for(int i = 0 ; i < list.size() ; i++){
			  dto = (BoardDTO)list.get(i);  			
		
		}
	
	}
}
