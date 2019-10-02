package com.tu.comment.dao;

import java.util.List;





import org.springframework.stereotype.Repository;

import com.tu.comment.vo.CommentVO;
 
@Repository("com.tu.comment.dao.CommentMapper")
public interface CommentMapper {
    // ��� ����
    public int commentCount() throws Exception;
 
    // ��� ���
    public List<CommentVO> commentList() throws Exception;
 
    // ��� �ۼ�
    public int commentInsert(CommentVO comment) throws Exception;
    
    // ��� ����
    public int commentUpdate(CommentVO comment) throws Exception;
 
    // ��� ����
    public int commentDelete(int cno) throws Exception;
 
}

