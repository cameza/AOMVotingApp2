var main = $(function () {
	/* For candidate_selection and chairman_selection*/

	// classes hidden on load
	jQuery(window).load (function () { 
      jQuery('#DIV').removeClass('#allNomTable')
  	});
  	$(".jumbotron").hide();
	$('#votingTable').hide();
	$('.bg-danger').hide();
	$('.bg-warning').hide();
	$('#allNomTable').hide();

	
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
	
	// For /nominee view. This displays all the nominations when clicked in the 2015
	$('#year').click(function() {
		$('#allNomTable').show();
	})
});

$(document).ready(main);

