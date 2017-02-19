package com.ptis.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ptis.ssh.dao.CommentDao;
import com.ptis.ssh.entities.Comment;
import com.ptis.ssh.service.CommentService;

public class CommentServiceImpl implements CommentService{

	private CommentDao commentDao;
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	@Transactional
	public void saveComment(Comment comment) {
		commentDao.save(comment);
	}
	@Transactional
	public List<Comment> findCommentByTourismId(int tourismId) {
		return commentDao.FindCommnetByTourismId(tourismId);
	}
	@Transactional
	public int GetTouriamPrise(int tourismId) {
		commentDao.GetTouriamPrise(tourismId);
		return 0;
	}
	@Transactional
	public List<Comment> FindCommentPraise(int tourismId) {
		return commentDao.FindCommentPraise(tourismId);	
	}
;
}
