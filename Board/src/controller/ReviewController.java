package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.TravleReviewService;
import service.WithReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private TravleReviewService service;
	
	@Autowired
	private WithReviewService withService;
	
//------------------------------ 후기 메인 시작 --------------------------------------//
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(
			Model model
			) {
		System.out.println("메인입니다");
		model.addAttribute("review", service.selectAll());
		return "main";
	}
//------------------------------ 후기 메인 끝 --------------------------------------//	
	
	
	
	
	
//------------------------------ 여행 후기 시작 --------------------------------------//
	//여행 후기 작성
	@RequestMapping("/writeForm")
	public String writeForm() {
		System.out.println("리뷰작성");
		return "write";
	}
	
	//여행 후기 작성
	@RequestMapping("/write")
	public String writeReview(
			@RequestParam(value="title") String title,
			@RequestParam(value="travle") String travle,
			@RequestParam(value="backimg") String backimg,
			@RequestParam(value="content") String content,
			RedirectAttributes ra) {
		System.out.println("리뷰를 작성하세요");
		
		Map<String, Object> review = new HashMap<>();
		review.put("title", title);
		review.put("travle", travle);
		review.put("backimg", backimg);
		review.put("content", content);
		
		if(service.insertReview(review)) {
			System.out.println("작성 성공");
			ra.addAttribute("num", review.get("NUM"));
		} else {
			System.out.println("작성 실패");
		}
		return "redirect:reviewView";
	}
	
	//여행 후기 상세 페이지
	@RequestMapping("/reviewView")
	public String reviewView(Model model,
			int num) {
		System.out.println("리뷰보기");
		Map<String, Object> rev = service.selectOne(num);
		System.out.println(rev);
		model.addAttribute("review", rev);
		return "reviewView"; 
	}
//------------------------------ 여행 후기 끝 --------------------------------------//
	
	
	
	
	
//------------------------------ 동행 후기 시작 --------------------------------------//
	//회원 동행 후기 게시판
	@RequestMapping("/withBoard")
	public String withBoard(Model model, 
			HttpServletRequest req,
			int num) {

		System.out.println(num + "회원의 동행 후기");
		
		HttpSession session = req.getSession();
		session.setAttribute("num", num);
		int with_board_num = num;
		Map<String, Object> rev1 = service.selectOne(num);
		List<Map<String, Object>> rev2 = withService.getWithBoard(with_board_num);
		model.addAttribute("review", rev1);
		model.addAttribute("withReview", rev2);
		
		return "reviewBoard"; 
	}
	
	//동행 후기 작성
	@RequestMapping("/withWriteForm")
	public String withWriteForm() {
		System.out.println("동행 후기 작성");
		return "withWrite";
	}
	
	//여행 후기 작성
	@RequestMapping("/withWrite1")
	public String withWrite(
			@RequestParam(required=false) int avgscore,
			@RequestParam(value="withcontent") String withcontent,
			RedirectAttributes ra,
			HttpServletRequest req
			) {
		System.out.println("동행후기 저장 중...");
		HttpSession session = req.getSession();
		
		int num = (int) session.getAttribute("num");
		
		Map<String, Object> review = new HashMap<>();
		review.put("avgscore", avgscore);
		review.put("withcontent", withcontent);
		review.put("with_board_num", num);
		
		if(withService.insertWithReview(review)) {
			System.out.println("작성 성공");
			ra.addAttribute("num", num);
		} else {
			System.out.println("작성 실패");
		}
		return "redirect:withBoard";
		
	}
//------------------------------ 동행 후기 끝 --------------------------------------//
	

}