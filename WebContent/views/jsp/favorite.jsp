<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
a img:hover {
	cursor: pointer;
}

#content {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

.x {
	color: lightslategray;
	font-size: 50px;
	z-index: 5;
	left: auto;
	right: 50px;
	bottom: auto;
	top: -20px;
	display: none;
}

.bars {
	color: lightslategray;
	font-size: 30px;
	z-index: 5;
	left: auto;
	right: 10px;
	bottom: auto;
	top: -5px;
	display: none;
}

.pop {
	font-size: 15px;
	width: 200px;
	top: 50px;
	z-index: 5;
	left: auto;
	right: -30px;
	color: white;
	background-color: #26272b;
	padding: 5px;
	border-radius: 15px;
	display: none;
}

.btn-history {
	background-color: ghostwhite;
	display: flex;
	justify-content: center;
	border-radius: 10px;
	height: 50px;
	z-index: 5;
	top: 30px;
	left: auto;
	right: -30px;
	display: none;
}

.btn-history button {
	margin: 10px;
}

.history img, .history {
	cursor: pointer;
}

.history:hover .x, .history:hover .bars {
	display: block;
}

.x:hover+.pop {
	display: block;
}

.x:hover {
	color: red;
	font-weight: bold;
}

.bars:hover {
	color: rgb(29, 29, 212);
	font-weight: bold;
}

.bars:hover+.btn-history {
	display: block;
}

.history .title {
	margin-top: 30px;
	width: 500px;
}

.history:hover .title {
	color: rgb(59, 59, 242);
}

li {
	list-style: none;
}

.li ul {
	padding: 0px;
	margin: 0px;
	list-style: none;
	border-radius: 5px;
	width: 180px;
	background-color: rgb(189, 187, 187);
	left: auto;
	right: -10px;
	bottom: auto;
	top: 30px;
}

.li ul {
	display: none;
}

.li:hover ul {
	display: block;
	z-index: 1000;
	font-size: 20px;
}

.fixed-right {
	position: fixed;
	right: 80px;
	left: auto;
	z-index: 1030;
}

.w-auto-setion {
	width: 70%;
}

.col-w {
	width: 100%;
	max-width: 320px;
}

.col-h {
	width: 100%;
	margin-top: 20px;
}

.col-h h1 {
	font-size: 15px;
	font-weight: bold;
}

.img-auto {
	width: 100%;
	height: 150px;
}

.p-fixed-right {
	padding: 3rem 3rem 10px 3rem;
}

#content {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 3;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

#contenttile {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

@media ( max-width :1400px) {
	.fixed-right {
		position: relative;
		width: 100%;
		left: auto;
		right: auto;
		display: flex;
		justify-content: center;
	}
	.w-auto-setion {
		width: 100%;
	}
	.col-w {
		width: 100%;
		height: auto;
	}
	.img-auto {
		width: 100%;
		height: auto;
	}
	.img-box {
		max-height: 200px;
	}
	.col-h h1 {
		font-size: 35px;
		font-weight: bold;
	}
	.col-h {
		width: 50%;
		margin-top: 50px;
	}
	.p-fixed-right {
		padding: 3rem;
	}
}
</style>
<section>
	<c:forEach var="favorite" items="${favorites}">
		<div class="modal fade " id="myModal${favorite.video.id}"
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

							<button formaction="./share?idVideo=${favorite.video.id}"
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
</section>
<section>
	<div
		class="dark-grey-text text-center fixed-right p-fixed-right rgba-white-strong"
		style="border-radius: 15px; z-index: 0; min-width: 25%; height: 280px">
		<div class="col-w">
			<div class="view overlay z-depth-1 white img-box w-100"
				style="border-radius: 10px;">
				<c:if test="${topVideoHistory==null}">
					<img class="img-auto" src="./views/images/main.png">
					<a href="">
						<div class="mask "
							style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
							<i class="fa fa-play fs-3 white-text "></i>
						</div>
					</a>
				</c:if>
				<c:if test="${topVideoHistory!=null}">
					<img class="img-auto"
						src="./views/images/${topVideoHistory.video.poster}">
					<a href="./main?action=video&idVideo=${topVideoHistory.video.id}">
						<div class="mask "
							style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
							<i class="fa fa-play fs-3 white-text "></i>
						</div>
					</a>
				</c:if>
			</div>
			<h3 class="font-weight-bold mt-2" id="contenttile">${topVideoHistory.video.title}</h3>
		</div>
		<div class="col-h">

			<div class="w-100">
				<button class="btn btn-green btn-rounded w-auto ">
					<h5>
						<i class="fa fa-play"></i> Phát tất cả
					</h5>
				</button>
				<button class="btn btn-blue btn-rounded w-auto">
					<h5>
						<i class="fa fa-random"></i> Trộn bài
					</h5>
				</button>
			</div>
		</div>

	</div>
	<div
		class="dark-grey-text text-center p-5 rgba-white-strong w-auto-setion"
		style="margin-top: 30px; border-radius: 15px;">
		<h3 class="font-weight-bold mb-2 pb-2 fs-2-5">Video đã thích</h3>
		<div class="row">
			<c:forEach var="favorite" items="${favorites}">
				<a href="#">
					<div class="col-sm-12 mt-2 history">
						<a href="./deleteFavoriteVideo?idVideo=${favorite.video.id}">
							<h1 class="position-absolute x">&times;</h1> <small
							class="pop position-absolute">Xóa video khỏi danh nhật ký</small>
						</a> <a href="#">
							<li class="li">
								<h1 class="position-absolute bars ">&#9776;</h1> </i>

								<ul class="position-absolute">
									<button class="btn btn-amber btn-rounded font-weight-bold w-50"
										data-toggle="modal" data-target="#myModal${favorite.video.id}">
										Share <i class="fa fa-share"></i>
									</button>
								</ul>

						</li>
						</a>
						<div class="row">
							<div class="col-sm-4 p-3 " style="min-height: 100px">
								<div
									class="view overlay z-depth-1 d-flex justify-content-center white "
									style="border-radius: 10px;">
									<img src="./views/images/${favorite.video.poster}"
										alt="Sample project image" style="height: 150px; width: 100%;">
									<a href="./main?action=video&idVideo=${favorite.video.id}">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>
								</div>
							</div>
							<div class="col-sm-8 text-left title">
								<h3 class="font-weight-500 mt-3">${favorite.video.title}</h3>
								<i class="fa fa-eye fs-1-5 ml-5 mt-2 dark-grey-text mt-2">${favorite.video.views}</i>
								<i class="fa fa-share fs-1-5 ml-5 mt-2 dark-grey-text mt-2">${favorite.video.shares}</i>
								<i class="fa fa-clock fs-1-5 ml-5 mt-2 dark-grey-text mt-2">
									${favorite.viewsDate}</i>
								<h4 class="mt-3 dark-grey-text" id="content">${favorite.video.description}</h4>
							</div>
						</div>
					</div>
				</a>

			</c:forEach>
		</div>
	</div>
</section>