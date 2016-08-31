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
import net.nigne.yzrproject.domain.ReviewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void Reviewcnt_Update(int no, int review_cnt) throws Exception {
		
		ReviewVO vo = entityManager.find(ReviewVO.class, getReview_Read(no).getNo());
		ReviewVO mergevo = entityManager.merge(vo);
		mergevo.setReview_cnt(review_cnt + 1);
	}


	@Override
	public void reviewInsert(String member_id, String movie_id, String review_title, String review_content,
			String review_date, int review_cnt, String review_file, String review_like) throws Exception {
		ReviewVO vo = new ReviewVO();
		vo.setMovie_id(movie_id);
		vo.setMember_id(member_id);
		vo.setReview_title(review_title);
		// vo.setNo(3);
		vo.setReview_content(review_content);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String date = sdf.format(cal.getTime().getTime());
		vo.setReview_date(date);
		vo.setReview_cnt(review_cnt);
		vo.setReview_file(review_file);
		vo.setReview_like(review_like);
		entityManager.persist(vo);
	}

	@Override
	public List<ReviewVO> getReview(String movie_id) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReviewVO> cq = cb.createQuery(ReviewVO.class);
		Root<ReviewVO> root = cq.from(ReviewVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root);
		cq.where(p);
		TypedQuery<ReviewVO> tq = entityManager.createQuery(cq);
		List<ReviewVO> reviewList = tq.getResultList();
		return reviewList;
	}

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
	public ReviewVO getReview_Read(int no) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReviewVO> cq = cb.createQuery(ReviewVO.class);
		Root<ReviewVO> root = cq.from(ReviewVO.class);
		Predicate p = cb.equal(root.get("no"), no);
		cq.select(root).where(p);
		TypedQuery<ReviewVO> tq = entityManager.createQuery(cq);
		ReviewVO vo = tq.getSingleResult();
		return vo;
	}
	
	@Override
	public long getTotalCount(String movie_id) {
		// TODO Auto-generated method stub
		
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(long.class);
		Root<ReviewVO> root = cq.from(ReviewVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(cb.count(root.get("movie_id")));
		cq.where(p);
		TypedQuery<Long> tq = entityManager.createQuery(cq);
		long totalcount = tq.getSingleResult();
		return totalcount;
	
	}

	@Override
	public List<ReviewVO> getListPage(String movie_id, Criteria criteria) {
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReviewVO> cq = cb.createQuery(ReviewVO.class);
		Root<ReviewVO> root = cq.from(ReviewVO.class);
		Predicate p = cb.equal(root.get("movie_id"), movie_id);
		cq.select(root);
		cq.where(p).orderBy(cb.desc(root.get("no")));
		TypedQuery<ReviewVO> tq = entityManager.createQuery(cq).setFirstResult(criteria.getStartPage()).setMaxResults(criteria.getArticlePerPage());
		List<ReviewVO> reviewpagelist = tq.getResultList();
		return reviewpagelist;
	}


	@Override
	public void Review_Update(int no, String review_title, String review_content, String review_file) throws Exception {
		// TODO Auto-generated method stub
		ReviewVO vo = entityManager.find(ReviewVO.class, getReview_Read(no).getNo());
		ReviewVO mergevo = entityManager.merge(vo);
		mergevo.setNo(no);
		mergevo.setReview_title(review_title);
		mergevo.setReview_content(review_content);
		if(review_file == null ||review_file==""){
			mergevo.setReview_file(vo.getReview_file());
		}else{
			mergevo.setReview_file(review_file);
		}
	}

	@Override
	public void delete_Review(int no) {
		// TODO Auto-generated method stub
		ReviewVO vo = entityManager.find(ReviewVO.class, getReview_Read(no).getNo());
		entityManager.remove(vo);
		
	}

	@Override
	public void delete_Review_Reply(int review_no) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		CriteriaBuilder cb = entityManager.getCriteriaBuilder();
		CriteriaQuery<ReplyVO> cq = cb.createQuery(ReplyVO.class);
		Root<ReplyVO> root = cq.from(ReplyVO.class);
		Predicate p = cb.equal(root.get("review_no"), review_no);
		cq.select(root);
		cq.where(p);
		TypedQuery<ReplyVO> tq = entityManager.createQuery(cq);
		List<ReplyVO> replylist = tq.getResultList();
		for(ReplyVO replyvo : replylist){
			entityManager.remove(replyvo);
		}
	}
}