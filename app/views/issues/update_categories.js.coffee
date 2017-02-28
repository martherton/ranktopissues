$("#issue_subcategory").empty()
	.append("<%= escape_javascript(render(:partial => @categories)) %>")