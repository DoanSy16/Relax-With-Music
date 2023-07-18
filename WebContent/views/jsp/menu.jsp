<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.inputFind {
	color: #8707ff;
	border: 2px solid #8707ff;
	border-radius: 10px;
	padding: 5px 15px;
	background: transparent;
	max-width: 200px;
}

.inputFind:active {
	box-shadow: 2px 2px 15px #8707ff inset;
}
</style>

<header>
	<div id="mySidenav" class="sidenav list-unstyled">
		<li><a href="./main"><i class="fa fa-home"> Trang chủ</i></a></li>
		<li class="${sessionScope.user==null?'hidden':'show'}"><a
			href="./main?action=watchedvideo"><i class="fa fa-clock">
					Video đã xem</i></a></li>
		<li class="${sessionScope.user==null?'hidden':'show'}"><a
			href="./main?action=favorite"><i class="fa fa-thumbs-up">
					Video đã thích</i></a></li>
		<li><a href="./main?action=trend"><i class="fa fa-heart">
					Xu hướng</i></a></li>
		<li class="${sessionScope.user==null?'hidden':'show'}"><a
			href="./main?action=share"><i class="fa fa-share-alt-square">
					Chia sẻ</i></a></li>
		<li><a href="./main?action=contact"><i
				class="fa fa-comment-dots"> Liên hệ</i></a></li>
		<div
			class="${(sessionScope.user.position=='Admin'or sessionScope.user.position=='Nhân viên')?'show':'hidden'}">
			<hr class="hr-light w-75">
			<li><a href="./main?action=manager"><i class="fa fa-bars">
						Quản lý</i></a></li>
			<li><a href="./main?action=addvideo"><i
					class="fa fa-plus-circle"> Thêm video</i></a></li>
		</div>
	</div>
	<nav class="navbar fixed-top navbar-expand-lg  double-nav ">
		<div class="float-left ">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
		</div>
		<div class="breadcrumb-dn mr-auto">
			<p>
				<strong class="font-weight-bold fa-2x">MENU</strong>
			</p>
		</div>
		<form action="searchVideo" method="post">
			<input type="text" class="inputFind" name="txt"
				value="${txtS}" oninput="searchByName(this)"
				placeholder="Tìm kiếm video....">
		</form>
		<div class="nav-item dropdown">
			<a class="nav-link dropdown-toggle" href="" id="userDropdown"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<c:choose>
					<c:when test="${sessionScope.user==null}">
						<img src="./views/imgusers/user.png" alt=""
							style="width: 35px; height: 35px; border-radius: 50%;">
					</c:when>
					<c:when test="${sessionScope.user.image=='user.png'}">
						<img src="./views/imgusers/user.png" alt=""
							style="width: 35px; height: 35px; border-radius: 50%;">
					</c:when>
					<c:otherwise>
						<img src="views/imgusers/${sessionScope.user.image}" alt=""
							style="width: 35px; height: 35px; border-radius: 50%;">
					</c:otherwise>
				</c:choose>
			</a>
			<div class="dropdown-menu dropdown-menu-right dropdown-secondary"
				aria-labelledby="userDropdown">
				<div style="width: 150px;">
					<c:choose>
						<c:when test="${sessionScope.user==null}">
							<img class="" src="./views/imgusers/user.png" alt=""
								style="width: 30px; height: 30px; border-radius: 50%;">
						</c:when>
						<c:when test="${sessionScope.user.image=='user.png'}">
							<img class="" src="./views/imgusers/user.png" alt=""
								style="width: 30px; height: 30px; border-radius: 50%;">
						</c:when>
						<c:otherwise>
							<img class="" src="./views/imgusers/${sessionScope.user.image}"
								alt="" style="width: 30px; height: 30px; border-radius: 50%;">
						</c:otherwise>
					</c:choose>

					<h4 class="d-inline">${sessionScope.user==null?'Tài khoản':sessionScope.user.fullname}</h4>
					<h5 style="margin: 5px auto 0px auto !important;">${sessionScope.user.email}</h5>
					<hr>
				</div>
				<div class="${sessionScope.user==null?'show':'hidden'}">
					<a class="dropdown-item" href="./main?action=login">Đăng kí</a> <a
						class="dropdown-item" href="./main?action=login&checkform=login">Đăng
						nhập</a> <a class="dropdown-item"
						href="./main?action=login&checkform=forgotPassMenu">Quên mật
						khẩu</a>
				</div>
				<div class="${sessionScope.user==null?'hidden':'show'}">
					<a class="dropdown-item" href="./main?action=infor">Thông tin
						cá nhân</a> <a class="dropdown-item" href="#" onclick="logout()">Đăng
						xuất</a>
				</div>
			</div>
		</div>
	</nav>
</header>
<script type="text/javascript">
	function searchByName(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "./searchAjax",
			type : "get", //send it through get method
			data : {
				txt : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("contentVideo");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
</script>