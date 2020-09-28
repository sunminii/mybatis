package com.ch.mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ch.mybatis.model.Member;

@Repository //MemberDao객체 생성
public class MemberDaoImpl implements MemberDao {
	
	@Autowired //mybatis 연결
	private SqlSessionTemplate sst;

	@Override
	public Member select(String id) {
		return sst.selectOne("memberns.select",id);
	}

	@Override
	public int insert(Member member) {
		return sst.insert("memberns.insert",member);
	}
}
