package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.OptionVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;

@Repository
public class RoomDAO extends DBConn{
	
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
    
    /* 회의실 목록 */
    public ArrayList<RoomVO> getList() {
    	List<RoomVO> list = sqlSession.selectList(namespace+".list");
    	return (ArrayList) list;
    }

    /* 회의실 목록 - 회의실  */
    public ArrayList<OptionVO> getOptionList() { 	
    	List<OptionVO> list = sqlSession.selectList(namespace+".optionList");
    	return (ArrayList) list;
    }
    
    /* 회의실 목록 - 검색  */
	public ArrayList<RoomVO> getList(String location1, String location2, String date, String type, int capacity,
			int min, int max, int stars, ArrayList<String> option_list) {

		return null;
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
    
    /* 회의실 예약 시간 조회 */
    public ArrayList<Object> getAvailableTime(String rid) {
            Map param = new HashMap<String, String>();
            param.put("rid", rid);
            
            List<Object> list = sqlSession.selectList(namespace+".availabletime", param);
            
            return (ArrayList<Object>)list;
    }
    
    /* 회의실 예약  */
    /*
     * public boolean getReserveResult(ReservationVO vo) { boolean result=false; int
     * value = sqlSession.insert(namespace+".roomreserve", vo); if(value != 0)
     * result = true;
     * 
     * return result; }
     */
	
}












