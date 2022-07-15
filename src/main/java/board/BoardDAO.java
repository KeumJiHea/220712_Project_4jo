package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.DBConnect;

public class BoardDAO {
PreparedStatement ps;
Connection con;
ResultSet rs;
public BoardDAO(){
	try {
		con=DBConnect.getConnection();
	} catch (Exception e) { 
		e.printStackTrace();
	}
}

public ArrayList<BoardDTO> list(int start,int end){
	System.out.println("start : "+start);
	System.out.println("end : "+end);
	ArrayList<BoardDTO> li = new ArrayList<BoardDTO>();
	if(start==0) { start=1; }
	//String sql = "select * from board_table order by idgroup desc,step asc";
	String sql = "select B.* from(select rownum rn, A.* from\r\n"
			+ "(select * from board_table order by id desc)A)B \r\n"
			+ "where rn between ? and ?order by idgroup desc,step asc";
	try {
		ps= con.prepareStatement(sql);
		ps.setInt(1, start);
		ps.setInt(2, end);
		
		rs= ps.executeQuery();
		
		while(rs.next()) {
			li.add(getBoard());
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return li;
}

private BoardDTO getBoard() {
	BoardDTO dto = new BoardDTO();
	
	try {
		dto.setId(rs.getInt("id"));
		dto.setName(rs.getString("name"));
		dto.setTitle(rs.getString("title"));
		dto.setContent(rs.getString("content"));
		dto.setSavedate(rs.getTimestamp("savedate"));
		dto.setHit(rs.getInt("hit"));
		dto.setIdgroup(rs.getInt("idgroup"));
		dto.setIndent(rs.getInt("indent"));
		dto.setStep(rs.getInt("step"));
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return dto;
}


public void insert(String name, String title, String content) {
	String sql = "insert into board_table(id,name,title,content,idgroup,step,indent)"+
			"values(test_board_seq.nextval,?,?,?,test_board_seq.currval,0,0)";
	
	
	try {
		ps = con.prepareStatement(sql);
		ps.setString(1,name);
		ps.setString(2, title);
		ps.setString(3, content);
		
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

private void upHit(String id) {
	String sql = "update board_table set hit=hit+1 where id="+id;
	
	try {
		ps = con.prepareStatement(sql);
		
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
		
	}
}


public BoardDTO getContent(String id) {
	upHit(id);
	String sql = "select * from board_table where id="+id;
	
	try {
		ps = con.prepareStatement(sql);
		rs= ps.executeQuery();
		
		while(rs.next()) {
		return getBoard();
		}
	} catch (Exception e) { 
		e.printStackTrace();
	}
	return null;
}


public void delete(String id) {
	String sql="delete from board_table where id="+id;
	
	try {
		ps = con.prepareStatement(sql);
		ps.executeUpdate();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void update(BoardDTO dto) {
	String sql = "update board_table set name=?, title=?, content=? where id=?";
	
	try {
		ps= con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		ps.setInt(4, dto.getId());
		
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
	
}

public void replyshap(BoardDTO dto) {
	String sql = "update board_table set step=step+1 where idgroup=? and step> ?";
	
	try {
		ps = con.prepareStatement(sql);
		
		ps.setInt(1, dto.getIdgroup());
		ps.setInt(2, dto.getStep());
		
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
}


public void reply(BoardDTO dto) {
	replyshap(dto);
	//네임빼기 <% request.setAttribute("name")%>으로 바꿔서 답변 이름 바꾸기
	String sql = "insert into board_table(id,name,title,content,idgroup,step,indent)"+
			"values(test_board_seq.nextval,?,?,?,?,?,?)";
	
	try {
		ps = con.prepareStatement(sql);
		ps.setString(1, dto.getName());
		ps.setString(2, dto.getTitle());
		ps.setString(3, dto.getContent());
		
		ps.setInt(4, dto.getIdgroup());
		ps.setInt(5, dto.getStep()+1);
		ps.setInt(6, dto.getIndent()+1);
		
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
}


public int getTotalPage() {
	String sql = "select count(*) from board_table";
	int cnt = 0;
	
	try {
		ps=con.prepareStatement(sql);
		rs = ps.executeQuery();
		
		if(rs.next()) {
		
		cnt=rs.getInt(1);
		
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	return cnt;
}


public PageCount pagingNum(int start) {
	if(start==0){ start=1;}
	
	PageCount pc = new PageCount(); 
	
	int pageNum = 5;
	int totalpage = getTotalPage();
	int allpage=0;
	
	allpage = totalpage/pageNum ;
	
	if(totalpage % pageNum != 0 ) { allpage+=1;}
	
	pc.setTotEndPage(allpage);
	pc.setStartPage((start-1)*pageNum +1);
	pc.setEndPage(pageNum*start);
	
	return pc;
}

}







