package com.myspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.RoomDAO;
import com.myspace.vo.OptionVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;

@Service("roomService")
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomDAO roomDAO;

	@Override
	public boolean getInsertResult(RoomVO rvo) {
		return roomDAO.getInsertResult(rvo);
	}
	
	@Override
	public boolean getInserOptiontResult(OptionVO ovo) {
		return roomDAO.getInserOptiontResult(ovo);
	}
	
	@Override
	public boolean getInsertServiceResult(ServiceVO svo) {
		return roomDAO.getInsertServiceResult(svo);
	}

	@Override
	public String getInsertedId() {
		return roomDAO.getInsertedId();
	}

	@Override
	public ArrayList<RoomVO> getList() {
		return roomDAO.getList();
	}
	
	@Override
	public ArrayList<OptionVO> getOptionList() {
		return roomDAO.getOptionList();
	}

	@Override
	public ArrayList<RoomVO> getList(String location1, String location2, String date, String type, int capacity,
			int min, int max, int stars, ArrayList<String> option_list) {

		return roomDAO.getList(location1, location2, date, type, capacity, min, max, stars, option_list);
	}
	
	
	//»õ¹Ì
	@Override
    public RoomVO getRoomContent(String rid) {
            return roomDAO.getRoomContent(rid);
    }

    @Override
    public OptionVO getRoomOption(String rid) {
            return roomDAO.getRoomOption(rid);
    }
    
    @Override
    public ServiceVO getService(String rid) {
            return roomDAO.getService(rid);
    }
    
    @Override
    public ArrayList<Object> getAvailableTime(String rid) {
            return roomDAO.getAvailableTime(rid);
    }
    
    /*
     * @Override public boolean getReserveResult(ReservationVO vo) { return
     * roomDAO.getReserveResult(vo); }
     */
	
	

	
	
	



}
