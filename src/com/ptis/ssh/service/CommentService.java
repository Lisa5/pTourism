package com.ptis.ssh.service;

import java.util.List;

import com.ptis.ssh.entities.Comment;

public interface CommentService {
	
 public abstract void saveComment(Comment comment);
 
 public abstract List<Comment> findCommentByTourismId(int tourismId);
 public abstract int GetTouriamPrise(int tourismId);
 public abstract List<Comment>  FindCommentPraise(int tourismId);
}
