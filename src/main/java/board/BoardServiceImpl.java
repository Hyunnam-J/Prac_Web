package board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import common.PageVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardDAO dao;

	//전체 게시글(리스트) 조회
	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	//10건 게시글(리스트) 조회
	@Override
	public BoardPageVO boardList(BoardPageVO pageVo) {
		return dao.boardList(pageVo);
	}

	@Override
	public int insertPost(BoardVO vo) {
		return dao.insertPost(vo);
	}

	@Override
	public int readcnt(int id) {
		return dao.readcnt(id);
	}

	@Override
	public BoardVO detail(int id) {
		return dao.detail(id);
	}

	@Override
	public int insertReply(BoardVO vo) {
		return dao.insertReply(vo);
	}

}