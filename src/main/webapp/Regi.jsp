<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="Header4.jsp"></jsp:include>
	<br>
	<h2 style="text-align: center;">판매등록</h2>
	<br>
	<section style="display: flex; justify-content: center;">
		<form action="RegiConfirm.jsp">
			<table border="1" style="border-spacing: 0px;">
				<tr>
					<th>판매번호</th>
					<td><input type="text" name="saleno"></td>
				</tr>
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="pcode"></td>
				</tr>
				<tr>
					<th>판매날짜</th>
					<td><input type="text" name="saledate"></td>
				</tr>
				<tr>
					<th>매장코드</th>
					<td><input type="text" name="scode"></td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" name="amount"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
					</td>
				</tr>

			</table>
		</form>
	</section>
</body>
</html>