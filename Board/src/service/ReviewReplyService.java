package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.ReviewReplyDao;

@Service
public class ReviewReplyService implements IReviewReplyService{

	@Autowired
	private ReviewReplyDao dao;
	
	@Override
	public boolean writeReply(Map<String, Object> params) {
		System.out.println("서비스 -> 댓글 입력");
		if(dao.insertReply(params)>0) {
			System.out.println("서비스 -> 댓글 입력 성공");
			return true;
		} else {
			System.out.println("서비스 -> 댓글 입력 실패");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> getReply(int board_num) {
		
		return dao.selectByBoardNum(board_num);
	}

	@Override
	public List<Map<String, Object>> getBoardList(Map<String, Object> params) {
		return dao.boardList(params);
	}

}
