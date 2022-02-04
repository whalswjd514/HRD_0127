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
	String class1=request.getParameter("class1");
	
	try{
		String sql="insert into reservation0127 values(?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, lentno);
		pstmt.setString(2, custname);
		pstmt.setString(3, bookno);
		pstmt.setString(4, outdate);
		pstmt.setString(5, indate);
		pstmt.setString(6, status);
		pstmt.setString(7, class1);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
		%>
		<script>
			alert("등록이 완료되었습니다!");
			location.href="select_reservation.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("등록이 실패되었습니다!");
			history.back(-1);
		</script>
</body>
</html>