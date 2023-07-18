<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
#content {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

.button {
	border-radius: 10px;
	display: inline-block;
	padding: 0.9rem 1.8rem;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	position: relative;
	background-color: transparent;
	overflow: hidden;
	z-index: 1;
	font-family: inherit;
	display: inline-block;
	color: grey;
	margin-top: 20px;
	display: inline-block;
}

#btnHide {
	border: 1px solid rgb(252, 70, 100);
}

#btnShow {
	border: 1px solid #33CC33;
}

#btnHide::before {
	background-color: rgb(252, 70, 100);
}

#btnShow::before {
	background-color: #33CC33;
}

.button::before {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	transform: translateX(-100%);
	transition: all .3s;
	z-index: -1;
	transform: translateX(-100%);
	transform: translateX(-100%);
}

.button:hover::before {
	transform: translateX(0);
}
</style>
<section class="${sessionScope.user==null?'show':'hidden'}">
	<div class="d-flex justify-content-center align-items-center">
		<div class="row"
			style="background-image: url(views/images/PELANGI\ FT_\ HAECHAN\,\ SOMI\ ✓.gif); width: 100%; border-radius: 10px;">
			<div class="col-md-12"
				style="text-align: center; color: white; margin-bottom: 5px;">
				<h1 style="font-weight: bold; font-size: 40px; margin-top: 30px;">ONLINE
					ENTERTAINMENT</h1>
				<h6
					style="font-weight: 500; font-size: 10px; margin-top: 10px; margin-bottom: 20px;">Vui
					lòng đăng nhập hoặc đăng ký trước khi bắt đầu</h6>
				<a href="./main?action=login&checkform=login"
					class="btn btn-white btn-rounded orange-text"
					style="font-weight: bold; width: auto;">Đăng nhập</a> <a
					href="./main?action=login"
					class="btn btn-outline-white btn-rounded "
					style="font-weight: bold; width: auto;">Đăng kí</a>
			</div>
		</div>
	</div>
</section>
<section>
	<c:forEach var="video" items="${videoHome}">
		<div class="modal fade " id="myModal${video.id}"
			style="margin-top: 200px;">
			<div class="modal-dialog ">
				<div class="modal-content" style="border-radius: 15px !important;">
					<!-- Modal Header -->
					<div class="modal-header ">
						<h2 class="modal-title fs-2 font-weight-500 deep-orange-text">Chia
							sẻ video với bạn</h2>
						<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
					</div>

					<!-- Modal body -->
					<form action="" method="post">
						<div class="modal-body d-flex justify-content-center ">
							<input class="rounded-1 h-35px w-100 fs-1-5 mt-xl-3" type="email"
								name="toEmail" placeholder="Nhập email người nhận . . ."
								required="required"
								oninvalid="this.setCustomValidity('Không được để trống thông tin người nhận!')"
								oninput="this.setCustomValidity('')">
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">

							<button formaction="./share?idVideo=${video.id}"
								class="btn btn-amber btn-rounded w-15  font-weight-bold fs-1">Gửi</button>
							<button
								class="btn btn-danger btn-rounded w-15 font-weight-bold fs-1"
								data-dismiss="modal">Hủy</button>


						</div>
					</form>

				</div>
			</div>
		</div>
	</c:forEach>
	<div class="dark-grey-text text-center p-5 rgba-white-strong"
		style="margin-top: 30px; border-radius: 15px;">
		<h3 class="font-weight-bold mb-4 pb-2">Danh Mục Video</h3>
		<div class="row" id="contentVideo">
			<c:forEach var="video" items="${videoHome}" begin="0" end="5">
				<div class="col-md-4 mt-5 ">
					<div class="col-md-12 p-3 "
						style="min-height: 200px; border-radius: 20px; border: 2px solid darkgrey">
						<i class="fa fa-eye fs-1-5 "
							style="position: absolute; z-index: 200; left: 20px; top: 20px; color: ghostwhite;">
							${video.views} </i>
						<div
							class="view overlay z-depth-1 d-flex justify-content-center white "
							style="border-radius: 10px;">

							<img src="views/images/${video.poster}"
								alt="Sample project image" style="height: 150px; width: 100%;">
							<c:choose>
								<c:when test="${sessionScope.user==null}">
									<a onclick="checkLogin()">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>
								</c:when>
								<c:otherwise>
									<a href="./main?action=video&idVideo=${video.id}">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>

								</c:otherwise>
							</c:choose>
						</div>

						<div class="px-3 pt-3 mx-1 mt-1 pb-0 ">
							<h4 class="font-weight-bold mb-3" id="content">${video.title}</h4>
							<div class="row" style="display: flex; justify-content: center;">
								<div>
									<c:choose>
										<c:when test="${sessionScope.user==null}">
											<button onclick="checkLogin()"
												class="btn btn-primary btn-rounded font-weight-bold w-72px ">
												${video.liked} <i class="far fa-thumbs-up"></i>
											</button>
											<button onclick="checkLogin()"
												class="btn btn-amber btn-rounded font-weight-bold w-72px">
												${video.shares} <i class="fa fa-share"></i>
											</button>
										</c:when>
										<c:otherwise>
											<form class="d-inline" action="./LikeShare" method="post">
												<button formaction="./like?idVideo=${video.id}"
													class="btn btn-primary btn-rounded font-weight-bold w-72px ">
													${video.liked} <i class="far fa-thumbs-up"></i>
												</button>
											</form>
											<a class="btn btn-amber btn-rounded font-weight-bold w-72px"
												data-toggle="modal" data-target="#myModal${video.id}">
												${video.shares} <i class="fa fa-share"></i>
											</a>
											<a href="./main?action=video&idVideo=${video.id}"
												class="btn btn-green btn-rounded font-weight-bold w-72px"><i
												class="fa fa-play fs-1 white-text "></i></a>

										</c:otherwise>
									</c:choose>
								</div>
								<div
									class="${(sessionScope.user.position=='Admin' || sessionScope.user.position=='Nhân viên')?'show':'hidden'}">
									<form action="./main" method="post">
										<button formaction="./editNewVideo?idEditVideo=${video.id}"
											class="btn btn-reddit btn-rounded font-weight-bold w-72px">Sửa</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row ${end==6?'hidden':show}">
			<div class="col-sm-12">
				<button class="btn button float-left" type="button" id="btnShow"
					data-toggle="collapse" data-target="#collapseExample"
					aria-expanded="false" aria-controls="collapseExample">Hiển
					thị thêm</button>
				<button class="btn button float-left" type="button" id="btnHide"
					style="display: none;" data-toggle="collapse"
					data-target="#collapseExample" aria-expanded="false"
					aria-controls="collapseExample">Ẩn bớt</button>
			</div>
		</div>
		<div class="collapse row" id="collapseExample">
			<c:forEach var="video" items="${videoHome}" begin="6" end="${end}">
				<div class="col-md-4 mt-5 ">
					<div class="col-md-12 p-3 "
						style="min-height: 200px; border-radius: 20px; border: 2px solid darkgrey">
						<i class="fa fa-eye fs-1-5 "
							style="position: absolute; z-index: 200; left: 20px; top: 20px; color: ghostwhite;">
							${video.views} </i>
						<div
							class="view overlay z-depth-1 d-flex justify-content-center white "
							style="border-radius: 10px;">

							<img src="views/images/${video.poster}"
								alt="Sample project image" style="height: 150px; width: 100%;">
							<c:choose>
								<c:when test="${sessionScope.user==null}">
									<a onclick="checkLogin()">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>
								</c:when>
								<c:otherwise>
									<a href="./main?action=video&idVideo=${video.id}">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>

								</c:otherwise>
							</c:choose>
						</div>

						<div class="px-3 pt-3 mx-1 mt-1 pb-0 ">
							<h4 class="font-weight-bold mb-3" id="content">${video.title}</h4>
							<div class="row" style="display: flex; justify-content: center;">
								<div>
									<c:choose>
										<c:when test="${sessionScope.user==null}">
											<button onclick="checkLogin()"
												class="btn btn-primary btn-rounded font-weight-bold w-72px ">
												${video.liked} <i class="far fa-thumbs-up"></i>
											</button>
											<button onclick="checkLogin()"
												class="btn btn-amber btn-rounded font-weight-bold w-72px">
												${video.shares} <i class="fa fa-share"></i>
											</button>
										</c:when>
										<c:otherwise>
											<form class="d-inline" action="./LikeShare" method="post">
												<button formaction="./like?idVideo=${video.id}"
													class="btn btn-primary btn-rounded font-weight-bold w-72px ">
													${video.liked} <i class="far fa-thumbs-up"></i>
												</button>
											</form>
											<a class="btn btn-amber btn-rounded font-weight-bold w-72px"
												data-toggle="modal" data-target="#myModal${video.id}">
												${video.shares} <i class="fa fa-share"></i>
											</a>
											<a href="./main?action=video&idVideo=${video.id}"
												class="btn btn-green btn-rounded font-weight-bold w-72px"><i
												class="fa fa-play fs-1 white-text "></i></a>

										</c:otherwise>
									</c:choose>
								</div>
								<div
									class="${(sessionScope.user.position=='Admin' || sessionScope.user.position=='Nhân viên')?'show':'hidden'}">
									<form action="./main" method="post">
										<button formaction="./editNewVideo?idEditVideo=${video.id}"
											class="btn btn-reddit btn-rounded font-weight-bold w-72px">Sửa</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>
	<script type="text/javascript">
		document.getElementById("btnHide").onclick = function() {
			document.getElementById("btnShow").style.display = 'inline-block';
			document.getElementById("btnHide").style.display = 'none';
		};

		document.getElementById("btnShow").onclick = function() {
			document.getElementById("btnShow").style.display = 'none';
			document.getElementById("btnHide").style.display = 'inline-block';
		};
	</script>
</section>