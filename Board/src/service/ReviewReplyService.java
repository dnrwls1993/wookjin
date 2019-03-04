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
	
	private static final int NUM_OF_REPLY_PER_PAGE=10;
	
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
	
	private int getFirstRow(int page) {
		int result = (page-1)*NUM_OF_REPLY_PER_PAGE+1;
		return result;
	}
	
	private int getEndRow(int page) {
		int result = ((page-1)+1)*NUM_OF_REPLY_PER_PAGE;
		return result;
	}
	
	private int getStartPage(int page) {
		int result  = ((page-1)/NUM_OF_REPLY_PER_PAGE)*NUM_OF_REPLY_PER_PAGE+1;
		return result;
	}
	
	private int getEndPage(int page) {
		int result = getStartPage(page)+9;
		return result;
	}
	
	private int getTotalPage(Map<String, Object> params) {
		//총 페이지수 반환
		// 전체 게시글 개수 /페이지당 게시글 수   >>> 올림해서 반환
		int totalCount = dao.selectTotalCount(params);
		int totalPage = (totalCount-1)/NUM_OF_REPLY_PER_PAGE+1;
		return totalPage;
	}

	@Override
	public List<Map<String, Object>> getBoardList(Map<String, Object> params) {
		return dao.boardList(params);
	}

	@Override
	public Map<String, Object> getViewData(Map<String, Object> params) {
		int page = (int)params.get("page");
		
		Map<String, Object> daoParam = new HashMap<String,Object>();
		daoParam.put("firstRow", getFirstRow(page));
		daoParam.put("endRow", getEndRow(page));
		
		Map<String, Object> viewData = new HashMap<String,Object>();

		List<Map<String, Object>> boardList = getBoardList(daoParam);
		viewData.put("boardList", boardList);
		viewData.put("startPage", getStartPage(page));
		viewData.put("endPage", getEndPage(page));
		viewData.put("totalPage", getTotalPage(daoParam));
		viewData.put("page", page);
		return viewData;
	}
	
	
}
