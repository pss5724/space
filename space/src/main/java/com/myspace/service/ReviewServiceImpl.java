package com.myspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.ReviewDAO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public ReservationVO getSearchResult(String id, String rsid) {
		return reviewDAO.getSearchResult(id, rsid);
	}

	@Override
	public ReviewVO getReviewContent(String id, String rsid) {
		return reviewDAO.getReviewContent(id, rsid);
	}

	@Override
	public boolean getInsertResult(ReviewVO vo) {
		return reviewDAO.getInsertResult(vo);
	}

	@Override
	public boolean getUpdateResult(ReviewVO vo) {
		return reviewDAO.getUpdateResult(vo);
	}

	@Override
	public boolean getDeleteResult(String id, String rsid) {
		return reviewDAO.getDeleteResult(id,rsid);
	}

	@Override
	public boolean insertTotallv(ReviewVO vo) {
		return reviewDAO.insertTotallv(vo);
	}

	
	
	



}
