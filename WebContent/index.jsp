<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	Object a = request.getParameter( "a" ) ; 

	try{
		a = Double.parseDouble("" + a);
	}catch(Exception e) {
		a = 0 ; 
	}finally {
		Double d = Double.parseDouble("" + a);
		if( d == d.intValue() ) {
			a = d.intValue();
		}
	}

	Object b = request.getParameter( "b" ) ;
	try{
		b = Double.parseDouble("" + b);
	}catch(Exception e) {
		b = 0 ; 
	}finally {
		Double d = Double.parseDouble("" + b);
		if( d == d.intValue() ) {
			b = d.intValue();
		}
	} 
	
	Object c = "0";
	try { 
		c = Double.parseDouble( "" + a) + Double.parseDouble( "" + b);
	} catch ( Exception e) {
		c = 0 ;
	} finally {
		Double d = Double.parseDouble("" + c);
		if( d == d.intValue() ) {
			c = d.intValue();
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sum of Two Numbers</title>
</head>
<body>

<h1>Sum of Two Numbers</h1>

<form>
	a = <input type="text" name="a" value="<%= a %>" size=3 /> <br/><br/>
	b = <input type="text" name="b" value="<%= b %>" size=3 /> <br/><br/>
	c = <input type="text"          value="<%= c %>" size=3 readonly></input> <br/><br/>
	    <input type="submit" value="Sum" />
</form>

</body>
</html>
