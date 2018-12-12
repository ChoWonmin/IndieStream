package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.GenreVO;

public interface GenreDAO {
	
	List<String> selectBymemberId(String memberId);
	
	void addGenre(GenreVO genre);
	
	void deleteGenre(String memberId);
	
}
