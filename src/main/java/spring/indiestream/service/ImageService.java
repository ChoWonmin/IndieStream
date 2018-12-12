package spring.indiestream.service;

import java.util.List;

import spring.indiestream.dao.ImageDAO;
import spring.indiestream.domain.ImageVO;

public interface ImageService {

	public void setImageDao(ImageDAO imageDao);
	public int imageInsert(ImageVO imageVO);
	public List<ImageVO> imageSelectAll(String no);
	public int imageUpdate(ImageVO imageVO);
	public int imageDeleteAll(ImageVO imageVO);
	public int imageDeleteOne(ImageVO imageVO);
}
