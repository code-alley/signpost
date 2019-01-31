<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, java.text.*"  %>

<div class="page-footer" style="margin-bottom: 30px;">
	<div class="page-footer-inner">
		<span style="font-size: 14px; font-weight: 600; color: #697882;">
			<%
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy. MM. dd");
				String today = formatter.format(new java.util.Date());
				out.println("Ver " + today);
			%>
		</span>
	</div>
	<div class="scroll-to-top">
		<i class="icon-arrow-up"></i>
	</div>
</div>