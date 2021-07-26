package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.OptionVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.ReviewVO;
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
        
    ArrayList<Object> getAddrList();
    Integer getCount(String category);
    
    ArrayList<RoomVO> getCorpPageList(String id);
    ArrayList<Object> getReserveList(int start, int end, String[] ridList);
    ArrayList<Object> getReserveList(int start, int end);
    ArrayList<RoomVO> getRidList(String id);
    int execTotalCount();

    // 새미
    RoomVO getRoomContent(String rid);
    OptionVO getRoomOption(String rid);
    ArrayList<OptionVO> getRoomOptionList();
    ServiceVO getService(String rid);
    ArrayList<ReservationVO> getAvailableTime(String rid);
    boolean getReserveResult(ReservationVO vo);
    ReservationVO getReservation(String rsid);
    ArrayList<RoomVO> getRoomList();
    ArrayList<ReviewVO> getReviewList(String rid, int start, int end);
    int getCountReview(String rid);
    ArrayList<ReviewVO> getReviewGrade(String rid);
    boolean getCancelResult(String rsid);
    ArrayList<RoomVO> getTopReservation();
    ArrayList<RoomVO> getTopGrade();
    
    
    //성수
    ArrayList<ReservationVO> getReservationList(String id);
}
