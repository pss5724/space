package com.myspace.space;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.MemberService;
import com.myspace.service.RoomService;
import com.myspace.vo.MemberVO;
import com.myspace.vo.OptionVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.ServiceVO;
import com.myspace.vo.SessionVO;

@Controller
public class RoomController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MemberService memberService; 

    /* 회의실 지도 */
    @RequestMapping(value="/room_map.do", method=RequestMethod.GET)
    public String room_map() {
            return "room/room_map";
    }
    
    /* 회의실 지도 리스트 가져오기 */
    @ResponseBody
    @RequestMapping(value="/get_map_list.do", method = RequestMethod.GET)
    public Map<String, Object> get_map_list() {
            Map<String, Object> result = new HashMap<String, Object>();
            
            ArrayList<RoomVO> list = roomService.getMapList();
            
            result.put("list", list);
            return result;
    }
    
    /* 회의실 목록 */ //삭제예정
    @RequestMapping(value="/room_list.do", method=RequestMethod.GET)
    public ModelAndView room_list() {
            ModelAndView mv = new ModelAndView();
            
            //ArrayList<RoomVO> rlist = roomService.getList();
            //ArrayList<OptionVO> olist = roomService.getOptionList();
            
            mv.setViewName("room/room_list");
            //mv.addObject("rlist", rlist);
            //mv.addObject("olist", olist);
            
            return mv;
    }

    /* 회의실 리스트 가져오기 */
    @ResponseBody
    @RequestMapping(value="/get_list.do", method=RequestMethod.POST)
    public Map<String, Object> getList(String location1, String location2, String date, double time, String type, int capacity, int min, int max, int stars, 
                                                    @RequestParam(value="option_list[]") ArrayList<String> option_list, String order) {
            
            Map<String, Object> result = new HashMap<String, Object>();
            
            //기본으로 들어있는 default 제거
            if(option_list.size() == 1) {
                    option_list = null;
            } else {
                    option_list.remove(0);
            }                

            ArrayList<RoomVO> rlist = roomService.getList(location1, location2, date, time, type, capacity, min, max, stars, option_list, order);
            ArrayList<String> rid_list = new ArrayList<String>();
            ArrayList<OptionVO> olist = new ArrayList<OptionVO>();
            
            if(rlist.size() != 0) {
                    for(RoomVO rvo : rlist) {  //rid_list 만들기
                            rid_list.add(rvo.getRid());
                    }
                    olist = roomService.getOptionList(rid_list, order);        
                    for(int i=0; i<rlist.size(); i++) {
                            System.out.println((i+1) + ">>" +rlist.get(i).getRid() + "///" + olist.get(i).getRid());
                    }
            }

            result.put("rlist", rlist);
            result.put("olist", olist);
            result.put("count", rid_list.size());
    
            return result;
    }

    
    @RequestMapping(value="/room_reserve_confirm.do", method=RequestMethod.GET)
    public String room_reserve_confirm() {
            return "room/room_reserve_confirm";
    }
    
    @RequestMapping(value="/room_payment.do", method=RequestMethod.GET)
    public String room_payment() {
            return "room/room_payment";
    }
    
    @RequestMapping(value="/room_payment_proc.do", method=RequestMethod.GET)
    public String room_payment_proc() {
            return "room/room_payment_proc";
    }
    
    @RequestMapping(value="/room_payment_success.do", method=RequestMethod.GET)
    public String room_payment_success() {
            return "room/room_payment_success";
    }
    
    /* 회의실 등록 처리 */
    @RequestMapping(value="/room_insert_proc.do", method=RequestMethod.POST)
    public ModelAndView rooom_insert_proc(RoomVO rvo, OptionVO ovo, ServiceVO svo, HttpServletRequest request) throws Exception {
            ModelAndView mv = new ModelAndView();
            String root_path = request.getSession().getServletContext().getRealPath("/");
            String attach_path = "\\resources\\upload\\";
            UUID uuid = UUID.randomUUID();  

            rvo.setRfile1(rvo.getFile1().getOriginalFilename());  //파일1 필수(if문 없앰)
            rvo.setRsfile1(uuid + "_" + rvo.getFile1().getOriginalFilename());        

            if (rvo.getFile2().getSize()!=0) {
                    uuid = UUID.randomUUID();
                    rvo.setRfile2(rvo.getFile2().getOriginalFilename());
                    rvo.setRsfile2(uuid + "_" + rvo.getFile2().getOriginalFilename());
            } 

            if(rvo.getFile3().getSize()!=0) {
                    uuid = UUID.randomUUID();
                    rvo.setRfile3(rvo.getFile3().getOriginalFilename());
                    rvo.setRsfile3(uuid + "_" + rvo.getFile3().getOriginalFilename());
            }
            
            rvo.setId("test");  //세션으로 받게 되면 지우기 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!######################################################
            boolean room_result = roomService.getInsertResult(rvo);  //회의실 테이블 insert
            
            if(room_result) {
                    
                    /* 파일 넣기 */
                    File file1 = new File(root_path + attach_path + rvo.getRsfile1());
                    rvo.getFile1().transferTo(file1);

                    if(rvo.getFile2().getSize()!=0) {
                            File file2 = new File(root_path + attach_path + rvo.getRsfile2());
                            rvo.getFile2().transferTo(file2);
                    }
                    
                    if(rvo.getFile3().getSize()!=0) {
                            File file3 = new File(root_path + attach_path + rvo.getRsfile3());
                            rvo.getFile3().transferTo(file3);
                    }        
                    
                    String rid = roomService.getInsertedId(); //가장 최근에 등록된 회의실의 rid 가져오기

                    ovo.setRid(rid);
                    boolean option_result = roomService.getInserOptiontResult(ovo);  //옵션 테이블 insert
                    
                    svo.setRid(rid);
                    boolean service_result = roomService.getInsertServiceResult(svo);

                    if(option_result && service_result) { mv.setViewName("redirect:/corppage.do");}

            }        
            return mv;
    }

    /* 회의실 수정 */
    @RequestMapping(value="/corppage_update.do", method=RequestMethod.GET)
    public ModelAndView corppage_update(String rid) {
            ModelAndView mv = new ModelAndView();
            
            RoomVO rvo = roomService.getRoomContent(rid);
            OptionVO ovo = roomService.getRoomOption(rid);
            ServiceVO svo = roomService.getService(rid);
            
            mv.setViewName("corppage/corppage_update");
    mv.addObject("rvo", rvo);
    mv.addObject("ovo", ovo);
    mv.addObject("svo", svo);
            
    return mv;
    }

    /* 회의실 수정 처리 */
    @RequestMapping(value="/room_update_proc.do", method=RequestMethod.POST)
    public ModelAndView room_update_proc(RoomVO rvo, OptionVO ovo, ServiceVO svo, HttpServletRequest request) throws Exception {
            ModelAndView mv = new ModelAndView();
            
            String root_path = request.getSession().getServletContext().getRealPath("/");
            String attach_path = "\\resources\\upload\\";
            String old_rsfile1 = null, old_rsfile2 = null, old_rsfile3 = null;

            if(rvo.getFile1().getSize()!=0) {
                    UUID uuid = UUID.randomUUID();  
                    rvo.setRfile1(rvo.getFile1().getOriginalFilename());
                    rvo.setRsfile1(uuid + "_" + rvo.getFile1().getOriginalFilename());
                    old_rsfile1 = roomService.getFile(rvo.getRid(), "rsfile1");
            } 
            
            if(rvo.getFile2().getSize()!=0) {
                    UUID uuid = UUID.randomUUID();  
                    rvo.setRfile2(rvo.getFile2().getOriginalFilename());
                    rvo.setRsfile2(uuid + "_" + rvo.getFile2().getOriginalFilename());
                    old_rsfile2 = roomService.getFile(rvo.getRid(), "rsfile2");
            } 
            
            if(rvo.getFile3().getSize()!=0) {
                    UUID uuid = UUID.randomUUID();  
                    rvo.setRfile3(rvo.getFile3().getOriginalFilename());
                    rvo.setRsfile3(uuid + "_" + rvo.getFile3().getOriginalFilename());
                    old_rsfile3 = roomService.getFile(rvo.getRid(), "rsfile3");
            }        
            
            boolean rvo_result = roomService.getUpdateResult(rvo); 
            boolean ovo_result = roomService.getUpdateOptionResult(ovo); 
            boolean svo_result = roomService.getUpdateServiceResult(svo);
            
            if(rvo_result) {
                    if(rvo.getFile1().getSize()!=0) {
                            if(old_rsfile1 != null) {
                                    File file = new File(root_path + attach_path + rvo.getRsfile1());
                                    rvo.getFile1().transferTo(file);
                                    
                                    File old_file = new File(root_path + attach_path + old_rsfile1);
                                    if(old_file.exists()) old_file.delete();
                            }
                    } 
    
                    if(rvo.getFile2().getSize()!=0) {
                            if(old_rsfile2 != null) {
                                    File file = new File(root_path + attach_path + rvo.getRsfile2());
                                    rvo.getFile2().transferTo(file);
                                    
                                    File old_file = new File(root_path + attach_path + old_rsfile2);
                                    if(old_file.exists()) old_file.delete();
                            }
                    } 
    
                    if(rvo.getFile3().getSize()!=0) {
                            if(old_rsfile3 != null) {
                                    File file = new File(root_path + attach_path + rvo.getRsfile3());
                                    rvo.getFile3().transferTo(file);
                                    
                                    File old_file = new File(root_path + attach_path + old_rsfile3);
                                    if(old_file.exists()) old_file.delete();
                            }
                    }        
            }
            
            if(rvo_result && ovo_result && svo_result) mv.setViewName("redirect:/corppage.do");
            
            return mv;
    }
    
    /* 회의실 삭제 처리 */
    @RequestMapping(value="/room_delete_proc.do", method=RequestMethod.GET)
    public ModelAndView room_delete_proc(String rid, HttpServletRequest request) {
    ModelAndView mv = new ModelAndView();
    
            String root_path = request.getSession().getServletContext().getRealPath("/");
            String attach_path = "\\resources\\upload\\";
    String[] list = {"rsfile1", "rsfile2", "rsfile3"};
    String[] old_list = new String[list.length];
    
    for(int i=0; i<list.length; i++) {
            old_list[i] = roomService.getFile(rid, list[i]);
    }

    boolean result = roomService.getDeleteResult(rid);

    if(result) {
            for(int i=0; i<old_list.length; i++) {
                    if(old_list[i] != null) {
                            File old_file = new File(root_path + attach_path + old_list[i]);
                            if(old_file.exists()) old_file.delete();
                    }
            }
            mv.setViewName("redirect:/corppage.do");
    }

    return mv;
    }

	
	
	//새미
	
	/* 회의실 상세 */
    @RequestMapping(value="/room_content.do", method=RequestMethod.GET)
    public ModelAndView room_content(String rid, MemberVO mvo, HttpSession session) {
            ModelAndView mv = new ModelAndView();
            
            RoomVO vo = roomService.getRoomContent(rid);
            OptionVO ovo = roomService.getRoomOption(rid);
            SessionVO svo = (SessionVO)session.getAttribute("svo");
            
            ArrayList<ReservationVO> list = roomService.getAvailableTime(rid);
            mv.setViewName("room/room_content");
            mv.addObject("vo", vo);
            mv.addObject("ovo", ovo);
            mv.addObject("list", list);
            
            if(svo != null) {
    			svo.setPosition(mvo.getPosition());
    			session.setAttribute("svo", svo);
    		}
            
            return mv;
    }
    
    /* 회의실 예약 */
    @RequestMapping(value="/room_reserve.do", method=RequestMethod.GET)
    public ModelAndView room_reserve(String rid) {
            ModelAndView mv = new ModelAndView();
            
            RoomVO vo = roomService.getRoomContent(rid);
            OptionVO ovo = roomService.getRoomOption(rid);
            ServiceVO svo = roomService.getService(rid);
            ArrayList<ReservationVO> olist = roomService.getAvailableTime(rid);
            ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
            for(Object obj : olist) {
                    ReservationVO rvo = (ReservationVO)obj;
                    list.add(rvo);
            }
            mv.setViewName("room/room_reserve");
            mv.addObject("vo", vo);
            mv.addObject("ovo", ovo);
            mv.addObject("svo", svo);
            mv.addObject("list",list);
            
            return mv;
    }
	
    /* 회의실 예약 처리 */
    @RequestMapping(value="/room_reserve_proc.do", method=RequestMethod.POST)
    public ModelAndView room_reserve_proc(ReservationVO vo, HttpServletRequest request) throws Exception {
            ModelAndView mv = new ModelAndView();
            
            boolean result = roomService.getReserveResult(vo);
            
            if(result) {
            	mv.setViewName("redirect:/room_payment.do");
            }
            
            return mv;
    }
    /* 회의실 예약 처리 */
    @RequestMapping(value="/room_reserve_offline_proc.do", method=RequestMethod.POST)
    public ModelAndView room_reserve_offline_proc(ReservationVO vo, HttpServletRequest request) throws Exception {
    	ModelAndView mv = new ModelAndView();
    	
    	boolean result = roomService.getReserveResult(vo);
    	
    	if(result) {
    		mv.setViewName("redirect:/room_reserve_confirm.do");
    	}
    	
    	return mv;
    }
	
	
	
	
	
	
}
