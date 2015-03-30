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

	$('#vote').click(function() {
		$('.form-inline').submit();
		alert("Thank you! Your vote was submitted.");
	})

	$('#votingTable').hide();
	$('.bg-danger').hide();
	$('.bg-warning').hide();

	jQuery(window).load (function () { 
      jQuery('#DIV').removeClass('#allNomTable')
  	});
	$('#allNomTable').hide();

	$('#year').click(function() {
		$('#allNomTable').show();
	})
});

$(document).ready(main);

