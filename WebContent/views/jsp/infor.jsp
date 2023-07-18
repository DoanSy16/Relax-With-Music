<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
.form-wrap .tabs h3 {
    float: left;
    width: 50%;
}
</style>
<section style="margin-top: 30px;">
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="signup-tab">
				<a class="${active1}" href="#signup-tab-content">Thông tin</a>
			</h3>
			<h3 class="login-tab">
				<a class="${active2}" href="#login-tab-content">Đổi mật khẩu</a>
			</h3>
		</div>
		<div class="tabs-content">
			<div id="signup-tab-content" class="${active1}">
				<form class="signup-form" action="./updateuser"
					enctype="multipart/form-data" method="post">
					<input type="email" class="input" id="user_email"
						autocomplete="off" placeholder="Email" readonly="readonly"
						value="${sessionScope.user.email}" name="email"> <input
						type="text" class="input" id="user_name" autocomplete="off"
						placeholder="Username" readonly="readonly"
						value="${sessionScope.user.username}" name="username"> <input
						type="text" class="input" id="user_fullname" autocomplete="off"
						placeholder="Họ và tên" value="${sessionScope.user.fullname}"
						name="fullname" required="required"
						oninvalid="this.setCustomValidity('Không được để trống Họ và tên!')"
						oninput="this.setCustomValidity('')">
					<div class="col-sm-12 d-flex justify-content-center">
						<div class=" image-upload-container ">
							<div class="image-upload-one">
								<div class="center">
									<div class="form-input">
										<label for="file-ip-1"> <img id="file-ip-1-preview"
											src="./views/imgusers/${sessionScope.user.image}">

										</label> <input type="file" name="image" id="file-ip-1"
											accept="image/*" onchange="showPreview(event, 1);">
									</div>
								</div>

							</div>
							<button type="button"
								class="btn btn-deep-orange btn-rounded font-weight-bold fs-1 "
								onclick="myImgRemove(1)">Không thêm ảnh</button>
						</div>
					</div>
					<input type="submit" class="button mt-1" value="Cập nhật">
				</form>
			</div>

			<div id="login-tab-content" class="${active2}">
				<small class="red-text">${check}</small>
				<form class="login-form" action="./changepassword" method="post">
					<input type="password" class="input" id="user_oldpass"
						autocomplete="off" placeholder="Mật khẩu cũ" name="oldpass"
						required="required"
						oninvalid="this.setCustomValidity('Không được để trống mật khẩu cũ!')"
						oninput="this.setCustomValidity('')"> <input
						type="password" class="input" id="user_newpass" autocomplete="off"
						placeholder="Mật khẩu mới" name="newpass" required="required"
						oninvalid="this.setCustomValidity('Không được để trống mật khẩu mới!')"
						oninput="this.setCustomValidity('')"> <input
						type="password" class="input" id="user_newpass" autocomplete="off"
						placeholder="Nhập lại mật khẩu" name="confirmnewpass"
						required="required"
						oninvalid="this.setCustomValidity('Không được để trống nhập lại mật khẩu!')"
						oninput="this.setCustomValidity('')"> <input type="submit"
						class="button" value="Cập nhật">
				</form>
			</div>
		</div>
	</div>
</section>