package com.sk.mvcproject;

import java.util.List;

// 계약서를 작성한다! ( 인터페이스 = 계약서 ) 
public interface MemberDAO {
	
	public List<Member> select() throws Exception;
	public int insert(Member member) throws Exception;
	public int update(Member member) throws Exception;
	public int delete(String mem_id) throws Exception;
	public int exist(String mem_id, String mem_pwd) throws Exception;  
	public Member selectById(String mem_id) throws Exception; 
	
}

