// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

var main = function(){
	$('.social-icon').mouseenter(function(){
		$(this).removeClass('greyfilter');
	});

	$('.social-icon').mouseleave(function(){
		$(this).addClass('greyfilter');
	});

	//Show descriptions
	$('#max_temp').mouseenter(function(){
		$(this).addClass('class');
	});

	$('.title').mouseleave(function(){
		$(this).removeClass('over');
	});

	$('.route').click(function(){
		if($(this).children('.description').is(':visible')){
			$('.description').slideUp(500);
		} else {
			$('.description').slideUp(500);
			$(this).children('.description').slideDown(500);
			$(this).children('.description').addClass('open');
		};
	});

	$(function() {
		$("#plants_table th a").live("click", (function() {
			$.getScript(this.href);
			return false;
		});
	});
}


$(document).ready(main)