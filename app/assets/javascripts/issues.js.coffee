# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$(document).on 'change', '#issue_category', (evt) ->
		$.ajax 'update_categories',
		type: 'GET'
		datatype: 'script'
		data: {
			maincat_id: $("#issue_category option:selected").val()
		}
		error: (jqXHR, textstatus, errorThrown) ->
			console.log("AJAX Error: #{textstatus}")
		success: (data, textstatus, jqXHR) ->
			console.log("Dynamic main category select OK!")	