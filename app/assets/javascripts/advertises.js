function toggle(search_for){
	if (search_for === "hotels") {
		$('#hotels').removeClass('hide');
		$('#shops').addClass('hide');
	}
	else if (search_for === "shops")
	{
		$('#hotels').addClass('hide');
		$('#shops').removeClass('hide');
	}
}
