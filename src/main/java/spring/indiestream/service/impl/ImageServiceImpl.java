package spring.indiestream.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.indiestream.dao.ImageDAO;
import spring.indiestream.domain.ImageVO;
import spring.indiestream.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired
	private ImageDAO imageDao;
	
	@Override
	public void setImageDao(ImageDAO imageDao) {
		this.imageDao = imageDao;
	}

	@Override
	public int imageInsert(ImageVO imageVO) {
		
		return imageDao.imageInsert(imageVO);
	}

	@Override
	public List<ImageVO> imageSelectAll(String no) {
		
		return imageDao.imageSelectAll(no);
	}

	@Override
	public int imageUpdate(ImageVO imageVO) {
		
		return imageDao.imageUpdate(imageVO);
	}

	@Override
	public int imageDeleteAll(ImageVO imageVO) {
		
		return imageDao.imageDeleteAll(imageVO);
	}

	@Override
	public int imageDeleteOne(ImageVO imageVO) {
		int noo = imageDao.imageDeleteOne(imageVO);
		System.out.println("ImageServiceImpl에서 imageDeleteOne()호출 결과 :: "+noo);
		return noo;
	}

	
	
}
