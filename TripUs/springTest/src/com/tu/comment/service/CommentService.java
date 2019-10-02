package com.tu.comment.service;
import java.util.List;


import java.util.List;

import javax.annotation.Resource;
 





import org.springframework.stereotype.Service;
 





import com.tu.comment.dao.CommentMapper;
import com.tu.comment.vo.CommentVO;
 
@Service("com.tu.comment.service.CommentService")
public class CommentService {
 
    @Resource(name="com.tu.comment.dao.CommentMapper")
    CommentMapper mCommentMapper;
    
    public List<CommentVO> commentListService() throws Exception{
        System.out.println("CommentService: commentListService");
        System.out.println(">>>"+mCommentMapper.commentList());
        
        return mCommentMapper.commentList();
    }
    
    public int commentInsertService(CommentVO comment) throws Exception{
        
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(CommentVO comment) throws Exception{
        
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int cno) throws Exception{
        
        return mCommentMapper.commentDelete(cno);
    }
}
 
