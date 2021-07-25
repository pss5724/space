package com.myspace.service;

import com.myspace.vo.ReservationVO;
import com.myspace.vo.ReviewVO;

public interface ReviewService {
	ReservationVO getSearchResult(String id, String rsid);
	ReviewVO getReviewContent(String id, String rsid);
	boolean getInsertResult(ReviewVO vo);
	boolean getUpdateResult(ReviewVO vo);
	boolean getDeleteResult(String id, String rsid);
	boolean insertTotallv(ReviewVO vo);
	
}
