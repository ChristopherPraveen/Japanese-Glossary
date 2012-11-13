// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {

	var tmrSearch;

	$("#search").keyup(function() {
		var query = $(this).val();
		if(tmrSearch != null) {
			clearTimeout(tmrSearch);
		}
		if(query != '' && query.length >= 2) {
			//$("#results").load("/glossaries/search?query=" + query);
			tmrSearch = setTimeout(function() {
				$("#loading_img").show();
				$.ajax({
					url: "/glossaries/search?query=" + query
				}).done(function(data) {
					$("#results").html(data);
					highlightResults(query);
					$("#loading_img").hide();
				});
			}, 500);
		}
		else {
			$("#results").html('');
		}
	});

	$(".glossary-menu a").click(function() {
		$(this).siblings().removeClass("selected");
		$(this).addClass("selected");
		$("#loading_img").show();
	});
});

function highlightResults(query) {
	var regExp = new RegExp(query, "gi");
	$("#results .word").each(function() {
		var new_content = $(this).html().replace(regExp, "<i>" + query + "</i>");
		$(this).html(new_content);
	});
}