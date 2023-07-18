<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous"
	src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v16.0"
	nonce="WSTUNHss"></script>
<style>
img:hover {
	cursor: pointer !important;
}

.col-left, .col-right {
	width: 50%;
}

.col-right {
	padding-left: 10px;
}

.block-video:hover {
	cursor: pointer;
	color: rgb(59, 59, 242);
}

#content {
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 1;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

@media ( max-width :1300px) {
	.col-left {
		width: 30%;
	}
	.col-right {
		width: 70%;
	}
}
</style>
<section>
	<div class="modal fade " id="myModal${mainVideo.id}"
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

						<button formaction="./share?idVideo=${mainVideo.id}&action=video"
							class="btn btn-amber btn-rounded w-15  font-weight-bold fs-1">Gửi</button>
						<button
							class="btn btn-danger btn-rounded w-15 font-weight-bold fs-1"
							data-dismiss="modal">Hủy</button>
					</div>
				</form>

			</div>
		</div>
	</div>
</section>
<section>
	<div class="dark-grey-text text-center p-5 rgba-white-strong"
		style="border-radius: 15px;">
		<div class="row">
			<div class="col-lg-8 mt-5 ">
				<div
					class="view overlay z-depth-1 d-flex justify-content-center white "
					style="border-radius: 10px; height: 400px;">
					<iframe style="width: 100%;" src="${mainVideo.href}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>
				</div>
				<div class="px-3 pt-3 mx-1 mt-1 pb-0" style="text-align: left;">
					<h4 class="font-weight-bold mb-3  float-left ">${mainVideo.title}</h4>
					<div class="w-100">
						<pre class="mb-3 rgba-white-light p-2 " id="content"
							style="border-radius: 10px; font-size: 15px; width: 100%">${mainVideo.description}</pre>
					</div>
					<button class="btn btn-green btn-rounded font-weight-bold "
						id="btnshow">Hiển thị thêm...</button>
					<button class="btn btn-danger btn-rounded font-weight-bold "
						id="btnhide" style="display: none;">ẨN bớt...</button>
					<div class="float-left">
						<form class="d-inline" action="./LikeShare" method="post">
							<button formaction="./like?idVideo=${mainVideo.id}&action=video"
								class="btn btn-primary btn-rounded font-weight-bold w-72px ">
								${mainVideo.liked} <i class="far fa-thumbs-up"></i>
							</button>
						</form>
						<a class="btn btn-amber btn-rounded font-weight-bold w-72px"
							data-toggle="modal" data-target="#myModal${mainVideo.id}">
							${mainVideo.shares} <i class="fa fa-share"></i>
						</a>
						</button>
					</div>
				</div>
				<div class="fb-comments mt-5 col-lg-8" data-href="https://relax.com"
					data-width="100%" data-numposts="5"></div>
			</div>
			<div class="col-lg-4 ">
				<c:forEach var="video" items="${listVideos}">
					<div class="block-video mt-5 row">
						<a href="#">
							<div class="col-left"
								style="min-height: 100px; border-radius: 10px;">
								<div class="view overlay z-depth-1 white "
									style="border-radius: 5px;">
									<img src="views/images/${video.poster}" alt=""
										style="height: 100px; width: 100%;"> <a
										href="./main?action=video&idVideo=${video.id}">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>
								</div>

							</div>
							<div class="col-right">
								<h5 class="font-weight-500 fs mb-3 mt-1 fs-1-5"
									style="text-align: left;">${video.title}</h5>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		document.getElementById("btnhide").onclick = function() {
			document.getElementById("content").style.webkitLineClamp = '1';
			document.getElementById("btnshow").style.display = 'inline-block';
			document.getElementById("btnhide").style.display = 'none';
		};

		document.getElementById("btnshow").onclick = function() {
			document.getElementById("content").style.webkitLineClamp = 'unset';
			document.getElementById("btnshow").style.display = 'none';
			document.getElementById("btnhide").style.display = 'inline-block';
		};
	</script>
</section>



