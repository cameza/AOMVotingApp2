jQuery.fn.submitOnCheck = function() {

	this.find('input[type=checkbox]').click(function() {
		alert("hi");
		$(this).parent('form').submit;
	});
	return this;
}

/*$(function() {
	console.log("here");
	$('.com_check_status').submitOnCheck();
});*/

$(function() {
	$('.com_check_status').on("click", function() {
		console.log("checkbox js function called");
		console.log($('.com_check_status'));
		$(this).parent('form').submit;
	});

	return this;
})

var check_clicked = function(id) {
	console.log("checkbox js function called");
	console.log(id);
	$(this).parent('form').submit;
};
