package dao;

import java.util.List;
import java.util.Map;

public interface ReviewReplyDao {
	public int insertReply(Map<String, Object> params);
	public Map<String, Object> selectOne(int num);
	public List<Map<String, Object>> selectByBoardNum(int board_num);
	public List<Map<String, Object>> boardList(Map<String, Object> param);
}
