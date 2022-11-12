package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import common.PageVO;

@Repository
public class BoardDAO implements BoardService{
	@Autowired @Qualifier("hanul") private SqlSession sql;

	@Override
	public List<BoardVO> list() {
		return sql.selectList("board.list");
	}

	@Override
	public BoardPageVO boardList(BoardPageVO pageVo) {
		pageVo.setTotalList(sql.selectOne("board.countTotal"));
		pageVo.setList(sql.selectList("board.list_ten", pageVo));
		return pageVo;
	}

	@Override
	public int insertPost(BoardVO vo) {
		return sql.insert("board.insertPost", vo);
	}

	@Override
	public int readcnt(int id) {
		return sql.update("board.readcnt", id);
	}

	@Override
	public BoardVO detail(int id) {
		return sql.selectOne("board.detail", id);
	}

	@Override
	public int insertReply(BoardVO vo) {
		return sql.insert("board.insertReply", vo);
	}

	@Override
	public int delete(int id) {
		return sql.delete("board.delete", id);
	}

}