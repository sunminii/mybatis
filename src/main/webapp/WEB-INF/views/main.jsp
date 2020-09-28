<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<table class="table table-hover">
			<caption>${member.name}님환영</caption>
			<tr>
				<th><a href="view.html" class="btn btn-info">조회</a></th>
			</tr>	
			<tr>
				<th><a href="view2.html" class="btn btn-default">사진 여러장 조회</a></th>
			</tr>	
			<tr>
				<th><a href="updateForm.html" class="btn btn-warning">수정</a></th>
			</tr>	
			<tr>
				<th><a href="delete.html" class="btn btn-danger">탈퇴</a></th>
			</tr>	
			<tr>
				<th><a href="logout.html" class="btn btn-success">로그아웃</a></th>
			</tr>	
</body>
</html>