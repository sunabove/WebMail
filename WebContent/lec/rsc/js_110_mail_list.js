/**
 * 
 */

function loadMailView( e ) {
	console.log("loadMailView");
	
	var mailid = $(e).attr( "mailid" );
	
	console.log("mailid = " + mailid);
	 
	url = "130_mail_view.jsp?mailid=" + mailid ; 

	$.ajax({
		url: url , 
		success: function(result) {
			$("#message").html(result);
		}
	});
}