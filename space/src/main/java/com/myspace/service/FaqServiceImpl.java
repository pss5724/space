package com.myspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.FaqDAO;

@Service("faqService")
public class FaqServiceImpl implements FaqService {
	
	@Autowired FaqDAO faqDAO;
	
	@Override
	public int execTotalCount() {
		return faqDAO.execTotalCount();
	}
	

	@Override
	public ArrayList<Object> getList(int start, int end){
		return faqDAO.getList(start, end);
	}
}
