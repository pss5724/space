package com.myspace.vo;

public class MemberVO {
	int rno, position, choicein, choiceout;
	String name, id, pass, hp, cname, tname, cnum1, cnum2, cnum3, cnum, caddr1, caddr2, clic, chp;
	
	
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getChoicein() {
		return choicein;
	}
	public void setChoicein(int choicein) {
		this.choicein = choicein;
	}
	public int getChoiceout() {
		return choiceout;
	}
	public void setChoiceout(int choiceout) {
		this.choiceout = choiceout;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getCnum1() {
		return cnum1;
	}
	public void setCnum1(String cnum1) {
		this.cnum1 = cnum1;
	}
	public String getCnum2() {
		return cnum2;
	}
	public void setCnum2(String cnum2) {
		this.cnum2 = cnum2;
	}
	public String getCnum3() {
		return cnum3;
	}
	public void setCnum3(String cnum3) {
		this.cnum3 = cnum3;
	}
	public String getCnum() {
		String str="";
		if (cnum1 != null) { // 회원가입 시
			str = cnum1 + "-" + cnum2 + "-" + cnum3;
		} else { // 멤버리스트 출력 시 사용
			str = cnum;
		}
		return str;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getCaddr1() {
		return caddr1;
	}
	public void setCaddr1(String caddr1) {
		this.caddr1 = caddr1;
	}
	public String getCaddr2() {
		return caddr2;
	}
	public void setCaddr2(String caddr2) {
		this.caddr2 = caddr2;
	}
	public String getClic() {
		return clic;
	}
	public void setClic(String clic) {
		this.clic = clic;
	}
	public String getChp() {
		return chp;
	}
	public void setChp(String chp) {
		this.chp = chp;
	}	
}
