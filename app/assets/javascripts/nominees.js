var main = $(function () {
	$(".jumbotron").hide();
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

	$('.voteRadioBut').click(function() {
			alert("changed");
			var value = $(this)[0]["value"];
			console.log(value);
	});

	$('.btn').click(function() {
		$('.form-inline').submit();
		alert("Thank you! Your vote was submitted.");
	})
});

$(document).ready(main);
