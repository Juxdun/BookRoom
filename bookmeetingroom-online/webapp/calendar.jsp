<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
    
      <!-- 日历 -->
	  <div id="datepicker"></div>
	  
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
	<!-- ========================自己的js============================= -->
	<!-- 日历js -->
	<script type="text/javascript">
		$('#datepicker').datepicker({
		    weekStart: 0,
		    language: "zh-CN",
		    todayHighlight: true,
			format: "yyyy-mm-dd"
		})
		.on('changeDate', function(e){
			//alert(e.date.getFullYear() +"-"+ (e.date.getMonth()+1) +"-"+ e.date.getDate());
			
			// 取得要提交的参数
		    var my_val = e.date.getFullYear() +"-"+ (e.date.getMonth()+1) +"-"+ e.date.getDate();
		    // 取得要提交页面的URL
		    var action = $(this).attr('href');
		    // 创建Form
		    var form = $('<form></form>');
		    // 设置属性
		    form.attr('action', action);
		    form.attr('method', 'post');
		    // form的target属性决定form在哪个页面提交
		    // _self -> 当前页面 _blank -> 新页面
		    form.attr('target', '_self');
		    // 创建Input
		    var my_input = $('<input type="text" name="selectDate" />');
		    my_input.attr('value', my_val);
		    // 附加到Form
		    form.append(my_input);
		    // 提交表单
		    form.submit();
		    // 注意return false取消链接的默认动作
		    return false;
		});;
	</script>
</body>
</html>