package com.ch.mybatis.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {
	
	private String id;
	private String email;
	private String password;
	private String name;
	private String fileName;
	private String del;
	private Date regdate;
	private MultipartFile file; // 사진 upload

}