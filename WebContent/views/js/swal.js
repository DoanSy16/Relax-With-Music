function checkLogin() {
	Swal.fire({
		title:
			'<h1 style="color:red;font-weight:bold;font-size:30px">Bạn chưa đăng nhập</h1>',
		icon: "error",
		showCancelButton: true,
		confirmButtonColor: "#d33",
		cancelButtonColor: "#3085d6",
		confirmButtonText: "Đăng nhập",
		cancelButtonText: "Hủy",
		timer: 5000,
		allowOutsideClick: false
	}).then((result) => {
		if (result.value) {
			window.location.href = "./main?action=login&checkform=login";
		}
	});
}
function loginSuccessfull() {
	/*window.location.href = "./main";*/
	Swal.fire({
		title: '<h1 style="color: red; font-size:20px;font-weight: bold;">Đăng nhập thành công</h1>',
		icon: 'success',
		showCancelButton: true,
		confirmButtonColor: "#d33",
		cancelButtonColor: "#3085d6",
		confirmButtonText: "Đăng nhập",
		cancelButtonText: "Hủy",
		allowOutsideClick: false,
		timer: 5000,
	})
}
function checkVideoActive() {
	/*window.location.href = "./main";*/
	Swal.fire({
		title: '<h1 style="color: red; font-size:20px;font-weight: bold;">Video đã dừng chiếu</h1>',
		icon: 'error',
		showCancelButton: false,
		confirmButtonColor: "#d33",
		cancelButtonColor: "#3085d6",
		allowOutsideClick: false,
		timer: 3000,

	})
}
function logout() {
	Swal.fire({
		title:
			'<h1 style="color:red;font-weight:bold;font-size:30px">Bạn chắc chắn đăng xuất?</h1>',
		icon: "error",
		showCancelButton: true,
		confirmButtonColor: "#d33",
		cancelButtonColor: "#3085d6",
		confirmButtonText: "Có",
		cancelButtonText: "Không",
		timer: 5000,
		allowOutsideClick: false
	}).then((result) => {
		if (result.value) {
			Swal.fire({
				title:
					'<h1 style="color:red;font-weight:bold;font-size:30px">Đăng xuất thành công!</h1>',
				icon: "success",
				showCancelButton: false,
				showConfirmButton: false,
				allowOutsideClick: false,
				timer: 3000
			});
			window.location.href = "./main?action=logout";
			
		}
	});
}