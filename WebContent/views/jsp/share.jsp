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
</style>
<section>
	<div class="dark-grey-text text-center p-5 rgba-white-strong"
		style="margin-top: 30px; border-radius: 15px;">
		<h3 class="font-weight-bold mb-4 pb-2">Danh Mục Video</h3>
		<div class="row">
			<c:forEach var="share" items="${shareVideos}">
				<div class="col-md-4 mt-5 ">
					<div class="col-md-12 p-3 "
						style="min-height: 200px; border-radius: 20px; border: 2px solid darkgrey">
						<i class="fa fa-eye fs-1-5 "
							style="position: absolute; z-index: 200; left: 20px; top: 20px; color: ghostwhite;">
							${share.video.views} </i>
						<div
							class="view overlay z-depth-1 d-flex justify-content-center white "
							style="border-radius: 10px;">

							<img src="views/images/${share.video.poster}"
								alt="Sample project image" style="height: 150px; width: 100%;">
							<c:choose>
								<c:when test="${share.video.isactive==false}">
									<a onclick="checkVideoActive()">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>
								</c:when>
								<c:otherwise>
									<a href="./main?action=video&idVideo=${share.video.id}">
										<div class="mask "
											style="background-color: rgba(62, 69, 81, .7); display: flex; justify-content: center; align-items: center;">
											<i class="fa fa-play fs-3 white-text "></i>
										</div>
									</a>

								</c:otherwise>
							</c:choose>
						</div>

						<div class="px-3 pt-3 mx-1 mt-1 pb-0 ">
							<h4 class="font-weight-bold mb-3" id="content">${share.video.title}</h4>
							<div class="row" style="display: flex; justify-content: center;">
								<div>
									<h3>Chia sẻ đến: ${share.emails}</h3>
									<form class="d-inline" action="./LikeShare" method="post">
										<button
											formaction="./like?idVideo=${share.video.id}&action=share"
											class="btn btn-primary btn-rounded font-weight-bold w-72px ">
											${share.video.liked} <i class="far fa-thumbs-up"></i>
										</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>