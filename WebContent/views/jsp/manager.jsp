<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<section>
	<div class="form-wrap-video" style="width: 100%;">
		<div class="tabs">
			<h3 class="favorites favorites-tab">
				<a class="${active1}" href="#favorites-tab-content">Xu hướng</a>
			</h3>
			<h3 class="favorites favorites-user-tab">
				<a class="${active2}" href="#favorite-user-tab-content">Yêu
					thích</a>
			</h3>
			<h3 class="favorites share-tab">
				<a class="${active3}" href="#share-tab-content">Chia sẻ</a>
			</h3>
			<h3 class="favorites insert-user-tab">
				<a class="${active4}" href="#insert-tab-content">Tài khoản</a>
			</h3>
		</div>
		<div class="tabs-content">
			<div id="favorites-tab-content" class="${active1}">
				<form class="row" action="" method="post">
					<table>
						<thead>
							<tr>
								<th scope="col" style="width: 50%">Tiêu đề</th>
								<th scope="col">Lượt thích</th>
								<th scope="col">Ngày bắt đầu</th>
								<th scope="col">Ngày kết thúc</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="video" items="${managerVideo}">
								<tr>
									<td data-label="Tiêu đề" style="text-align: left;">${video.title}</td>
									<td data-label="Lượt thích">
										<p class="d-inline mr-3">${video.liked}</p> <i
										class="fa fa-thumbs-up blue-text"></i>
									</td>
									<td data-label="Ngày bắt đầu">${video.startDate}</td>
									<td data-label="Ngày kết thúc">${video.endDate}</td>
									<td><a href="./main?action=video&idVideo=${video.id}"
										class="btn btn-deep-orange btn-rounded font-weight-bold fs-1">Xem</a></td>
								</tr>

							</c:forEach>



						</tbody>
					</table>
				</form>
			</div>
			<div id="favorite-user-tab-content" class="${active2}">
				<form class="favorite-user-form" action="selectUserFavorite"
					method="post">
					<select class="input rounded-1 " name="select" id="user-position"
						onclick="selectUserFavorite(this)">
						<c:forEach var="video" items="${videoHome}">
							<option value="${video.id}">${video.title}</option>
						</c:forEach>
					</select>
					<table>
						<thead>
							<tr>
								<th scope="col">Tên đăng nhập</th>
								<th scope="col">Họ và tên</th>
								<th scope="col">Email</th>
								<th scope="col">Ngày thích</th>
							</tr>
						</thead>
						<tbody id="userFavorite">
							<c:forEach var="favorite" items="${userFavorite}">
								<tr>
									<td data-label="Tên đăng nhập">${favorite.user.username}</td>
									<td data-label="Họ và tên">${favorite.user.fullname}</td>
									<td data-label="Email">${favorite.user.email}</td>
									<td data-label="Ngày thích">${favorite.likedDate}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</form>
			</div>
			<div id="share-tab-content" class="${active3}">
				<form class="share-form" action="" method="post">
					<select class="input rounded-1 " name="selectShare" onclick="selectUserShare(this)" id="user-position">
						<c:forEach var="video" items="${videoHome}">
							<option value="${video.id}">${video.title}</option>
						</c:forEach>
					</select>
					<table>
						<thead>
							<tr>
								<th scope="col">Họ và tên</th>
								<th scope="col">Người gửi</th>
								<th scope="col">Người nhận</th>
								<th scope="col">Ngày gửi</th>
							</tr>
						</thead>
						<tbody id="userShare">
							<c:forEach var="favorite" items="${userShare}">
								<tr>
									<td data-label="Tên đăng nhập">${favorite.user.username}</td>
									<td data-label="Họ và tên">${favorite.user.fullname}</td>
									<td data-label="Email">${favorite.user.email}</td>
									<td data-label="Ngày thích">${favorite.likedDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			</div>
			<div id="insert-tab-content" class="${active4}">
				<form class="row" action="/createuser" method="post">
					<div class="col-sm-6">
						<label for="fullname">Họ và tên</label> <input class="input"
							type="text" name="fullname" id="fullname"
							value="${User.fullname}" required="required"
							oninvalid="this.setCustomValidity('Không được để trống họ và tên!')"
							oninput="this.setCustomValidity('')"> <label for="email">Email</label>
						<input class="input" type="email" name="email" id="email"
							value="${User.email}" required="required"
							oninvalid="this.setCustomValidity('Không được để trống email!')"
							oninput="this.setCustomValidity('')"> <label
							for="position">Chức vụ</label> <select class="input rounded-1 "
							name="position" id="position">
							<option value="Khách hàng">Khách hàng</option>
							<option
								class="${sessionScope.user.position=='Nhân viên'?'hidden':'show'}"
								value="Nhân viên">Nhân viên</option>
						</select>
					</div>
					<div class="col-sm-6">
						<label for="username">Tên đăng nhập</label> <input class="input"
							type="text" name="username" id="username"
							value="${User.username}" required="required"
							oninvalid="this.setCustomValidity('Không được để trống tên đăng nhập!')"
							oninput="this.setCustomValidity('')"> <label
							for="password">Mật khẩu</label> <input class="input" type="text"
							name="password" id="password" value="${User.password}"
							required="required"
							oninvalid="this.setCustomValidity('Không được để trống mật khẩu!')"
							oninput="this.setCustomValidity('')">
						<div class="mt-5 d-flex justify-content-center">
							<button formaction="./new"
								class="btn btn-comm btn-rounded font-weight-bold fs-1 w-25 h-40px ${buttonNew==null?'disabled':'show'}">Mới</button>
							<button formaction="./insert"
								class="btn btn-green btn-rounded font-weight-bold fs-1 w-25">Thêm</button>
							<button formaction="./edit"
								class="btn btn-amber btn-rounded font-weight-bold fs-1 w-25 ${buttonNew==null?'disabled':'show'}">Sửa</button>
							<button formaction="./delete"
								class="btn btn-red btn-rounded font-weight-bold fs-1 w-25 ${buttonDelete==null?'disabled':'show'}">Xóa</button>
						</div>
					</div>

				</form>
				<form class="row" action="/createuser" method="post">
					<table>
						<thead>
							<tr>
								<th scope="col">Họ và tên</th>
								<th scope="col">Tên đăng nhập</th>
								<th scope="col">Mật khẩu</th>
								<th scope="col">Email</th>
								<th scope="col">Chức vụ</th>
								<th scope="col">Trạng thái</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${createUser}">
								<c:if
									test="${(user.position!='Admin') and (sessionScope.user.position=='Admin' or sessionScope.user.position=='Nhân viên' and (user.position=='Nhân viên' and user.email==sessionScope.user.email)) or user.position=='Khách hàng'}">
									<tr>
										<td data-label="Họ và tên">${user.fullname}</td>
										<td data-label="Tên đăng nhập">${user.username}</td>
										<td data-label="Mật khẩu">${user.password}</td>
										<td data-label="Email">${user.email}</td>
										<td data-label="Chức vụ">${user.position}</td>
										<td data-label="Trạng thái"><button
												formaction="./active?userAction=${user.username}"
												class="btn ${user.active==true?'btn-green':'btn-red'} btn-rounded font-weight-bold">
												${user.active==true?'Đang hoạt động':'Dừng hoạt động'}</button></td>
										<td><button
												formaction="./loadData?userAction=${user.username}"
												class="btn btn-cyan btn-rounded font-weight-bold">Tải
												lên</button></td>
									</tr>
								</c:if>
							</c:forEach>

						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	function selectUserFavorite(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "./selectUserFavorite",
			type : "get", //send it through get method
			data : {
				select : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("userFavorite");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
	function selectUserShare(param) {
		var txtSearch = param.value;
		$.ajax({
			url : "./selectUserShare",
			type : "get", //send it through get method
			data : {
				selectShare : txtSearch
			},
			success : function(data) {
				var row = document.getElementById("userShare");
				row.innerHTML = data;
			},
			error : function(xhr) {
				//Do Something to handle error
			}
		});
	}
</script>