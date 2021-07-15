package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.NoticeVO;


public interface NoticeService {
	String getFile(String nid);
	boolean getDeleteResult(String nid);
	boolean getUpdateResultNofile(Object vo);
	boolean getUpdateResult(Object vo);
	void getUpdateHit(String nid);
	Object getContent(String nid);
	int execTotalCount();
	boolean getInsertResult(Object vo);
	ArrayList<Object> getList(int start, int end);
	
	
}
