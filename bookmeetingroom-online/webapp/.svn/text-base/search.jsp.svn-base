<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
-->

<!DOCTYPE html>
<html lang="zh">
<head>
	<meta name="author" content="Juxdun"/>
	<meta name="copyright" content="Copyright 2014 Ourlinc,Co.,Ltd"/>
	<title>会议室预定</title>
	
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<!-- 新 Bootstrap 核心 CSS 文件 -->
	<link rel="stylesheet"
		href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">

	<!-- 可选的Bootstrap主题文件（一般不用引入） -->
	<link rel="stylesheet"
		href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
		
	<!-- 日历CSS文件 -->
	<link href="css/datepicker.css" rel="stylesheet">	

	<!-- 距离顶部高度 -->
	<style type="text/css">
		body { padding-top: 50px; }
	</style>
	
</head>
<body>

	<!-- 导航栏 -->
	<jsp:include page="menu.jsp" />
    
    <div class="container">
    	<!-- 搜索栏 -->
    	<!-- 表单 -->
		<form class="form-horizontal" role="form">
			<input type="hidden" name="op" value="search">
		
			<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">会议室</label>
			    <div class="col-sm-4" >
			      	<select class="form-control"  name="roomId">
			      	  <option></option>
					  <option>1号会议室</option>
					  <option>2号会议室</option>
					</select>
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
		    <div class="col-sm-4">
		      	<select class="form-control" name="department" >
		      	  <option></option>
				  <option>综合部</option>
				  <option>开发部</option>
				  <option>人事部</option>
				  <option>市场部</option>
				</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">会议日期</label>
		    <div class="col-sm-2">
		      <input type="date" class="form-control" name="date" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">会议主题</label>
		    <div class="col-sm-10">
		    	<input type="text" class="form-control" rows="3" name="meetingTheme" placeholder="会议主题"></input>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary">搜索</button>
		    </div>
		  </div>
		</form>

		<jsp:include page="list.jsp"></jsp:include>
		
	</div><!-- /.container -->


	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- 日历js文件 -->
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/locales/bootstrap-datepicker.zh-CN.js"></script>
	
	<!-- ========================自己写的js============================= -->
	
</body>
</html>