<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bbs.pojo.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />
<title>管理员页面</title>
<link href="${pageContext.request.contextPath}/static/css/main.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/spinner/ui.spinner.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/spinner/jquery.mousewheel.js"></script>

<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/charts/excanvas.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/charts/jquery.sparkline.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/forms/uniform.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.cleditor.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.validationEngine-en.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.validationEngine.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.tagsinput.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/autogrowtextarea.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.maskedinput.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.dualListBox.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/jquery.inputlimiter.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/forms/chosen.jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/wizard/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/wizard/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/wizard/jquery.form.wizard.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/uploader/plupload.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/uploader/plupload.html5.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/uploader/plupload.html4.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/uploader/jquery.plupload.queue.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/tables/datatable.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/tables/tablesort.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/tables/resizable.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.tipsy.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.collapsible.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.prettyPhoto.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.progress.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.timeentry.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.jgrowl.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.breadcrumbs.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/ui/jquery.sourcerer.js"></script>

<script src="${pageContext.request.contextPath}/static/js/plugins/calendar.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/plugins/elfinder.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/custom.js"></script>

<!-- Shared on MafiaShare.net  --><!-- Shared on MafiaShare.net  --></head>

<body>

<!-- Left side content -->
<%@ include file="admin_left_side.jsp" %>

<!-- Right side -->
<div id="rightSide">

	<%@ include file="admin_top_nav.jsp" %>
    
    <!-- Page statistics area -->
    <div class="statsRow">
        <div class="wrapper">
        	<div class="controlB">
            	<ul>
            		<li><a href="${pageContext.request.contextPath}/plate.jsp" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/database.png" alt="" /><span>板块管理</span></a></li>
                	<li><a href="#" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/plus.png" alt="" /><span>Add new session</span></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/hire-me.png" alt="" /><span>Add new user</span></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/statistics.png" alt="" /><span>Check statistics</span></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/comment.png" alt="" /><span>Review comments</span></a></li>
                    <li><a href="#" title=""><img src="${pageContext.request.contextPath}/static/images/icons/control/32/order-149.png" alt="" /><span>Check orders</span></a></li>
                </ul>
                
            </div>
        </div>
    </div>
    <div id="main">
			<div class="section-left">

				<h2>板块信息</h2>
				<table class="table" cellspacing="0">
			    	<tr>
			    		<td class="header" width="200">板块</td>
			    		<td class="header" width="60">操作</td>
			    	</tr>
<%
	ArrayList<Plate> arr = (ArrayList<Plate>)request.getAttribute("Plate");
	if(arr != null){
		for(Plate cat : arr){
%>
			<tr>
				<td><%=cat.getPlateTitle() %></td>
				<td><%=cat.getPlateMessage() %></td>
				<td><a href="${pageContext.request.contextPath}/delete_plate?plateId=">删除</a></td>
			</tr>
	<%
		}
	}
%>	      			    
			    </table>
			</div>
			<div class="section-right">
<%
	if(request.getAttribute("error") != null){
		out.write("<p style='color:red;'>"+request.getAttribute("error")+"</p>");
	}
%>
				<h2>添加板块信息</h2>
				<form action="" method="post">
					<p>板块名称：<input type="text" name="plate"  required="required" /></p>
					<p>板块描述：<input type="text" name="platetext"  required="required" /></p>
					<input type="submit" value=" 保 存 "  />						
			    </form>
			</div>			
			<div class="cf"></div>
		</div> 



</body>
</html>
	<script src="${pageContext.request.contextPath}/static/js/common.js"></script>
    <script>
    $(function(){
    	// 给form标签添加submit事件处理代码
    	$("form").submit(function(){
    		// 使用FormData来包装数据(表示表单数据)
    		var formData = new FormData();
    		// 获取value值
    		var plate = $('[name="plate"]').val();  
    		var platetext = $('[name="platetext"]').val();  
    			// 第一个参数是参数名，第二个是值
    		formData.append("plate",plate);
    		formData.append("platetext",platetext);
    		// 执行异步请求
    		$.ajax("${pageContext.request.contextPath}/add_plate",{ // URL
    			type:"POST", // 请求方式为POST
    			data:formData, // 提交的数据
    			processData:false,// 告诉jQuery要传输formData对象
    			contentType:false,// 告诉jQuery不需要添加请求头对于Content-Type的设置
    			success:function(x){	// 请求成功
    				alert(x.msg);// msg就是Msg类型的属性名
    			},
    			error:function(){		// 请求失败
    				alert("请求失败");
    			},
    			dataType:"json"
    		});
    		// 为了避免刷新页面，返回false(表示不提交)
    		return false;
    	});
    </script>