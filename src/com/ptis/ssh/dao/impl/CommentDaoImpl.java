package com.ptis.ssh.dao.impl;

import java.util.List;






import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;

import com.ptis.ssh.dao.BaseDao;
import com.ptis.ssh.dao.CommentDao;
import com.ptis.ssh.entities.Comment;

public class CommentDaoImpl extends BaseDao implements CommentDao {

	public void save(Comment comment) {
		getSession().save(comment);
	}

	@SuppressWarnings("unchecked")
	public List<Comment> FindCommnetByTourismId(int tourismId) {
		 //select user.username,user.truename,user.sex,user.idnum,user.level,s.sumScore 
		//from Score as s,Examuser as user where s.id.userId = user.id 
		//String hql = "From Comment as c ,User as u where  c.userId=u.userId and c.tourismId="+tourismId;
		String hql = "From Comment  c  LEFT OUTER JOIN FETCH c.user where c.tourismId="+tourismId;
		return getSession().createQuery(hql).list();
	}

     
	public int GetTouriamPrise(int tourismId) {
		String hql ="select count(*) from Comment c where c.commentStar>3 and c.tourismId="+tourismId;
		System.out.println("À´×ÔCommentDaoImpl:"+getSession().createQuery(hql));
		return ((Long)getSession().createQuery(hql).iterate().next()).intValue();
	}
	 @SuppressWarnings("unchecked")
	public List<Comment> FindCommentPraise(int tourismId){
		// String hql="From Comment c where where c.commentStar>3 and c.tourismId="+tourismId;	
		 Criteria criteria =getSession().createCriteria(Comment.class);
		 criteria.add(Restrictions.gt("commentStar",new Integer(3)));
		 criteria.add(Restrictions.eq("tourismId", new Integer(tourismId)));
		 return criteria.list();
	 }

}
