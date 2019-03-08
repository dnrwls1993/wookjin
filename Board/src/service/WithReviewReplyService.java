package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.WithReviewReplyDao;

@Service
public class WithReviewReplyService implements IWithReviewReplyService{

	@Autowired
	private WithReviewReplyDao dao;
	
	@Override
	public boolean writeWithReply(Map<String, Object> params) {
		System.out.println("서비스 -> 동행 후기 댓글 입력");
		if(dao.insertWithReply(params)>0) {
			System.out.println("서비스 -> 동행 후기 댓글 입력 성공");
			return true;
		} else {
			System.out.println("서비스 -> 동행 후기 댓글 입력 실패");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> getWithReply(int with_review_board_num) {
		return dao.selectByWithBoardNum(with_review_board_num);
	}

	@Override
	public List<Map<String, Object>> getWithBoardList(Map<String, Object> params) {		
		return dao.withBoardList(params);
	}
	
	

}
