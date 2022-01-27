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
	String lentno=request.getParameter("lentno");
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String class1=request.getParameter("class1");  //getParameter에서 넘어온 값은 폼에서 넘어온 값
	
	try{
		String sql="update reservation0127 set custname=?,bookno=?,outdate=?,indate=?,status=?,class=? where lentno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(7, lentno);
		pstmt.setString(1, custname);
		pstmt.setString(2, bookno);
		pstmt.setString(3, outdate);
		pstmt.setString(4, indate);
		pstmt.setString(5, status);
		pstmt.setString(6, class1);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
		%>
		<script>
			alert("수정이 완료되었습니다!");
			location.href="select_reservation.jsp";
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