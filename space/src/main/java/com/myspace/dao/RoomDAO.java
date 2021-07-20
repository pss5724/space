package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.OptionVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;

@Repository
public class RoomDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private static String namespace = "mapper.room";
	
    /* 회의실 등록 */
    public boolean getInsertResult(RoomVO rvo) {
            boolean result = false;
            int value = sqlSession.insert(namespace+".insert", rvo);
            
            if(value != 0) result = true;
            return result;
    }
    
    /* 회의실 옵션 등록 */
    public boolean getInserOptiontResult(OptionVO ovo) {
            boolean result = false;
            int value = sqlSession.insert(namespace+".insertOption", ovo);

            if(value != 0) result = true;
            return result;
    }

    /* 회의실 서비스 등록 */
    public boolean getInsertServiceResult(ServiceVO svo) {
            boolean result = false;
            int value = sqlSession.insert(namespace+".insertService", svo);

            if(value != 0) result = true;
            return result;
    }
    
    /* 회의실 등록 - 최근 등록된 회의실 이름 가져오기 */
    public String getInsertedId() {
            return sqlSession.selectOne(namespace+".insertedId");
    }
    
    /* 지도 - 회의실 목록 */
    public ArrayList<RoomVO> getMapList() {
            List<RoomVO> list = sqlSession.selectList(namespace+".mapList");
            return (ArrayList<RoomVO>) list ;
    }
    
/* 회의실 검색 목록 */
    public ArrayList<RoomVO> getList(String location1, String location2, String date, double time, String type, int capacity, 
                    int min, int max, int stars, String[] option_list, String order) {
                    
    Map<String, Object> param = new HashMap<String, Object>();
    param.put("location1", location1);
    param.put("location2", location2);
    param.put("date", date);
    param.put("time", time);
    param.put("type", type);
    param.put("capacity", capacity);
    param.put("min", min);
    param.put("max", max);
    param.put("stars", (stars+1));
    param.put("option_list", option_list);
    param.put("order", order);
    
    List<RoomVO> list = sqlSession.selectList(namespace+".searchList", param);
    
    return (ArrayList<RoomVO>) list;
    }
    
    /* 회의실 검색 목록 - 옵션 */
    public ArrayList<OptionVO> getOptionList(ArrayList<String> rid_list, String order) {
            
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("rid_list", rid_list);
            param.put("order", order);

            List<OptionVO> list = sqlSession.selectList(namespace+".searchOptionList", param);
    
    return (ArrayList<OptionVO>) list;
    }
    
    public boolean getUpdateResult(RoomVO rvo) {
            boolean result = false;
            int value = sqlSession.update(namespace+".update", rvo);

            if(value != 0) result = true;
            return result;
    }

    public boolean getUpdateOptionResult(OptionVO ovo) {
            boolean result = false;
            int value = sqlSession.update(namespace+".updateOption", ovo);

            if(value != 0) result = true;
            return result;
    }

    public boolean getUpdateServiceResult(ServiceVO svo) {
            boolean result = false;
            int value = sqlSession.update(namespace+".updateService", svo);

            if(value != 0) result = true;
            return result;
    }
    
    public boolean getDeleteResult(String rid) {
            boolean result = false;
            int value = sqlSession.delete(namespace+".delete", rid);
            
            if(value != 0) result = true;
            return result;
    }
    
    public String getFile(String rid, String rsfile) {
            Map<String, String> param = new HashMap<String, String>();
            
            param.put("rid", rid);
            param.put("rsfile", rsfile);
            
            return sqlSession.selectOne(namespace+".rsfile", param);
    }
    
    public ReservationVO getReserve(String rid, String reserve_date, String checkin_time) {
        Map<String, String> param = new HashMap<String, String>();
        
        param.put("rid", rid);
        param.put("reserve_date", reserve_date);
        param.put("checkin_time", checkin_time);
    	
    	return sqlSession.selectOne(namespace+".reserve", param);
    }
    
    public ReservationVO getReserve(String rsid) {
    	return sqlSession.selectOne(namespace+".paymentInfo", rsid);
    }
    
  //새미***********************
    
    /* 회의실 상세 */
	public RoomVO getRoomContent(String rid) {
	        return sqlSession.selectOne(namespace+".roomcontent",rid);
	}
	
	/* 회의실 옵션 */
	public OptionVO getRoomOption(String rid) {
	        return sqlSession.selectOne(namespace+".roomoption",rid);
	}
	
	/* 회의실 예약 - 부가서비스 */
	public ServiceVO getService(String rid) {
	        return sqlSession.selectOne(namespace+".roomservice",rid);
	}
	
	/* 회의실 예약 시간 리스트 */
	public ArrayList<ReservationVO> getAvailableTime(String rid) {
	        Map param = new HashMap<String, String>();
	        param.put("rid", rid);
	        
	        List<ReservationVO> list = sqlSession.selectList(namespace+".availabletime", param);
	        
	        return (ArrayList<ReservationVO>)list;
	}
	
	/* 회의실 예약  */
	public boolean getReserveResult(ReservationVO vo) { 
	        boolean result=false; 
	        int        value = sqlSession.insert(namespace+".roomreserve", vo);
	        if(value != 0)        result = true;
	
	        return result; 
	}
	
	/* 회의실 예약 확인 */
	public ReservationVO getReservation(String rsid) {
	        return sqlSession.selectOne(namespace+".reservationinfo",rsid);
	}
	
}












