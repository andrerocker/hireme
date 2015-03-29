//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function() {
	$("a.sched").click(function(event) {
		event.preventDefault();
		var container = $(this).parent();
		var day = $(this).attr("data-day_id");
		var hour = $(this).attr("data-hour");
		
		$.post($(this).attr("href"), { hour: hour, day: day })
			.done(function(response) {
			      container.text("Reservado para "+response.name);
			});
	});	  
})
