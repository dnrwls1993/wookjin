package service;

import java.util.List;
import java.util.Map;

public interface IWithReviewService {
	public boolean insertWithReview(Map<String, Object> param);
	public Map<String, Object> selectOne(int num);
	public List<Map<String, Object>> selectAll();
}
