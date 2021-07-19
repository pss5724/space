package com.myspace.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class RoomVO {
	String rid,	id,	branch_name, room_name, intro, closed_day, check_info, type, 
			address, rfile1, rsfile1, rfile2, rsfile2, rfile3, rsfile3, rdate;
	double opening_time, closing_time, grade;
	int capacity, charge, review_count;
	CommonsMultipartFile file1, file2, file3;
	
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getClosed_day() {
		return closed_day;
	}
	public void setClosed_day(String closed_day) {
		this.closed_day = closed_day;
	}
	public String getCheck_info() {
		return check_info;
	}
	public void setCheck_info(String check_info) {
		this.check_info = check_info;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRfile1() {
		return rfile1;
	}
	public void setRfile1(String rfile1) {
		this.rfile1 = rfile1;
	}
	public String getRsfile1() {
		return rsfile1;
	}
	public void setRsfile1(String rsfile1) {
		this.rsfile1 = rsfile1;
	}
	public String getRfile2() {
		return rfile2;
	}
	public void setRfile2(String rfile2) {
		this.rfile2 = rfile2;
	}
	public String getRsfile2() {
		return rsfile2;
	}
	public void setRsfile2(String rsfile2) {
		this.rsfile2 = rsfile2;
	}
	public String getRfile3() {
		return rfile3;
	}
	public void setRfile3(String rfile3) {
		this.rfile3 = rfile3;
	}
	public String getRsfile3() {
		return rsfile3;
	}
	public void setRsfile3(String rsfile3) {
		this.rsfile3 = rsfile3;
	}
	public double getOpening_time() {
		return opening_time;
	}
	public void setOpening_time(double opening_time) {
		this.opening_time = opening_time;
	}
	public double getClosing_time() {
		return closing_time;
	}
	public void setClosing_time(double closing_time) {
		this.closing_time = closing_time;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getCharge() {
		return charge;
	}
	public void setCharge(int charge) {
		this.charge = charge;
	}
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	public CommonsMultipartFile getFile2() {
		return file2;
	}
	public void setFile2(CommonsMultipartFile file2) {
		this.file2 = file2;
	}
	public CommonsMultipartFile getFile3() {
		return file3;
	}
	public void setFile3(CommonsMultipartFile file3) {
		this.file3 = file3;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	
	

	
}
