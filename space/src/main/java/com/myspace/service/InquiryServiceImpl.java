package com.myspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.InquiryDAO;
import com.myspace.vo.InquiryVO;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryDAO inquiryDAO;

	@Override
	public ArrayList<InquiryVO> getList() {
		return inquiryDAO.getList();
	}

	@Override
	public InquiryVO getContent(String qid) {
		return inquiryDAO.getContent(qid);
	}

	@Override
	public boolean getInsertResult(InquiryVO vo) {
		return inquiryDAO.getInsertResult(vo);
	}

	@Override
	public boolean getUpdateResult(String qid, String acontent) {
		return inquiryDAO.getUpdateResult(qid, acontent);
	}
	
	



}
