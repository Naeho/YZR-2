package net.nigne.yzrproject.persistence;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.springframework.stereotype.Repository;
import net.nigne.yzrproject.domain.Criteria;
import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@PersistenceContext
	private EntityManager entityManager;


	public List<GenreVO> getGenre(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<GenreVO> cq = cb.createQuery(GenreVO.class);
		Root<GenreVO> root = cq.from(GenreVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root).where(p);
		TypedQuery<GenreVO> tq = entityManager.createQuery(cq);
		List<GenreVO> genrelist = tq.getResultList();
		return genrelist;
	}

	@Override
	public void replyInsert(int reply_no,int review_no, String user_id, String reply_content, String reply_date,
			String reply_reply) throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setReply_no(reply_no);
		vo.setReview_no(review_no);
		vo.setUser_id(user_id);
		vo.setReply_content(reply_content);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd-hh:mm");
		String date = sdf.format(cal.getTime().getTime());
		vo.setReply_date(date);
		vo.setReply_reply(reply_reply);
		entityManager.persist(vo);
	}

	@Override
	public List<ReplyVO> getReply(int review_no) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReplyVO> cq = cb.createQuery(ReplyVO.class);
		Root<ReplyVO> root = cq.from(ReplyVO.class);
		Predicate p = cb.equal(root.get("review_no"), review_no);
		cq.select(root).where(p);
		TypedQuery<ReplyVO> tq = entityManager.createQuery(cq);
		List<ReplyVO> replylist = tq.getResultList();
		return replylist;
	}

	@Override
	public List<ReplyVO> getReply_Reply(int review_no) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReplyVO> cq = cb.createQuery(ReplyVO.class);
		Root<ReplyVO> root = cq.from(ReplyVO.class);
		Predicate p = cb.equal(root.get("review_no"), review_no);
		cq.select(root).where(p);
		TypedQuery<ReplyVO> tq = entityManager.createQuery(cq);
		List<ReplyVO> replylist1 = tq.getResultList();
		return replylist1;
	}

	@Override
	public void reply_Reply_Insert(int reply_no, int review_no, String user_id, String reply_content, String reply_date,
			String reply_reply) throws Exception {
		ReplyVO vo = new ReplyVO();
		vo.setReply_no(reply_no);
		vo.setReview_no(review_no);
		vo.setUser_id(user_id);
		vo.setReply_content(reply_content);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String date = sdf.format(cal.getTime().getTime());
		vo.setReply_date(date);
		vo.setReply_reply(reply_reply);
		entityManager.persist(vo);
	}

	@Override
	public long getReplyCount(int review_no) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(long.class);
		Root<ReplyVO> root = cq.from(ReplyVO.class);
		Predicate p = cb.equal(root.get("review_no"), review_no);
		cq.select(cb.count(root.get("review_no")));
		cq.where(p);
		TypedQuery<Long> tq = entityManager.createQuery(cq);
		long totalreplycount = tq.getSingleResult();
		return totalreplycount;
	}

	@Override
	public List<ReplyVO> getReplyPage(int review_no, Criteria criteria) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReplyVO> cq = cb.createQuery(ReplyVO.class);
		Root<ReplyVO> root = cq.from(ReplyVO.class);
		Predicate p = cb.equal(root.get("review_no"), review_no);
		cq.select(root);
		cq.where(p);
		TypedQuery<ReplyVO> tq = entityManager.createQuery(cq).setFirstResult(criteria.getStartPage()).setMaxResults(criteria.getArticlePerPage());
		List<ReplyVO> replypagelist = tq.getResultList();
		return replypagelist;
	}	
	@Override
	public void delete_Reply(int no) {
		// TODO Auto-generated method stub
		ReplyVO vo = entityManager.find(ReplyVO.class, no);
		entityManager.remove(vo);
	}
	



}