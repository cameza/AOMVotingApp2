//Loads the Notes jumbotron as hidden
	jQuery(window).load (function () { 
      jQuery('#DIV').removeClass('#allNomTable')
  	});
	$('#allNomTable').hide();
	$("#note").hide();
	$('#votingTable').hide();
	$('#rebootInterface').hide();
	$('#accessError').hide();
	$('.bg-danger').hide();
	$('.bg-warning').hide();




var main = $(function () {
	/* For candidate_selection and chairman_selection*/

	//Loads the Notes jumbotron as hidden
	jQuery(window).load (function () { 
      jQuery('#DIV').removeClass('#allNomTable')
  	});
	$('#allNomTable').hide();
	$('#success.jumbotron').show();
	$("#note").hide();
	$('#votingTable').hide();
	$('#rebootInterface').hide();
	$('#accessError').hide();
	$('.bg-danger').hide();
	$('.bg-warning').hide();
	// If clicked in the close the jumbotron is closed
	$("#jumboclose").click(function() {
		$(".jumbotron").hide();
		$("#collapsed").show();
	});

	$("#collapsed").click(function() {
		$("#collapsed").hide();
		$(".jumbotron").show();
	});


	// The nominee documents are in a modal trigger by the js
	$(".modalTrigger").click(function() {
		var id = $(this).data('id');
		alert(id);
		$('#modal_title').append(data.name);
        $('#myModal').attr("data-id", id);
        $("#myModal").modal('show');
	});

	// Submit voting form for fellows_vote view
	$('#vote').click(function() {
		//$('.form-inline').submit();
		alert("Thank you! Your vote was submitted.");
	});

	// Submit approvals form for candidate_selection view
	$('#approve').click(function() {
		$('.form-inline').submit();
		$('#submitModal').modal('show');
		$(this).prop("disabled", true);
		window.location.replace('/success');
	});

	// Submit approvals form for fellows_vote view
	$('#vote').click(function() {
		//$('.form-inline').submit();
		$('#submitModal').modal('show');
		$(this).prop("disabled", true);
		window.location.replace('/success');
	});

	$('#rebootBut').click(function() {
		$(this).prop("disabled", true);
		window.location.replace('/admin/totalRecall');
	})

	$('#year').click(function() {
		$('#allNomTable').show();
	})
});

$(document).ready(main);



