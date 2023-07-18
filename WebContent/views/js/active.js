function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
	document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}
function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
	document.body.style.backgroundColor = "white";
}
jQuery(document).ready(function($) {
	tab = $(".tabs h3 a");

	tab.on("click", function(event) {
		event.preventDefault();
		tab.removeClass("active");
		$(this).addClass("active");

		tab_content = $(this).attr("href");
		$('div[id$="tab-content"]').removeClass("active");
		$(tab_content).addClass("active");
	});
});
var number = 1;
do {
	function showPreview(event, number) {
		if (event.target.files.length > 0) {
			let src = URL.createObjectURL(event.target.files[0]);
			let preview = document.getElementById("file-ip-" + number + "-preview");
			preview.src = src;
			preview.style.display = "block";
		}
	}
	function myImgRemove(number) {
		document.getElementById("file-ip-" + number + "-preview").src =
			"https://i.ibb.co/ZVFsg37/default.png";
		document.getElementById("file-ip-" + number).value = null;
	}
	number++;
} while (number < 5);




