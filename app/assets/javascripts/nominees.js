

$('.taskCheckbox').on('click', function() { 
	console.log("checkbox changed status");
	$(this.form).submit(); 
});
