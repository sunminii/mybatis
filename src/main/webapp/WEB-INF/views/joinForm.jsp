<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idChk(){
		if(!frm.id.value){
			aler("아이디를 입력하고 체크하세요");
			return false;
		}
		$.post('idChk.html','id='+frm.id.value, function(data){
			$('#disp').html(data);
		});
	}
	function chk(){
		if(frm.password.value != frm.password2.value){
			aler("비밀번호가 다릅니다");
			frm.password.value = "";
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">회원가입</h2>
	<form action="join.html" method="post" enctype="multipart/form-data" name="frm">
		<table class="table table-bordered";>
			<tr>
				<td>아이디 <span class="glyphicon glyphicon-user"></span></td>
				<td><input type="text" name="id" required="required" autofocus="autofocus"/></td>
				<td><input type="button" value="중복체크" class="btn btn-info btn-sm" onclick="idChk()"/>
					<span id="disp" class="err"></span></td>
			</tr>
			<tr>
				<td>암호 <span class="glyph glyphicon-lock"></span></td>
				<td><input type="password" name="password" required="required"/></td>
			</tr>
			<tr>
				<td>암호확인 <span class="glyph glyphicon-lock"></span></td>
				<td><input type="password" name="password2" required="required"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"/></td>
			</tr>
			<tr>
				<td>이메일<span class="glyph glyphicon-envel"></span></td>
				<td><input type="email" name="email" required="required"/></td>
			</tr>
			<tr>
				<td>사진<span class="glyph glyphicon-picture"></span></td>
				<td><input type="file" name="file" required="required"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"/></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>











