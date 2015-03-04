<%@ page contentType="text/html; charset=UTF-8" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="zh">
<head>
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
	<style type="text/css">
		body { padding-top: 70px; }
	</style>
</head>
<body>
	<!-- 导航栏 -->
	<jsp:include page="menu.jsp" />

    <div class="container">
		<!-- 表单 -->
		<form class="form-horizontal" role="form">
			<input type="hidden" name="op" value="add">
		
			<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">会议室</label>
			    <div class="col-sm-4" >
			      	<select class="form-control" name="roomId">
			      	  <c:forEach items="${rooms}" var="room" varStatus="idx">
					  	<option>${room.name }</option>
					  </c:forEach>
					</select>
			    </div>
			  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">部门</label>
		    <div class="col-sm-4">
		      	<select class="form-control" name="depart" >
				  <c:forEach items="${departs}" var="dp" varStatus="idx">
					<option>${dp.name }</option>
				  </c:forEach>
				</select>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">预订人</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="bookMan" placeholder="姓名">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">开始时间</label>
		    <div class="col-sm-2">
		      <input type="datetime" class="form-control" name="startTime">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">结束时间</label>
		    <div class="col-sm-2">
		      <input type="datetime" class="form-control" name="endTime" >
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">会议主题</label>
		    <div class="col-sm-10">
		    	<textarea class="form-control" rows="3" name="theme" placeholder="会议主题"></textarea>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-primary">提交</button>
		    </div>
		  </div>
		</form>
		
	</div><!-- /.container -->


	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
	<script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

</body>
</html>