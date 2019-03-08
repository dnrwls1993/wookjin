package service;

import java.util.List;
import java.util.Map;

public interface IWithReviewReplyService {
	public boolean writeWithReply(Map<String, Object> params);
	public List<Map<String, Object>> getWithReply(int with_review_board_num);
	public List<Map<String, Object>> getWithBoardList(Map<String, Object> params);
}
