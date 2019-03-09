package controller;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IReviewReplyService;
import service.IWithReviewReplyService;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private IReviewReplyService service;
	
	@Autowired
	private IWithReviewReplyService withService;
	
	// ------------------------------ 여행후기 댓글 시작 ---------------------------//
	@ResponseBody
	@RequestMapping(value="/reply")
	public boolean writeReply(
			@RequestParam Map<String, Object> params) {
		System.out.println(params);
		return service.writeReply(params);
	}
	
	@ResponseBody
	@RequestMapping(value="/all/{board_num}")
	public ResponseEntity<List<Map<String, Object>>> list(
			@PathVariable("board_num") int board_num){
		System.out.println(board_num);
		ResponseEntity<List<Map<String, Object>>> entity = null;
		try{
			List<Map<String, Object>> replyList = service.getReply(board_num);
			entity = new ResponseEntity<List<Map<String,Object>>>(replyList, HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// ------------------------------ 여행후기 댓글 끝 ---------------------------//
	
	// ------------------------------ 동행후기 댓글 시작 ---------------------------//
	@ResponseBody
	@RequestMapping(value="/withReply")
	public boolean writeWithReply(
			@RequestParam Map<String, Object> params) {
		System.out.println(params);
		return withService.writeWithReply(params);
	}
	
	@ResponseBody
	@RequestMapping(value="/withAll/{with_review_board_num}")
	public ResponseEntity<List<Map<String, Object>>> withList(
			@PathVariable("with_review_board_num") int with_review_board_num){
		System.out.println("withAll : "+with_review_board_num);
		ResponseEntity<List<Map<String, Object>>> entity = null;
		try {
			List<Map<String, Object>> withReplyList = withService.getWithReply(with_review_board_num);
			entity = new ResponseEntity<List<Map<String,Object>>>(withReplyList, HttpStatus.OK);
		} catch (Exception e) {
			System.out.println("컨트롤러 withList 요청 오류");
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("여기 탐?");
		return entity;
	}
	// ------------------------------ 동행후기 댓글 끝 ---------------------------//
}