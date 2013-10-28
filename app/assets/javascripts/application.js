//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require tracklog/core_ext

$(function() {
	$("#demo-input-facebook-theme").tokenInput("/passengers.json", {
      theme: "facebook"
  	});

});
