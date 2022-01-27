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
		String sql="select count(*) from reservation0127";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no1=rs.getInt(1);
		}else{
			no1=0;
		}
	}catch(SQLException e){
		System.out.println("총 도서 예약 정보 수 읽기 실패");
		e.printStackTrace();
	}
%>
<h1>도서 예약정보 목록</h1>
<p id="p1">총 <%=no1 %>권의 도서 예약 정보가 있습니다.</p>
<hr>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>대출번호</th>
		<th>고객성명</th>
		<th>도서코드</th>
		<th>도서명</th>
		<th>대출일자</th>
		<th>반납일자</th>
		<th>대출상태</th>
		<th>등급</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	int no=0;
	
	try{
		String sql="select a.lentno,a.custname,a.bookno,b.bookname,to_char(a.outdate,'yyyy-mm-dd'),to_char(a.indate,'yyyy-mm-dd'),a.status,a.class from reservation0127 a,bookinfo0127 b where a.bookno=b.bookno";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String lentno=rs.getString(1);
			String custname=rs.getString(2);
			String bookno=rs.getString(3);
			String bookname=rs.getString(4);
			String outdate=rs.getString(5);
			String indate=rs.getString(6);
			if(indate==null){
				indate="";
			}
			String status=rs.getString(7);
			String class1=rs.getString(8);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td id="td1"><%=no %></td>
		<td id="td1"><a href="update_reservation.jsp?lentno=<%=lentno %>" id="a1"><%=lentno %></a></td>
		<td id="td1"><%=custname %></td>
		<td id="td1"><%=bookno %></td>
		<td id="td1"><%=bookname %></td>
		<td id="td1"><%=outdate %></td>
		<td id="td1"><%=indate %></td>
		<td id="td1"><%=status %></td>
		<td id="td1"><%=class1 %></td>
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
	<button type="button" onclick="location.href='insert_reservation.jsp'">도서 정보 추가</button>
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>