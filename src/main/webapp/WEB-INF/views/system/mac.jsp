<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="../resources/admin/mac/css/style.css">
<script type="text/javascript">
	$(function(){
		$("#btn").click(function(){
			$.ajax({
				url:'mac',
				dataType:'json',
				type:'post',
				data:{"macCode":$("#macCode").val()},
				success:function(data){
					
					if(data.type == 'warning'){
						$.messager.alert('信息提示','激活失败，您输入的MAC值有误，请重新输入！！！','info',function(){
							window.parent.location = 'mac';
						});
						return;
					}
					
					if(data.type == 'success'){
						$.messager.alert('信息提示','恭喜，激活成功！','info',function(){
							window.parent.location = 'login';
						});
						return;
					}
				}
			});
		});
	})
</script>
</head>
<body>



<div class="message warning">
		<div class="inset">
			<div class="login-head">
				<h1 align="center">请激活MAC</h1>
			</div>
				<form id="formMac" name="formMac">
					<ul>
						<li>
							<input type="text" id="macCode" class="text" placeholder="请输入您电脑的MAC码"/><br/>
						</li>
					</ul>
					<div class="submit">
						<input type="button" id="btn" value="点击激活"/>
					</div>
					<div class="submit" style="line-height: 30px">
						
						<font style="font-weight: bold;" color="red">激活步骤</font>
						<br/>
						<p align="left">1、打开开始，选择命令提示符</p>
						<p align="left">2、打开命令提示符窗口</p>
						<p align="left">3、输入ipconfig/all命令，回车</p>
						<p align="left">4、查看返回信息，物理地址即为本机MAC地址</p>
					</div>
				</form>
		</div>
	</div>
</body>
</html>