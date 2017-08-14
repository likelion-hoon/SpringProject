package com.sk.mvcproject;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

// C���� ����ü ���� ������ Class

// '@Service'�� MemberDAO ��ü�� ���������ش�.
@Service(value="memberdao")
public class MemberDAODummy implements MemberDAO {

	ArrayList<Member> al = new ArrayList<Member>();
	
	public MemberDAODummy() throws Exception {
		insert(new Member("111","111","�̻���","man","����")); 
		insert(new Member("222","111","������","man","����")); 
		insert(new Member("333","111","������","man","��ȭ")); 
		insert(new Member("444","111","��ȣ��","man","����")); 
		insert(new Member("555","111","õ�̼�","woman","�")); 
	}

	@Override
	public List<Member> select() throws Exception {
		return al;
	}

	// DB insert����
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
