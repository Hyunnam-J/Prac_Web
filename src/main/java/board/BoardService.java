package board;

import java.util.List;

import common.PageVO;

public interface BoardService {
	
	List<BoardVO> list ();
	BoardPageVO boardList(BoardPageVO pageVo);
	int insertPost(BoardVO vo);
	int readcnt(int id);
	BoardVO detail(int id);
	int insertReply(BoardVO vo);
	int delete(int id);

}
