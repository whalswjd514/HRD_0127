<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function check(){
		if(document.form.lentno.value==""){
			alert("대출번호가 입력되지 않았습니다.");
			document.form.lentno.focus();
		}else if(document.form.custname.value==""){
			alert("고객성명이 입력되지 않았습니다.");
			document.form.custname.focus();
		}else if(document.form.bookno.value==""){
			alert("도서코드가 입력되지 않았습니다.");
			document.form.bookno.focus();
		}else{
			document.form.submit();
		}
	}
	
</script>
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
	String lentno=request.getParameter("lentno");
	String custname=request.getParameter("custname");
	String bookno=request.getParameter("bookno");
	String bookname=request.getParameter("bookname");
	String outdate=request.getParameter("outdate");
	String indate=request.getParameter("indate");
	String status=request.getParameter("status");
	String class1=request.getParameter("class");
	
	try{
		String sql="select a.lentno,a.custname,a.bookno,b.bookname,to_char(a.outdate,'yyyy-mm-dd'),to_char(a.indate,'yyyy-mm-dd'),a.status,a.class from reservation0127 a,bookinfo0127 b where a.bookno=b.bookno and lentno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, lentno);
		rs=pstmt.executeQuery();
		if(rs.next()){
			lentno=rs.getString(1);
			custname=rs.getString(2);
			bookno=rs.getString(3);
			bookname=rs.getString(4);
			outdate=rs.getString(5);
			indate=rs.getString(6);
			if(indate==null){
				indate="";
			}
			status=rs.getString(7);
			class1=rs.getString(8);
			if(class1==null){
				class1="";
			}
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
		e.printStackTrace();
	}
%>
<form name="form" method="post" action="update_reservationProcess.jsp">
<h1>도서 대출 예약 정보 수정 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">대출번호</th>
		<td><input type="text" name="lentno" value="<%=lentno %>"></td>
		<th id="th1">고객성명</th>
		<td><input type="text" name="custname" value="<%=custname %>"></td>
	</tr>
	<tr>
		<th id="th1">도서코드</th>
		<td><input type="text" name="bookno" value="<%=bookno %>"></td>
		<th id="th1">도서이름</th>
		<td><input type="text" name="bookname" value="<%=bookname %>"></td>
	</tr>
	<tr>
		<th id="th1">대출일자</th>
		<td><input type="text" name="outdate" value="<%=outdate %>"></td>
		<th id="th1">반납일자</th>
		<td><input type="text" name="indate" value="<%=indate %>"></td>
	</tr>
	<tr>
		<th id="th1">대출상태</th>
		<td><input type="radio" name="status" value="1" <%if(status.equals("1")){%>checked<%}%>>대출
			<input type="radio" name="status" value="2" <%if(status.equals("2")){%>checked<%}%>>반납
		</td>
		<th id="th1">등급</th>
		<td>
			<select name="class1" id="s1">
				<option value="" <%if(class1==null){%>selected<%}%>></option>
				<option value="S" <%if(class1.equals("S")){%>selected<%}%>>S</option>
				<option value="A" <%if(class1.equals("A")){%>selected<%}%>>A</option>
				<option value="B" <%if(class1.equals("B")){%>selected<%}%>>B</option>
				<option value="C" <%if(class1.equals("C")){%>selected<%}%>>C</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="수정" onclick="check()" id="btn2">
			<input type="reset" value="취소" id="btn2">
		</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>