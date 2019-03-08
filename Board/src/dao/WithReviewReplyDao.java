package dao;

import java.util.List;
import java.util.Map;

public interface WithReviewReplyDao {
	public int insertWithReply(Map<String, Object> params);
	public Map<String, Object> selectOne(int num);
	public List<Map<String, Object>> selectByWithBoardNum(int with_review_board_num);
	public List<Map<String, Object>> withBoardList(Map<String, Object> param);
}