package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.TravleReviewDao;

@Service
public class TravleReviewService implements ITravleReviewService{

	@Autowired
	private TravleReviewDao dao;
	
	@Override
	public boolean insertReview(Map<String, Object> param) {
		System.out.println("서비스 도착");
		System.out.println(param);		
		if(dao.insertReview(param)> 0) {
			System.out.println("서비스 -> insert 성공");
			return true;
		}else {
			System.out.println("서비스 -> insert 실패");
			return false;			
		}
	}
	
	@Override
	public Map<String, Object> selectOne(int num) {
		return dao.selectOne(num);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return dao.selectAll();
	}

}
