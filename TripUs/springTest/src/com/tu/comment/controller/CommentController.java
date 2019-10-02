package com.tu.comment.controller;
import java.util.List;

import javax.annotation.Resource;
 





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
 





import com.tu.comment.service.CommentService;
import com.tu.comment.vo.CommentVO;
 
@Controller
@RequestMapping("/comment")
public class CommentController {
 
    @Resource(name="com.tu.comment.service.CommentService")
    CommentService mCommentService;
    
    
    @RequestMapping("/list") //��� ����Ʈ
    @ResponseBody
    private List<CommentVO> mCommentServiceList(Model model) throws Exception{
    	System.out.println("CommentController: mCommentServiceList 진입");
        return mCommentService.commentListService();
    }

    
    @RequestMapping("/insert") //��� �ۼ� 
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam String content) throws Exception{
    	System.out.println("mCommentServiceInsert 진입");
        CommentVO comment = new CommentVO();
        comment.setTono("2");
        comment.setToid("aa");
        comment.setTonick("test"); 
        comment.setToprofile("test");
        comment.setTocontent(content);
        comment.setTodeleteyn("N");
        //�α��� ����� �����߰ų� ��� ��� �ۼ��ڸ� �Է¹޴� ���� �ִٸ� �Է� �޾ƿ� ������ ����ϸ� �˴ϴ�. ��� ��� ���� �������� �ʾұ⶧���� �ӽ÷� "test"��� ���� �Է��س���ϴ�.
        
        return mCommentService.commentInsertService(comment);
    }
    
    @RequestMapping("/update") //��� ����  
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception{
        
        CommentVO comment = new CommentVO();
        //comment.setCno(cno);
       // comment.setContent(content);
        
        return mCommentService.commentUpdateService(comment);
    }
    
    @RequestMapping("/delete/{cno}") //��� ����  
    @ResponseBody
    private int mCommentServiceDelete(@PathVariable int cno) throws Exception{
        
        return mCommentService.commentDeleteService(cno);
    }
    
}


