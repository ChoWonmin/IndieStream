package spring.indiestream.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import spring.indiestream.domain.ImageVO;

public interface ImageDAO {

	
	void setSqlSession(SqlSession sqlSession);
	int imageInsert(ImageVO imageVO);
	List<ImageVO> imageSelectAll(String no);
	int imageUpdate(ImageVO imageVO);
	int imageDeleteAll(ImageVO imageVO);
	int imageDeleteOne(ImageVO imageVO);
}
