<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body onload="loadJSON()">
	<form method="post" name="smsForm" action="smsCheck.jsp">
	    <br /> 전송메세지
	    <textarea name="msg" cols="30" rows="10" style="width:455px;">내용입력</textarea>
	    <br />
	    <br />받는 번호
	    <input type="text" name="rphone" value="011-111-1111"> 예) 011-011-111 , '-' 포함해서 입력
	    <input type="text" name="testflag" maxlength="1"> 예) 테스트시: Y 
	    <input type="submit" value="전송">
	</form>
</body>