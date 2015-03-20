var main = $(function () {
	$("#collapsed").hide();
	$(".modalTrigger").click(function() {
		var id = $(this).data('id');
		alert(id);
		$('#modal_title').append(data.name);
        $('#myModal').attr("data-id", id);
        $("#myModal").modal('show');
	});
	
	$("#jumboclose").click(function() {
		$(".jumbotron").hide();
		$("#collapsed").show();
	});

	$("#collapsed").click(function() {
		$("#collapsed").hide();
		$(".jumbotron").show();
	});
});

$(document).ready(main);
