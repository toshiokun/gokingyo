$(document).ready ->
	$('#event_category_id').change ->
		val = $(this).val()
		console.log val
		console.log val is 3
		if val isnt 1
			console.log "hoge"
			$('#event_place').hide
			$('#event_start_time_1i').hide
			$('#event_start_time_2i').hide
			$('#event_start_time_3i').hide
			$('#event_start_time_4i').hide
			$('#event_start_time_5i').hide
			$('#event_end_time_1i').hide
			$('#event_end_time_2i').hide
			$('#event_end_time_3i').hide
			$('#event_end_time_4i').hide
			$('#event_end_time_5i').hide
		else
			$('#event_place').show
			$('#event_start_time_1i').show
			$('#event_start_time_2i').show
			$('#event_start_time_3i').show
			$('#event_start_time_4i').show
			$('#event_start_time_5i').show
			$('#event_end_time_1i').show
			$('#event_end_time_2i').show
			$('#event_end_time_3i').show
			$('#event_end_time_4i').show
			$('#event_end_time_5i').show