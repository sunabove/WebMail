/**
 * 
 */

function loadMailView() {
	
	console.log("loadMailView");

	$.ajax({
		url: "130_mail_view.jsp", success: function(result) {
			$("#message").html(result);
		}
	});
}