package board;

import java.util.List;

import common.PageVO;

public interface BoardService {
	
	List<BoardVO> list ();
	BoardPageVO boardList(BoardPageVO pageVo);
	int insertPost(BoardVO vo);

}
