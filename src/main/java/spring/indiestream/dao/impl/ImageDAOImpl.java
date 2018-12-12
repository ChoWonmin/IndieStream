package spring.indiestream.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.indiestream.dao.ImageDAO;
import spring.indiestream.domain.ImageVO;

@Repository
public class ImageDAOImpl implements ImageDAO{
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlsession = sqlSession;
	}

	@Override
	public int imageInsert(ImageVO imageVO) {
		
		return sqlsession.insert("imageMapper.imageInsert",imageVO);
	}

	@Override
	public List<ImageVO> imageSelectAll(String no) {
		
		return sqlsession.selectList("imageMapper.imageSelectAll",no);
	}

	@Override
	public int imageUpdate(ImageVO imageVO) {
		return sqlsession.update("imageMapper.imageUpdate",imageVO);
	}

	@Override
	public int imageDeleteAll(ImageVO imageVO) {
		
		return sqlsession.delete("imageMapper.imageDeleteAll",imageVO);
	}

	@Override
	public int imageDeleteOne(ImageVO imageVO) {
	
		return sqlsession.delete("imageMapper.imageDeleteOne",imageVO);
	}

}
