<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ include file="header.jsp" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0}">
	<script type="text/javascript">
		alert("입력 완료 ㅋㅋ");
		location.href = "loginForm.html"
	</script>
</c:if>
<c:if test="${result==0}">
	<script type="text/javascript">
		alert("다시 입력하세요");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result==-1}">
	<script type="text/javascript">
		alert("중복된 아이디입니다. 다시 입력하세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>