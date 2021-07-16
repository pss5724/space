package com.myspace.service;

import java.util.ArrayList;


public interface FaqService {
	int execTotalCount();
	ArrayList<Object> getList(int start, int end);
	
	
}
