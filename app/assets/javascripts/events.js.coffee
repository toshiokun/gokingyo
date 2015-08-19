$(document).ready ->
	$('#event_category_id').change ->
		val = $(this).val()
		console.log val
		if val isnt "1"
			console.log "hoge"
			$('.onlyEvent').hide()
		else
			$('.onlyEvent').show()