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

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private IReviewReplyService service;
	
	
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
}