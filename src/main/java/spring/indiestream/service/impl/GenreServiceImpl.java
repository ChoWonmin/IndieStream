package spring.indiestream.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.GenreDAO;
import spring.indiestream.domain.GenreVO;
import spring.indiestream.service.GenreService;

@Service
public class GenreServiceImpl implements GenreService{
	
	@Autowired
	private GenreDAO genreDAO;

	@Override
	public List<String> selectBymemberId(String memberId) {
		return genreDAO.selectBymemberId(memberId);
	}

	@Override
	public void addGenre(GenreVO genre) {
		genreDAO.addGenre(genre);
	}

	@Override
	public void deleteGenre(String memberId) {
		genreDAO.deleteGenre(memberId);
	}

}
