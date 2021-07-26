package com.myspace.service;

import com.myspace.vo.Email;

public interface MailService {

	/** mail

	 * @param subject

	 * @param text

	 * @param from 관리자 이메일

	 * @param to 사용자 이메일


  **/

	boolean send(String subject, String text, String from, String to);
	void SendEmail(Email email) throws Exception;
}
