package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.OptionVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;

public interface RoomService {
	
	boolean getInsertResult(RoomVO rvo);
	boolean getInserOptiontResult(OptionVO ovo);
	boolean getInsertServiceResult(ServiceVO svo);
	String getInsertedId();
	ArrayList<RoomVO> getList();
	ArrayList<RoomVO> getList(String location1, String location2, String date, String type, int capacity, int min, int max, int stars, ArrayList<String> option_list);
	ArrayList<OptionVO> getOptionList();
	
	//»õ¹Ì
	RoomVO getRoomContent(String rid);
    OptionVO getRoomOption(String rid);
    ServiceVO getService(String rid);
    ArrayList<Object> getAvailableTime(String rid);
    /* boolean getReserveResult(ReservationVO vo); */
	
}
