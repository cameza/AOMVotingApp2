//Loads the Notes jumbotron as hidden
	jQuery(window).load (function () { 
      jQuery('#DIV').removeClass('#allNomTable')
  	});
	$('#allNomTable').hide();
	$("#note").hide();
	//$('#votingTable').hide();
	$('#rebootInterface').hide();
	$('#accessError').hide();
	//$('.bg-danger').hide();
	//$('.bg-warning').hide();




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
	$('#voted').hide();
	$('#invalid').hide();
	$('#rebootInterface').hide();
	$('#accessError').hide();
	//$('.bg-danger').hide();
	//$('.bg-warning').hide();
	
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


	// Submit approvals form for candidate_selection view
	$('#approve').click(function() {
			alert("WHY one?????");
		$('.form-inline').submit();
		$('#submitModal').modal('show');
		$(this).prop("disabled", true);
		window.location.replace('/successing');
	});

	// Submit approvals form for fellows_vote view and redirect to success page
	$('#vote_submitted').hide();
	$('#submit_votes_redirect').click(function() {
		var form_length = $('.form-inline').length; //# of votes that are being submitted
		var count = parseInt($('li').html()); //# of candidates in the form
		console.log(form_length); //Debugging purposes
		console.log(count); //Debugging purposes
		//If the number of forms being submitted is the same that the number of candidates in the form then we can proceed with the vote submission
		//Else we should notify something is wrong and try submitting again
		//As of 5/30/16 haven't seen the app failed locally
		if (form_length == count){
			$('.form-inline').submit();
			$('#submitModal').modal('show');
			//Deactivate voting option
			$(this).prop("disabled", true);
			alert("Thank you, your submission has been recorded");
			// Hide voting table and all messages
			$('#voted').hide();
			$('#invalid').hide();
			$('#votingTable').hide();
			//Display success message
			$('#vote_submitted').show();
			//Scroll to the top of the page
			$('html, body').animate({ scrollTop: 0 }, 'fast');
			//window.location.replace('/success'); 
		}
		else {
			alert("An error has occurred. Please submit your votes again");
		}
	});

	// Submit voting form for fellows_vote view
		/*	5-28-16: Update: This block is working properly will try the block above which has the redirection
	$('#submit_votes').click(function() {
		$('.form-inline').submit();
		alert("Fuck Thank you! Your vote was submitted.");
	}); //5-28-15 -> Disabled this block as I don't understand why I have 2 blocks for the #vote action
	*/

	//Reboot app
	$('#rebootBut').click(function() {
		$(this).prop("disabled", true);
		window.location.replace('/admin/totalRecall');
	})

	$('#year').click(function() {
		$('#allNomTable').show();
	})
});

$(document).ready(main);



