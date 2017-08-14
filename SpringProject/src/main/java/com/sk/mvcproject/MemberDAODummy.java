package com.sk.mvcproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

// C언어에서 구조체 같은 역할의 Class

// '@Service'는 MemberDAO 객체를 생성시켜준다.
@Service(value="memberdao")
public class MemberDAODummy implements MemberDAO {

	ArrayList<Member> al = new ArrayList<Member>();
	
	public MemberDAODummy() throws Exception {
		insert(new Member("111","111","이상진","man","독서")); 
		insert(new Member("222","111","이종훈","man","낚시")); 
		insert(new Member("333","111","조현우","man","영화")); 
		insert(new Member("444","111","정호룡","man","게임")); 
		insert(new Member("555","111","천이수","woman","운동")); 
	}

	@Override
	public List<Member> select() throws Exception {
		return al;
	}

	// DB insert문장
	@Override
	public int insert(Member member) throws Exception {

		al.add(member);
		return 1;
	}

	@Override
	public int update(Member member) throws Exception {
		
		for (Member m : al) {
			if (m.getMem_id().equals(member.getMem_id())) {
				
				m.setMem_pwd(member.getMem_pwd());
				m.setMem_name(member.getMem_name());
				m.setGender(member.getGender());
				m.setHobby(member.getHobby());
				
				return 1;
			}
		}
	
		return 0;
	}

	@Override
	public int delete(String mem_id) throws Exception {

		for (Member m : al) {
			if (m.getMem_id().equals(mem_id)) {
				al.remove(m);
				return 1;
			}
		}

		return 0;
	}

	@Override
	public int exist(String mem_id, String mem_pwd) throws Exception {
		
		for (Member m : al) {
			if (m.getMem_id().equals(mem_id) && m.getMem_pwd().equals(mem_pwd)) {
				return 1;
			}
		}
		
		return 0;
	}

	@Override
	public Member selectById(String mem_id) throws Exception {
		
		for (Member m : al) {
			if (m.getMem_id().equals(mem_id)) {
				return m;
			}
		}
		
		return null;
	}
}
