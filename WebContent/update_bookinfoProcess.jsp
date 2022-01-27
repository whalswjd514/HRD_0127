<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String bookno=request.getParameter("bookno");
	String author=request.getParameter("author");
	String bookname=request.getParameter("bookname");
	
	try{
		String sql="update bookinfo0127 set author=?,bookname=? where bookno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(3, bookno);
		pstmt.setString(1, author);
		pstmt.setString(2, bookname);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다!");
			location.href="select_bookinfo.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("수정이 실패되었습니다!");
			history.back(-1);
		</script>
</body>
</html>