# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'change', '#request_category_id', (evt) ->
	$("#request_subcategory_id").prop("disabled", false);
	$.ajax 'update_subcategories',
	type: 'GET'
	datatype: 'script'
	data: {
		maincat_id: $("#request_category_id option:selected").val()
	}
	error: (jqXHR, textstatus, errorThrown) ->
		console.log("AJAX Error: #{textstatus}")
	success: (data, textstatus, jqXHR) ->
		console.log("Dynamic main category select OK!")

$(document).on 'change', '#request_newsub', (evt) ->
	if $('#request_newsub').prop('checked')
		$("#request_newsubcategory").prop("disabled", false)
		$("#request_subcategory_id").prop("disabled", true)
	else
		$("#request_newsubcategory").prop("disabled", true)
		$("#request_subcategory_id").prop("disabled", false)