<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<section>
	<div class="form-wrap-video">
		<div class="tabs">
			<h3 class="video-tab">
				<a class="${active1}" href="#video-tab-content">Video </a>
			</h3>
			<h3 class="videoedit-tab">
				<a class="${active2}" href="#videoedit-tab-content">Danh sách video</a>
			</h3>
		</div>
		<div class="tabs-content">
			<div id="video-tab-content" class="${active1}">
				<form class="row" action="./createvideo"
					enctype="multipart/form-data" method="post">
					<div class="col-sm-5">
						<div class="image-upload-container-video">
							<div class="image-upload-one-video">
								<div class="center-video">
									<div class="form-input-video">
										<label for="file-ip-1-video"> <c:if
												test="${createVideo.poster==null}">
												<img id="file-ip-1-preview"
													src="https://i.ibb.co/ZVFsg37/default.png">
											</c:if> <c:if test="${createVideo.poster!=null}">
												<img id="file-ip-1-preview"
													src="./views/images/${createVideo.poster}">
											</c:if>

										</label> <input type="file" name="poster" id="file-ip-1-video"
											accept="image/*" onchange="showPreview(event, 1);">
									</div>
								</div>
							</div>
							<button type="button"
								class="btn btn-deep-orange btn-rounded font-weight-bold fs-1"
								onclick="myImgRemove(1)">Không thêm ảnh</button>
						</div>

					</div>
					<div class="col-sm-7">
						<div class="edit">
							<label for="title_video">Tiêu đề</label> <input type="text"
								class="input" id="title_video" name="title"
								value="${createVideo.title}" required="required"
								oninvalid="this.setCustomValidity('Không được để trống tiêu đề!')"
								oninput="this.setCustomValidity('')">
						</div>
						<div class="edit">
							<label for="link_video">Link video</label> <input type="text"
								class="input" id="link_video" name="href"
								value="${createVideo.href}" required="required"
								oninvalid="this.setCustomValidity('Không được để trống đường dẫn video!')"
								oninput="this.setCustomValidity('')">
						</div>
						<div class="edit row">
							<div class="col-sm-6">
								<label for="views_video">Lượt xem</label> <input type="number"
									name="views" class="input" value="${createVideo.views}"
									id="views_video" min="0">
							</div>
							<div class="col-sm-6 mt-5">
								<input type="checkbox" name="activeCreateVideo" class="checkbox"
									id="active_video" ${createVideo.isactive==true || createVideo.isactive==null?"checked":""}>
								<label class="check" for="active_video"> Đang hoạt động</label>
							</div>
						</div>
					</div>
					<div class="col-sm-12 edit">
						<label for="description">Mô tả</label> <br>
						<textarea class="input w-100 rounded-1" name="description"
							id="description" rows="5">${createVideo.description}</textarea>

					</div>
					<div class="col-sm-6 d-flex justify-content-center ">
						<button formaction="./newCreateVideo"
							class="btn btn-comm btn-rounded font-weight-bold fs-1 w-25 h-35px"
							${buttonNewVideo==null?'disabled':'show'}>Mới</button>
						<button formaction="./insertNewVideo"
							class="btn btn-green btn-rounded font-weight-bold fs-1 w-25 h-35px">Thêm</button>
						<button formaction="./updateNewVideo?idEditVideo=${createVideo.id}"
							${buttonNewVideo==null?'disabled':'show'}
							class="btn btn-amber btn-rounded font-weight-bold fs-1 w-25 h-35px">Sửa</button>
						<button formaction="./deleteNewVideo?idEditVideo=${createVideo.id}"
							class="btn btn-danger btn-rounded font-weight-bold fs-1 w-25 h-35px"
							${buttonDeleteVideo==null?'disabled':'show'}>Xóa</button>

					</div>
				</form>
			</div>
			<div id="videoedit-tab-content" class="${active2}">
				<form class="videoedit-form" action="" method="post">
					<table>
						<thead>
							<tr>
								<th scope="col" style="width: 55%">Tiêu đề</th>
								<th scope="col">Lượt xem</th>
								<th scope="col">Trạng thái</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="video" items="${videoEdit}">
								<tr>
									<td data-label="Tiêu đề" style="text-align: left;">${video.title}</td>
									<td data-label="Lượt xem">${video.views}  <i
										class="fa fa-eye black-text"></i></td>
									<td data-label="Trạng thái">${video.isactive==false?"Tắt":"Mở"}</td>
									<td data-label=""><button
											formaction="./editNewVideo?idEditVideo=${video.id}"
											class="btn btn-amber btn-rounded font-weight-bold fs-1">Sửa</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>
