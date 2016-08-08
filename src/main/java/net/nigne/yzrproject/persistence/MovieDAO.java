package net.nigne.yzrproject.persistence;

import java.util.List;

import net.nigne.yzrproject.domain.GenreVO;
import net.nigne.yzrproject.domain.MovieVO;

public interface MovieDAO {
	public MovieVO getMovie(String movie_id);
	
	public List<MovieVO> genreMovie(String member_id);		// ��õ�帣��ȭ���
	public List<MovieVO> actorMovie(String member_id);		// ��õ��쿵ȭ���
	public List<MovieVO> directorMovie(String member_id);	// ��õ������ȭ���
	public List<MovieVO> basicMovie();						// �⺻��ȭ��õ���
	
	public List<MovieVO> getMovieChart(String play, String order);	// ������Ʈ
	public List<MovieVO> getMovieSchedule();	// �󿵿�����
}
