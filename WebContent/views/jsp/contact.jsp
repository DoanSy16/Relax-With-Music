<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style>
.col-auto-left {
	width: 68%;
	margin-right: 2%;
}

.col-auto-right {
	width: 30%;
}

.h-auto-map {
	height: 450px;
}

.auto-flex-warp {
	flex-wrap: nowrap;
}

@media ( max-width :700px) {
	.h-auto-map {
		height: 200px;
	}
	.col-auto-left {
		width: 100%;
	}
	.col-auto-right {
		width: 100%;
	}
}

@media ( max-width :450px) {
	.auto-flex-warp {
		flex-wrap: wrap;
	}
}
</style>
<section>
	<div class="row p-5 text-center rgba-white-light "
		style="margin-top: 30px; border-radius: 15px;">
		<div class="col-auto-left" style="margin-top: 50px;">
			<div id="map-container-google-1"
				class="h-auto-map z-depth-1  rounded-1"
				style="width: 100%; min-height: 200px;">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3928.8788739320867!2d105.75512251471191!3d10.026853092832754!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31a088476bb00027%3A0xd3c02747d1cbc8c6!2zMjg4IMSQLiBOZ3V54buFbiBWxINuIExpbmgsIEjGsG5nIEzhu6NpLCBOaW5oIEtp4buBdSwgQ-G6p24gVGjGoSwgVmlldG5hbQ!5e0!3m2!1sen!2s!4v1673982504773!5m2!1sen!2s"
					width="100%" height="100%" frameborder="0"
					style="border: 0; border-radius: 10px;" allowfullscreen=""
					aria-hidden="false" tabindex="0"></iframe>
			</div>
		</div>
		<div class="col-auto-right">
			<div class="form-wrap w-100">
				<div class="w-100 d-flex justify-content-center">
					<h1 class="mt-lg-4 font-weight-bold">Góp ý</h1>
				</div>

				<div class="tabs-content">
					<div id="signup-tab-content" class="active">
						<form class="signup-form" action="./sendmailContact?action=contact" method="post">
							<input type="text" name="fullname"
								value="${sessionScope.user.fullname}" class="input"
								autocomplete="off" placeholder="Họ và tên" readonly="readonly">
							<input type="email" name="email"
								value="${sessionScope.user.email}" class="input"
								autocomplete="off" placeholder="Email" readonly="readonly">
							<input type="text" class="input" autocomplete="off"
								name="subject" placeholder="Chủ đề" required="required"
								oninvalid="this.setCustomValidity('Không được để trống chủ đề!')"
								oninput="this.setCustomValidity('')">
							<textarea class="input rounded-1" name="body" id=""
								cols="30" rows="3" autocomplete="off" placeholder="Nội dung"
								required="required"
								oninvalid="this.setCustomValidity('Không được để trống nội dung!')"
								oninput="this.setCustomValidity('')"></textarea>
							<button 
								class="btn btn-primary w-100 fs-1-5 btn-rounded font-weight-bold">Gửi</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-12   auto-flex-warp ">
			<div class="col-sm-4 ">

				<i class="fas fa-map-marker-alt fa-2x blue-text"></i>

				<p class="font-weight-bold my-3">Địa chỉ</p>

				<p class="text-muted font-weight-bold">Cao Đẳng FPT Polytechnic
					CẦN THƠ</p>

			</div>
			<div class="col-sm-4 ">

				<i class="fas fa-phone fa-2x blue-text"></i>

				<p class="font-weight-bold my-3">Số điện thoại</p>

				<p class="text-muted font-weight-bold">0333XXXXXX</p>

			</div>

			<div class="col-sm-4 ">

				<i class="fas fa-envelope fa-2x blue-text"></i>

				<p class="font-weight-bold my-3">E-mail</p>

				<p class="text-muted font-weight-bold">sydhpc04388@fpt.edu.vn</p>

			</div>

		</div>
	</div>
</section>