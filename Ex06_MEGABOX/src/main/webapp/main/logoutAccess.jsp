<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpSession s = request.getSession();
	s.removeAttribute("name");	
	s.removeAttribute("managerCode");	
	s.setMaxInactiveInterval(0);
	response.sendRedirect("main.jsp");
%>