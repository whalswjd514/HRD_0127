<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no1=0;
	
	try{
		String sql="select count(*) from bookinfo0127";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no1=rs.getInt(1);
		}else{
			no1=0;
		}
	}catch(SQLException e){
		System.out.println("총 도서정보 수 읽기 실패");
		e.printStackTrace();
	}
%>
<h1>도서정보 목록</h1>
<p id="p1">총 <%=no1 %>권의 도서정보가 있습니다.</p>
<hr>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>도서코드</th>
		<th>저자</th>
		<th>도 서 명</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	int no=0;
	
	try{
		String sql="select * from bookinfo0127";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String bookno=rs.getString(1);
			String author=rs.getString(2);
			String bookname=rs.getString(3);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td id="td1"><%=no %></td>
		<td id="td1"><a href="update_bookinfo.jsp?bookno=<%=bookno %>" id="a1"><%=bookno %></a></td>
		<td id="td1"><%=author %></td>
		<td id="td1"><%=bookname %></td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
<div class="btn_group" align=center>
	<button type="button" onclick="location.href='insert_bookinfo.jsp'">도서 정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>