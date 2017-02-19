package com.ptis.ssh.dao;

import java.util.List;

import com.ptis.ssh.entities.Comment;

public interface CommentDao {
	
 public abstract void save(Comment comment);
 
 public abstract List<Comment> FindCommnetByTourismId(int tourismId);
 
 /**
  * ��ѯ����ĺ�����
  * @param tourismId
  * @return
  */
 public abstract int GetTouriamPrise(int tourismId);
 
 public abstract List<Comment> FindCommentPraise(int tourismId);
}
