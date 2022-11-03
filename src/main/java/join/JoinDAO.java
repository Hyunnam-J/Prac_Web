package join;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	public int checkId(String id) {
		return sql.selectOne("member.checkId", id);
	}

	public int insert(MemberVO vo) {
		return sql.insert("member.insert", vo);
	}

	public MemberVO checkLogin(String id, String pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		return sql.selectOne("member.checkLogin", map);
	}
	
	
}//class
