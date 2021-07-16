package com.myspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.NoticeDAO;
import com.myspace.vo.NoticeVO;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDAO noticeDAO;
	
	@Override
	public String getFile(String nid) {
		return noticeDAO.getFile(nid);
	}
	
	@Override
	public boolean getDeleteResult(String nid) {
		return noticeDAO.getDeleteResult(nid);
	}
	
	@Override
	public boolean getUpdateResultNofile(Object vo) {
		return noticeDAO.getUpdateResultNofile((NoticeVO)vo);
	}
	
	@Override
	public boolean getUpdateResult(Object vo) {
		return noticeDAO.getUpdateResult((NoticeVO)vo);
	}
	
	@Override
	public void getUpdateHit(String nid) {
		noticeDAO.getUpdateHit(nid);
	}
	
	@Override
	public Object getContent(String nid) {
		return noticeDAO.getContent(nid);
	}
	
	@Override
	public boolean getInsertResult(Object vo) {
		return noticeDAO.getInsertResult((NoticeVO)vo);
	}
	
	@Override
	public int execTotalCount() {
		return noticeDAO.execTotalCount();
	}
	
	@Override
	public ArrayList<Object> getnextList(int rno){
		return noticeDAO.getnextList(rno);
	}
	@Override
	public ArrayList<Object> getList(int start, int end){
		return noticeDAO.getList(start, end);
	}
}
