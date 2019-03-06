package dao;

import java.util.List;
import java.util.Map;

public interface WithReviewDao {
	public int insertWithReview(Map<String, Object> param);
	public Map<String, Object> selectOne(int num);
	public List<Map<String, Object>> selectAll();
	public List<Map<String, Object>> selectByWithBoardNum(int with_board_num);
}
