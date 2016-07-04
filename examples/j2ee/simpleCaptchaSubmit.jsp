<%@page import="java.util.Date"%>
<%@ page import="nl.captcha.Captcha" %>

<% 
// We're doing this in a JSP here, but in your own app you'll want to put
// this logic in your MVC framework of choice.

Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
request.setCharacterEncoding("UTF-8"); // Do this so we can capture non-Latin chars
String answer = request.getParameter("answer");
String info = "";
final long TIMEDIFF = 60*1000;
if(!captcha.isCorrect(answer)) {
	info = "Wrong code!";
} else if(Math.abs(new Date().getTime() - captcha.getTimeStamp().getTime()) > TIMEDIFF ){
	info = "Expired code!";
} else {
	info = "Correct!";
}
%>
	
	
<b><%=info %>!</b>

