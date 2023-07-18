<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:if test="${alert=='error'}">
	<div style="width: 400px; float: right; margin-top: 10px"
		class="alert alert-danger" role="alert">
		<img alt="" src="./views/images/error.jpg" style="color: red;">
		${message}
	</div>
</c:if>
<c:if test="${alert=='success'}">
	<div style="width: 400px; float: right; margin-top: 10px"
		class="alert alert-success" role="alert">
		<img alt="" src="./views/images/cross.jpg" style="color: red;">
		${message}
	</div>
</c:if>
<section style="margin-top: 100px; text-align: center">
	<div class="form-wrap">
		<div class="tabs">
			<h3 class="signup-tab">
				<a class="${active1}  ${sessionScope.user==null?'show':'hidden'}"
					href="#signup-tab-content">Đăng kí</a>
			</h3>
			<h3 class="login-tab">
				<a href="#login-tab-content" class="${active2}">Đăng nhập</a>
			</h3>
			<h3 class="login-tab">
				<a href="#forgot-tab-content"
					class="${active3} ${sessionScope.user==null?'show':'hidden'}">Quên
					mật khẩu</a>
			</h3>
		</div>

		<div class="tabs-content">
			<div id="signup-tab-content" class="${active1}">
				<small class="red-text">${checkLogout}</small>
				<form class="signup-form" action="./register" method="post">
					<input type="email" class="input" id="user_email"
						autocomplete="off" placeholder="Email" name="email"
						value="${user.email}" required="required"
						oninvalid="this.setCustomValidity('Email không đúng định dãng hoặc bị bỏ trống!')"
						oninput="this.setCustomValidity('')"> <input type="text"
						class="input" id="user_name" autocomplete="off"
						placeholder="Tên đăng nhập" name="username"
						value="${user.username}" required="required"
						oninvalid="this.setCustomValidity('Không bỏ trống tên đăng nhập!')"
						oninput="this.setCustomValidity('')"> <input type="text"
						class="input" id="user_fullnaem" autocomplete="off"
						placeholder="Họ và tên" name="fullname" value="${user.fullname}"
						required="required"
						oninvalid="this.setCustomValidity('Không bỏ trống họ và tên!')"
						oninput="this.setCustomValidity('')"> <input
						type="password" class="input" id="user_pass" autocomplete="off"
						placeholder="Mật khẩu" name="password" value="${user.password}"
						required="required"
						oninvalid="this.setCustomValidity('Không bỏ trống mật khẩu!')"
						oninput="this.setCustomValidity('')"> <input type="text"
						class="input ${codeMail==null?'hidden':'show'}" id="user_ma"
						autocomplete="off" placeholder="Nhập mã" name="code"> <input
						type="submit" class="button ${codeMail==null?'show':'hidden'}"
						value="Gửi mã" formaction="./sendcode"> <input
						type="submit" class="button ${codeMail==null?'hidden':'show'}"
						value="Đăng kí" formaction="./signup">
				</form>
			</div>

			<div id="login-tab-content" class="${active2}">
				<small class="red-text">${check}</small>
				<form class="login-form" action="./login" method="post">
					<input type="text" class="input" id="user_login" autocomplete="off"
						placeholder="Email or Username" name="usernameLogin"
						value="${usernameLogin}" required="required"
						oninvalid="this.setCustomValidity('Không được bỏ trống tên đăng nhập hoặc email!')"
						oninput="this.setCustomValidity('')"> <input
						type="password" class="input" id="user_pass" autocomplete="off"
						placeholder="Password" name="passwordLogin"
						value="${passwordLogin}" required="required"
						oninvalid="this.setCustomValidity('Không được bỏ trống mật khẩu!')"
						oninput="this.setCustomValidity('')"> <input
						type="checkbox" class="checkbox" id="remember_me"
						name="rememberLogin"> <label class="remember"
						for="remember_me">Nhớ tôi ?</label> <input type="submit"
						class="button" value="Đăng nhập">
				</form>
			</div>

			<div id="forgot-tab-content" class="${active3}">
				<form action="/forgotPass" method="post">
					<div>
						<div class="${codeMail==null?'show':'hidden'}">
							<input class="rounded-1 h-35px w-100 fs-1-5 mt-xl-3" type="email"
								name="forgotEmail" placeholder="Nhập email của bạn . . ."
								value="${forgotEmail}" required="required"
								oninvalid="this.setCustomValidity('Email không đúng định dãng hoặc bị bỏ trống!')"
								oninput="this.setCustomValidity('')"> <br>
						</div>
						<div class="${codeMail==null?'hidden':'show'}">
							<input class="rounded-1 h-35px w-100 fs-1-5 mt-xl-3" type="text"
								name="forgotCode" placeholder="Nhập mã . . ."
								${codeMail==null?'':'required="required"'}
								oninvalid="this.setCustomValidity('Không được để trống mã!')"
								oninput="this.setCustomValidity('')"> <br> <input
								class="rounded-1 h-35px w-100 fs-1-5 mt-xl-3" type="password"
								placeholder="Mật khẩu mới . . ." name="forgotNewPass"
								value="${newPassword}"
								${codeMail==null?'':'required="required"'}
								oninvalid="this.setCustomValidity('Không được để trống mật khẩu mới!')"
								oninput="this.setCustomValidity('')"> <br> <input
								class="rounded-1 h-35px w-100 fs-1-5 mt-xl-3" type="password"
								placeholder="Nhập lại mật khẩu . . ." name="forgotConfirmPass"
								value="${confrimPassword}"
								${codeMail==null?'':'required="required"'}
								oninvalid="this.setCustomValidity('Không được để trống mật khẩu nhập lại!')"
								oninput="this.setCustomValidity('')">
						</div>
					</div>

					<div style="margin-left: 280px;">
						<button formaction="./sendMail"
							class="btn btn-amber btn-rounded w-30  font-weight-bold fs-1 ${codeMail==null?'show':'hidden'}">Gửi</button>
						<button formaction="./changePass"
							class="btn btn-green btn-rounded w-30  font-weight-bold fs-1 ${codeMail==null?'hidden':'show'}">Đổi
							mật khẩu</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>