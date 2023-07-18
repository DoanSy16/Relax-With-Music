<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Relax Music</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- icon -->
<script src="views/js/jquery.min.js"></script>
<link rel="stylesheet" href="views/css/bootstrap.min.css">
<script src="views/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="views/css/mdb.min.css">

<link rel="stylesheet" href="views/css/form.css">
<link rel="stylesheet" href="views/css/formeditvideo.css">
<link rel="stylesheet" href="views/css/style.css">
<link rel="stylesheet" href="views/css/sweetalert2.min.css">
<script src="views/js/sweetalert2.min.js"></script>
<script src="views/js/active.js"></script>
<script src="views/js/swal.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<style>
#main {
	transition: margin-left .5s;
	/* padding: 16px; */
}
</style>
</head>
<body class="fixed-sn white-skin">
	<!-- menu -->
	<%@include file="jsp/menu.jsp"%>
	<!-- main -->
	<main id="main" style="min-height: 500px" onclick="closeNav()">
		<c:choose>
			<c:when test="${action == null}"><%@include
					file="jsp/main.jsp"%></c:when>
			<c:when test="${action == 'logout'}"><%@include
					file="jsp/main.jsp"%></c:when>
			<c:when test="${action =='login'}"><%@include
					file="jsp/login.jsp"%></c:when>
			<c:when test="${action =='infor'}"><%@include
					file="jsp/infor.jsp"%></c:when>
			<c:when test="${action =='manager'}"><%@include
					file="jsp/manager.jsp"%></c:when>
			<c:when test="${action =='addvideo'}"><%@include
					file="jsp/createvideo.jsp"%></c:when>
			<c:when test="${action =='video'}"><%@include
					file="jsp/videoform.jsp"%></c:when>
			<c:when test="${action =='watchedvideo'}"><%@include
					file="jsp/watchedvideo.jsp"%></c:when>
			<c:when test="${action =='favorite'}"><%@include
					file="jsp/favorite.jsp"%></c:when>
			<c:when test="${action =='trend'}"><%@include
					file="jsp/trend.jsp"%></c:when>
			<c:when test="${action =='share'}"><%@include
					file="jsp/share.jsp"%></c:when>
			<c:when test="${action =='contact'}"><%@include
					file="jsp/contact.jsp"%></c:when>
		</c:choose>

	</main>
	<!-- footer -->
	<%@include file="jsp/footer.jsp"%>
</body>
</html>