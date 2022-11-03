package join;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class JoinServiceImpl {
	@Autowired private JoinDAO dao;
	
	public int checkId(String id) {
		return dao.checkId(id);
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public MemberVO checkLogin(String id, String pw) {
		return dao.checkLogin(id, pw);
	}
	
	
}
