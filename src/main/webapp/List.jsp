<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
DecimalFormat de = new DecimalFormat("###,###");
Class.forName("oracle.jdbc.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");

String sql = "select ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount, sum(tp.cost * ts.amount) as total "
			+ "from tbl_salelist_02 ts, tbl_product_02 tp "
			+ "where ts.pcode = tp.pcode "
			+ "group by ts.saleno, ts.pcode, ts.saledate, ts.scode, tp.name, ts.amount "
			+ "order by ts.saleno";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header2.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">판매현황</h2>
<br>
<section style="display: flex; justify-content: center; padding-bottom: 70px;">
<table border="1" style="border-spacing: 0px;">
<tr>
<th>판매번호</th>
<th>상품코드</th>
<th>판매날짜</th>
<th>매장코드</th>
<th>상품명</th>
<th>판매수량</th>
<th>총판매액</th>
</tr>
<%
while(rs.next()) {
	String str = "";
	str = de.format(rs.getInt(7));
	%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3).substring(0, 10) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= str %></td>
</tr>
<%
}
%>
</table>
</section>
<footer style="position: relative; bottom: 0; width: 100%; background: silver; padding: 15px 0;">
<h2 style="text-align: center;">Copyright @ 2018 All right reserved SangilMedia High School</h2>
</footer>
</body>
</html>