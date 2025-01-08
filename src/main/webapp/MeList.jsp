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

String sql = "select shop.scode, shop.sname, sum(tp.cost * sale.amount) as total "
			+ "from tbl_salelist_02 sale, tbl_product_02 tp, tbl_shop_02 shop "
			+ "where shop.scode = sale.scode and tp.pcode = sale.pcode "
			+ "group by shop.scode, shop.sname "
			+ "order by shop.scode ";

ResultSet rs = conn.prepareStatement(sql).executeQuery();
%>
<jsp:include page="Header3.jsp"></jsp:include>
<br>
<h2 style="text-align: center;">매장별 판매액</h2>
<br>
<section style="display: flex; justify-content: center;">
<table border="1" style="border-spacing: 0px;">
<tr>
<th>매장코드</th>
<th>매장명</th>
<th>매장별 판매액</th>
</tr>

<%
while(rs.next()) {
	String str = "";
	str = de.format(rs.getInt(3));
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= str %></td>
</tr>
<%
}
%>
</table>
</section>
</body>
</html>