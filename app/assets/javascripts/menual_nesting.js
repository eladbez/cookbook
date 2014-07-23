//= require_self
//node with "data-target" will get the fields appended
//works only when add_fields is direct decendent of form.
//keep the destroy link and the remove tag in the same node
//remove will work on closest data-rmv.  

$(document).ready(function(){
	$('form').on("click",'.remove_fields',function(){
		$(this).prev('input[type=hidden]').val('1');
    	$(this).closest("[data-rmv]").hide();
    	event.preventDefault();
	});
	$('form').on("click",'.add_fields',function(){
		time = new Date().getTime();
    	regexp = new RegExp($(this).data('id'), 'g');
    	$("[data-target]").append($(this).data('fields').replace(regexp, time));
    	event.preventDefault();
	});
});




