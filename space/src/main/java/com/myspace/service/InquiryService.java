package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.InquiryVO;

public interface InquiryService {
	
	ArrayList<InquiryVO> getList(String id);
	ArrayList<Object> getListAll(int start, int end);
	InquiryVO getContent(String qid);
	boolean getInsertResult(InquiryVO vo);
	boolean getUpdateResult(String qid, String acontent);
	int execTotalCount();
}
