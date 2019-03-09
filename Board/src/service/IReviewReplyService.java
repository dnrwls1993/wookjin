package service;

import java.util.List;
import java.util.Map;

public interface IReviewReplyService {
	public boolean writeReply(Map<String, Object> params);
	public List<Map<String, Object>> getReply(int board_num);
	public List<Map<String, Object>> getBoardList(Map<String, Object> params);
	
}
