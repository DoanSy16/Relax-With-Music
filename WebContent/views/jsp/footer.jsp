<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<footer class="site-footer mt-5 ">
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-6">
				<h6>Giới thiệu</h6>
				<p class="text-justify">Website nghe nhạc là một nơi lý tưởng để
					thưởng thức và khám phá âm nhạc đa dạng từ các thể loại nhạc pop,
					rock, jazz đến nhạc cổ điển và nhạc rap. Với hàng triệu bài hát từ
					các nghệ sĩ nổi tiếng và mới nổi, bạn có thể tìm thấy những bài hát
					yêu thích của mình và tận hưởng những âm điệu tuyệt vời. Bên cạnh
					đó, tính năng tạo playlist và chia sẻ âm nhạc với bạn bè là điểm
					nhấn của website, giúp bạn tạo ra những trải nghiệm âm nhạc độc đáo
					và thú vị.</p>
			</div>

			<div class="col-xs-6 col-md-3">
				<h6>Chức năng</h6>
				<c:if test="${sessionScope.user!=null}">
					<ul class="footer-links">
						<li><a href="#">Đăng nhập</a></li>
						<li><a href="#">Đăng ký</a></li>
						<li><a href="#">Quên mật khẩu</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.user==null}">
					<ul class="footer-links">
						<li><a href="./main?action=login&checkform=login">Đăng
								nhập</a></li>
						<li><a href="./main?action=login">Đăng ký</a></li>
						<li><a href="./main?action=login&checkform=forgotPassMenu">Quên
								mật khẩu</a></li>
					</ul>
				</c:if>

			</div>

			<div class="col-xs-6 col-md-3">
				<h6>Liên hệ</h6>
				<ul class="footer-links">
					<li><a href=""><i class="fas fa-phone me-3"></i>
							0333******</a></li>
					<li><a href=""><i class="fas fa-home me-3"></i> Ninh Kiều,
							TP Cần Thơ</a></li>
					<li><a href=""><i class="fas fa-envelope me-3"></i>
							relaxwithmusicweb@gmail.com</a></li>
				</ul>
			</div>
		</div>
		<hr>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-6 col-xs-12">
				<p class="copyright-text">
					Fpt &copy; 2023 <a href="#"></a>.
				</p>
			</div>

			<div class="col-md-4 col-sm-6 col-xs-12">
				<ul class="social-icons">
					<li><a class="facebook" href="#"><i
							class="fab fa-facebook-f"></i></a></li>
					<li><a class="twitter" href="#"><i class="fab fa-twitter"></i></a></li>
					<li><a class="github" href="#"><i class="fab fa-github"></i></a></li>
					<li><a class="linkedin" href="#"><i
							class="fab fa-linkedin"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
</footer>