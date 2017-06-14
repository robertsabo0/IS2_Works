<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Works evidence</title>
</head>
<body>

<h2><a href="/WorksWeb/users/initIndex" >M A I N</a></h2>

<h1>${proj.naziv}</h1>
<h3>
	<c:if test="${!empty manager && empty user.manager}">
		<i>
			Upozorenje! Ovo je projekat drugog managera: ${manager.imePrezime } (<b>${manager.username}</b>)
		</i>
	</c:if>
</h3>

<h3>${proj.opis }</h3>
<h5> Pocetak projekta: <fmt:formatDate pattern="yyyy-MM-dd" value="${proj.pocetak }"/></h5>
<h5> Planiran zavrsetak: <fmt:formatDate pattern="yyyy-MM-dd" value="${proj.planZavrsetka }"/></h5>

<c:if test="${!empty proj.zavrseno }">
	<h5> Zavrsen: <fmt:formatDate pattern="yyyy-MM-dd" value="${proj.zavrseno }"/></h5>
</c:if>
	
<c:if test="${empty user.manager}">
	<h2>Radnici projekta:</h2>
	<table>
	<c:forEach items="${radnici}" var="r">
		<tr>
			<td>
			<b>${r.imePrezime}</b>
			</td>
		</tr>
		<tr>
			<td>
				taskoviii
			</td>
		</tr>
	</c:forEach>
	</table>
	<form action="/WorksWeb/proj/dodajradnika" method="post">
		<input type="hidden" name="p"  value="${proj.id }"/>
		<select name="r">
			<c:forEach items="${ostaliradnici}" var="r">
				<option value="${r.username }">${r.imePrezime }</option>
			</c:forEach>
		</select>
		<input type="submit" value="Dodaj na projekat"/>
	</form>
</c:if>

<c:if test="${!empty user.manager}">

	taskoviii
</c:if>

</body>
</html>