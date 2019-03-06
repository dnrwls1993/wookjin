package service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.WithReviewDao;

@Service
public class WithReviewService implements IWithReviewService{

	@Autowired
	private WithReviewDao dao;
	
	@Override
	public boolean insertWithReview(Map<String, Object> param) {
		System.out.println("서비스 도착");
		System.out.println(param);
		if(dao.insertWithReview(param)>0) {
			System.out.println("서비스 -> insert 성공");
			return true;
		} else {
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

	@Override
	public List<Map<String, Object>> getWithBoard(int with_board_num) {
		return dao.selectByWithBoardNum(with_board_num);
	}

}
