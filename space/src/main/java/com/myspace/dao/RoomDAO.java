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
import com.myspace.vo.ReviewVO;
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
            int value = sqlSession.insert(namespace + ".insert", rvo);

            if (value != 0)
                    result = true;
            return result;
    }

    /* 회의실 옵션 등록 */
    public boolean getInserOptiontResult(OptionVO ovo) {
            boolean result = false;
            int value = sqlSession.insert(namespace + ".insertOption", ovo);

            if (value != 0)
                    result = true;
            return result;
    }

    /* 회의실 서비스 등록 */
    public boolean getInsertServiceResult(ServiceVO svo) {
            boolean result = false;
            int value = sqlSession.insert(namespace + ".insertService", svo);

            if (value != 0)
                    result = true;
            return result;
    }

    /* 회의실 등록 - 최근 등록된 회의실 이름 가져오기 */
    public String getInsertedId() {
            return sqlSession.selectOne(namespace + ".insertedId");
    }

    /* 지도 - 회의실 목록 */
    public ArrayList<RoomVO> getMapList() {
            List<RoomVO> list = sqlSession.selectList(namespace + ".mapList");
            return (ArrayList<RoomVO>) list;
    }

    /* 회의실 검색 목록 */
    public ArrayList<RoomVO> getList(String location1, String location2, String date, double time, String type,
                    int capacity, int min, int max, int stars, String[] option_list, String order) {

            Map<String, Object> param = new HashMap<String, Object>();
            param.put("location1", location1);
            param.put("location2", location2);
            param.put("date", date);
            param.put("time", time);
            param.put("type", type);
            param.put("capacity", capacity);
            param.put("min", min);
            param.put("max", max);
            param.put("stars", (stars + 1));
            param.put("option_list", option_list);
            param.put("order", order);

            List<RoomVO> list = sqlSession.selectList(namespace + ".searchList", param);

            return (ArrayList<RoomVO>) list;
    }

    /* 회의실 검색 목록 - 옵션 */
    public ArrayList<OptionVO> getOptionList(ArrayList<String> rid_list, String order) {

            Map<String, Object> param = new HashMap<String, Object>();
            param.put("rid_list", rid_list);
            param.put("order", order);

            List<OptionVO> list = sqlSession.selectList(namespace + ".searchOptionList", param);

            return (ArrayList<OptionVO>) list;
    }

    /* 회의실 업데이트 */
    public boolean getUpdateResult(RoomVO rvo) {
            boolean result = false;
            int value = sqlSession.update(namespace + ".update", rvo);

            if (value != 0) result = true;
            return result;
    }

    /* 회의실 업데이트(옵션) */
    public boolean getUpdateOptionResult(OptionVO ovo) {
            boolean result = false;
            int value = sqlSession.update(namespace + ".updateOption", ovo);

            if (value != 0) result = true;
            return result;
    }

    /* 회의실 업데이트(서비스) */
    public boolean getUpdateServiceResult(ServiceVO svo) {
            boolean result = false;
            int value = sqlSession.update(namespace + ".updateService", svo);

            if (value != 0) result = true;
            return result;
    }

    /* 회의실 삭제 */
    public boolean getDeleteResult(String rid) {
            boolean result = false;
            int value = sqlSession.delete(namespace + ".delete", rid);

            if (value != 0) result = true;
            return result;
    }

    /* 파일이름 가져오기 */
    public String getFile(String rid, String rsfile) {
            Map<String, String> param = new HashMap<String, String>();

            param.put("rid", rid);
            param.put("rsfile", rsfile);

            return sqlSession.selectOne(namespace + ".rsfile", param);
    }

    /* 회의실 예약번호 가져오기 */
    public String getRsid(String rid, String reserve_date, String checkin_time, String checkout_time, String name,
                    String hp, String corp_name) {
            Map<String, String> param = new HashMap<String, String>();

            param.put("rid", rid);
            param.put("reserve_date", reserve_date);
            param.put("checkin_time", checkin_time);
            param.put("checkout_time", checkout_time);
            param.put("name", name);
            param.put("hp", hp);
            param.put("corp_name", corp_name);

            return sqlSession.selectOne(namespace + ".rsid", param);
    }

    /* 회의실 주소 리스트 */
    public ArrayList<Object> getAddrList() {
            return (ArrayList<Object>) sqlSession.selectList(namespace + ".addr");
    }

    /* 메인, 소개 카운트 */
    public Integer getCount(String category) {
            Map<String, String> param = new HashMap<String, String>();
            param.put("category", category);
            
            return sqlSession.selectOne(namespace+".count", param);
    }
    
	
	//새미***********************

	/* 회의실 상세 */
	public RoomVO getRoomContent(String rid) {
		return sqlSession.selectOne(namespace + ".roomcontent", rid);
	}
	
	/* 회의실 상세 - 리뷰 총평점 */
	public ArrayList<ReviewVO> getReviewGrade(String rid){
		List<ReviewVO> reviewgradelist = sqlSession.selectList(namespace+".reviewgradelist",rid);
		return (ArrayList<ReviewVO>)reviewgradelist;
	}
	
	/* 회의실 상세 - 리뷰 */
	public ArrayList<ReviewVO> getReviewList(String rid, int start, int end){
		Map param = new HashMap<String, String>();
		param.put("rid", rid);
		param.put("start", start);
		param.put("end", end);
		
		List<ReviewVO> reviewlist= sqlSession.selectList(namespace+".roomreview",param); 
		
		return (ArrayList<ReviewVO>)reviewlist;
	}
	
	/* 회의실 상세 - 전체 리뷰 수 */
	public int getCountReview(String rid) {
		return sqlSession.selectOne(namespace+".countreview",rid);
	}

	/* 회의실 리스트 - 비슷한 회의실 */
	public ArrayList<RoomVO> getRoomList() {
		List<RoomVO> roomlist = sqlSession.selectList(namespace + ".roomlist");

		return (ArrayList<RoomVO>) roomlist;
	}

	/* 회의실 옵션 */
	public ArrayList<OptionVO> getRoomOptionList() {
		List<OptionVO> optionlist = sqlSession.selectList(namespace + ".roomoptionlist");
		
		return (ArrayList<OptionVO>) optionlist;
	}
	
	/* 회의실 옵션 */
	public OptionVO getRoomOption(String rid) {
		return sqlSession.selectOne(namespace + ".roomoption", rid);
	}

	/* 회의실 예약 - 부가서비스 */
	public ServiceVO getService(String rid) {
		return sqlSession.selectOne(namespace + ".roomservice", rid);
	}

	/* 회의실 예약 시간 리스트 */
	public ArrayList<ReservationVO> getAvailableTime(String rid) {
		Map param = new HashMap<String, String>();
		param.put("rid", rid);

		List<ReservationVO> list = sqlSession.selectList(namespace + ".availabletime", param);

		return (ArrayList<ReservationVO>) list;
	}

	/* 회의실 예약 */
	public boolean getReserveResult(ReservationVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace + ".roomreserve", vo);
		if (value != 0) result = true;

		return result;
	}

	/* 회의실 예약 확인 */
	public ReservationVO getReservation(String rsid) {
		return sqlSession.selectOne(namespace + ".reservationinfo", rsid);
	}
	
	/* 회의실 예약 취소 */
	public boolean getCancelResult(String rsid) {
		boolean result = false;
		int value = sqlSession.delete(namespace + ".cancelreservation", rsid);

		if (value != 0) result = true;
		return result;
	}
	
	/* 예약률 상위 10% */
	public ArrayList<RoomVO> getTopReservation(){
		List<RoomVO> topreslist = sqlSession.selectList(namespace + ".topreservation");

		return (ArrayList<RoomVO>) topreslist;
	}
	
	/* 평점 상위 10% */
	public ArrayList<RoomVO> getTopGrade(){
		List<RoomVO> topgradelist = sqlSession.selectList(namespace + ".topgrade");
		
		return (ArrayList<RoomVO>) topgradelist;
	}
	
	//성수
	public ArrayList<ReservationVO> getReservationList(String id) {
        List<ReservationVO> list =  sqlSession.selectList(namespace + ".reservationlist", id);
        return (ArrayList<ReservationVO>) list;
	}
	
	
}












