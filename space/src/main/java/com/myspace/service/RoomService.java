package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.OptionVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;

public interface RoomService {
	
    boolean getInsertResult(RoomVO rvo);
    boolean getInserOptiontResult(OptionVO ovo);
    boolean getInsertServiceResult(ServiceVO svo);
    String getInsertedId();
    ArrayList<RoomVO> getMapList();
    ArrayList<RoomVO> getList(String location1, String location2, String date, double time, String type, int capacity, 
                                                            int min, int max, int stars, String[] option_list, String order);
    ArrayList<OptionVO> getOptionList(ArrayList<String> rid_list, String order);
    boolean getUpdateResult(RoomVO rvo);
    boolean getUpdateOptionResult(OptionVO ovo);
    boolean getUpdateServiceResult(ServiceVO svo);
    boolean getDeleteResult(String rid);
    String getFile(String rid, String rsfile);
    String getRsid(String rid, String reserve_date, String checkin_time, String checkout_time, String name, String hp, String corp_name);
	
	// »õ¹Ì
	RoomVO getRoomContent(String rid);
	OptionVO getRoomOption(String rid);
	ServiceVO getService(String rid);
	ArrayList<ReservationVO> getAvailableTime(String rid);
	boolean getReserveResult(ReservationVO vo);
	ReservationVO getReservation(String rsid);
	
}
