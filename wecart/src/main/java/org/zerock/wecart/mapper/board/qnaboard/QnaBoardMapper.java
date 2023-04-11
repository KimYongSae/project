package org.zerock.wecart.mapper.board.qnaboard;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.wecart.domain.board.Criteria;
import org.zerock.wecart.domain.board.QnaBoardCommentVO;
import org.zerock.wecart.domain.board.QnaBoardVO;
import org.zerock.wecart.domain.board.QnaBoard_CommentCountVO;

public interface QnaBoardMapper {
	// 전체 목록조회
	public abstract List<QnaBoard_CommentCountVO> selectAll(Criteria cri);
	
	// 게시글 하나 상세조회
	@Select("SELECT * FROM qna_board WHERE post_no = #{post_no}")
	public abstract QnaBoardVO read(Integer post_no);
	
	
	@Select("SELECT COUNT(*) FROM qna_board WHERE post_no > 0")
	public abstract Integer selectTotalCount();
	
	
} // end interface
