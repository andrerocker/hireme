//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

$(document).ready(function() {
	$("a.sched").click(function(event) {
		event.preventDefault();
		var container = $(this).parent();
		var cell = $(this).closest("td");
		var day = cell.attr("data-day_id");
		var hour = cell.attr("data-hour");
		
		$.post($(this).attr("href"), { hour: hour, day: day })
			.done(function(response) {
			      container.text("Reservado para "+response.name);
			});
	});	  

	$("a.remove_sched").click(function(event) {
		event.preventDefault();
		var container = $(this).parent();
		var cell = $(this).closest("td");
		var day = cell.attr("data-day_id");
		var hour = cell.attr("data-hour");

		$.ajax({
			url: $(this).attr("href"),
			type: 'DELETE',
			data: { hour: hour, day: day },
		}).done(function(response){
			container.text("Liberado com sucesso!");
		});
	});
})
