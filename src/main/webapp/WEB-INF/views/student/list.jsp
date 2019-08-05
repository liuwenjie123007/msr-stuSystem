<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>

<style type="text/css">
			/*表格样式*/			
	#detail-dialog table {
		width: 90%;
		background: #ccc;
		margin: 10px auto;
		border-collapse: collapse;/*border-collapse:collapse合并内外边距(去除表格单元格默认的2个像素内外边距*/	
	}				
	#detail-dialog th,td {
		height: 25px;
		line-height: 25px;
		text-align: left;
		border: 1px solid #ccc;
	}		
	#detail-dialog th {
		background: #eee;
		font-weight: normal;
	}		
	#detail-dialog tr {
		background: #fff;
	}		
	#detail-dialog tr td:hover {
		background: #BEBEBE;
	}		
	#detail-dialog td a {
		color: #06f;
		text-decoration: none;
	}		
	#detail-dialog td a:hover {
		color: #BEBEBE;
		text-decoration: underline;
	}
</style>

<div class="easyui-layout" data-options="fit:true">
	<!-- Begin of toolbar -->
	<div id="wu-toolbar">
		<div class="wu-toolbar-button">
			<%@include file="../common/menus.jsp"%>
		</div>
			<div class="wu-toolbar-search" <c:if test="${role.id ne 1 }">style="display: none;"</c:if>>
				<label>学生姓名:</label> <input id="search-stuName" name="stuName"
					class="wu-text" style="width: 100px">
				&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <label>班级名称:</label>
				<input id="search-clazzName" class="easyui-combobox"
					data-options="editable: false,valueField:'clazzId',textField:'clazzName',url:'${pageContext.request.contextPath}/admin/clazz/getClazzNameList'"
					style="width: 150px" /> &nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp; <label>授课老师:</label> <input
					id="search-teacherName" class="easyui-combobox"
					data-options="editable: false,valueField:'teacherId',textField:'teacherName',url:'${pageContext.request.contextPath}/admin/teacher/getTeacherNameList'"
					style="width: 100px"> &nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp; <label>企业名称:</label> <input
					id="search-companyName" class="easyui-combobox"
					data-options="editable: false,valueField:'companyId',textField:'companyName',url:'${pageContext.request.contextPath}/admin/company/getCompanyNameList'"
					style="width: 150px;"> &nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<c:if test="${role.id ne 3}">
					<a href="#" id="search-btn"
					class="easyui-linkbutton" iconCls="icon-search">搜索</a>
				</c:if>	
			</div>

	</div>
	<!-- End of toolbar -->
	<table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- Begin of easyui-dialog -->
<!-- 添加新学生窗口 -->
<div id="add-dialog" class="easyui-dialog"
	data-options="closed:true,iconCls:'icon-save'"
	style="width: 420px; padding: 10px;">
	<form id="add-form" method="post">
		<table cellpadding="8">
			<tr>
				<td align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名</td>
				<td><input type="text" name="stuName"
					class="wu-text easyui-validatebox" style="width: 200px;" /></td>
			</tr>
			<tr>
				<td align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td><input class="easyui-combobox" name="stuSex"
					editable="fasle"
					data-options="valueField:'lable',textField:'value',data:[{lable:'1',value:'男'},{lable:'2',value:'女'}]"
					style="width: 210px;" /></td>
				</td>
			</tr>
			<tr>
				<td align="right">出生日期:</td>
				<td><input type="text" name="stuBirthday"
					class="easyui-datebox" type="text" editable="fasle"
					style="width: 210px;" /></td>
			</tr>
			<tr>
				<td align="right">联系电话:</td>
				<td><input type="text" name="stuTel"
					class="wu-text easyui-validatebox" validType="number"
					style="width: 200px;" /></td>
			</tr>
			<tr>
				<td align="right">家庭住址:</td>
				<td><input type="text" name="stuAddress"
					class="wu-text easyui-validatebox" validType="text"
					style="width: 200px;" /></td>
			</tr>
			<!--  <tr>
	                <td align="right">开班时间</td>
	                <td><input name="stuBegintime"   class="easyui-datebox" type="text"  editable="fasle" style="width: 210px;"/></td>
	            </tr>
	            <tr>
	                <td align="right">结课时间</td>
	                <td><input name="stuEndtime"  class="easyui-datebox" type="text"  editable="fasle"  style="width: 210px;"/></td>
	            </tr> -->

			<tr>
				<td align="right">班级名称</td>
				<td><input name="clazzId" class="easyui-combobox"
					data-options="editable: false,valueField:'clazzId',textField:'clazzName',url:'${pageContext.request.contextPath}/admin/clazz/getClazzNameList'"
					style="width: 210px;" /></td>
			</tr>
			<%--   <tr>
	                <td align="right">授课老师</td>
	                <td>
	                	<input name="teacherId"  class="easyui-combobox"  data-options="editable: false,valueField:'teacherId',textField:'teacherName',url:'${pageContext.request.contextPath}/admin/teacher/getTeacherNameList'" style="width: 210px;" />
	                </td>
	            </tr> --%>
			<td align="right">企业名称:</td>
			<td><input id="companyId" name="companyId"
				class="easyui-combobox"
				data-options="editable: false,valueField:'companyId',textField:'companyName',url:'${pageContext.request.contextPath}/admin/company/getCompanyNameList'"
				style="width: 210px;" /></td>
			</tr>

			<tr>
				<td align="right">备注:</td>
				<td><input type="text" name="stuNote"
					class="wu-text easyui-validatebox" placeholder="请输入备注"
					style="width: 200px;" /></td>
			</tr>
		</table>
	</form>
</div>


<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog"
	data-options="closed:true,iconCls:'icon-save'"
	style="width: 650px; padding: 10px;">
	<form id="edit-form" method="post">
		<input type="hidden" name="stuId" id="edit-id">
		<table cellpadding="8">
			<tr>
				<td align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
				<td><input type="text" id="edit-stuName" name="stuName"
					class="wu-text easyui-validatebox" style="width: 200px;" /></td>
				<td align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td><input class="easyui-combobox" id="edit-stuSex"
					name="stuSex" editable="fasle"
					data-options="valueField:'lable',textField:'value',data:[{lable:'1',value:'男'},{lable:'2',value:'女'}]"
					style="width: 210px;" /></td>
			</tr>
			<tr>
				<td align="right">出生生日:</td>
				<td><input id="edit-stuBirthday" name="stuBirthday"
					class="easyui-datebox" type="text" editable="fasle"
					style="width: 210px;" /></td>
				<td align="right">家庭住址:</td>
				<td><input id="edit-stuAddress" name="stuAddress"
					class="wu-text easyui-validatebox" type="text" editable="fasle"
					style="width: 200px;" /></td>
			</tr>
			<tr>
				<td align="right">电话号码:</td>
				<td><input id="edit-stuTel" name="stuTel"
					class="wu-text easyui-validatebox" type="text" editable="fasle"
					style="width: 200px;" validType="number" /></td>
				<td align="right">班级:</td>
				<td><input id="edit-clazzId" <c:if test="${role.id eq 3 }">disabled="disabled"</c:if> name="clazzId"
					class="easyui-combobox"
					data-options="editable: false,valueField:'clazzId',textField:'clazzName',url:'${pageContext.request.contextPath}/admin/clazz/getClazzNameList'"
					style="width: 210px;" /></td>
			</tr>
			<tr>
				<td align="right">入校日期:</td>
				<td><input id="edit-stuBegintime" name="stuBegintime"
					class="easyui-datebox" type="text" editable="fasle"
					style="width: 210px;" <c:if test="${role.id eq 3 }">disabled="disabled"</c:if> /></td>
				<td align="right">离校日期:</td>
				<td><input id="edit-stuEndtime" name="stuEndtime"
					class="easyui-datebox" type="text" editable="fasle"
					style="width: 210px;" <c:if test="${role.id eq 3 }">disabled="disabled"</c:if>/></td>
			</tr>
			<tr>
				<td align="right">老师姓名:</td>
				<td><input id="edit-teacherId" name="teacherId"
					class="easyui-combobox"
					data-options="editable: false,valueField:'teacherId',textField:'teacherName',url:'${pageContext.request.contextPath}/admin/teacher/getTeacherNameList'"
					style="width: 210px;" <c:if test="${role.id eq 3 }">disabled="disabled"</c:if>/></td>
				<td align="right">企业名称:</td>
				<td><input id="edit-companyId" name="companyId"
					class="easyui-combobox"
					data-options="editable: false,valueField:'companyId',textField:'companyName',url:'${pageContext.request.contextPath}/admin/company/getCompanyNameList'"
					style="width: 210px;" <c:if test="${role.id eq 3 }">disabled="disabled"</c:if>/></td>
				</td>
			</tr>
			<tr>
				<td align="right">备注:</td>
				<td><input id="edit-stuNote" name="stuNote"
					class="wu-text easyui-validatebox" type="text" editable="fasle"
					style="width: 200px;" /></td>
			</tr>
		</table>
	</form>
</div>

<!-- 导入数据窗口 -->
<div id="importDialog" style="padding: 10px">
	<form method="post" action="importExcel" enctype="multipart/form-data">
		<input type="file" class="easyui-filebox" name="file" data-options="prompt:'选择一个excel文件..'" style="width: 80%">
		<button class="easyui-linkbutton">导入</button>
	</form>
</div>

<!-- 查看详情 -->
<div id="detail-dialog" class="easyui-dialog"
	data-options="closed:true,iconCls:'icon-save'"
	style="width: 720px; padding: 10px;">
	<form id="detail-form" method="post">
		<table cellpadding="8" border="1" style="width: 680px;">
			<tr>
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
				<td><span id="desc_name"></span></td>
					
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">性&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
				<td><span id="desc_stuSex"></span></td>
				</td>
			</tr>
			<tr>
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">出生日期:</td>
				<td><span id="desc_Birthday"></span></td>	
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">联系电话:</td>
				<td><span id="desc_Tel"></span></td>
			</tr>
			<tr>
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">家庭住址:</td>
				<td><span id="desc_Address"></span></td>	
				
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">班级名称</td>
				<td><span id="desc_Clazz"></span></td>
			</tr>
				 <tr>
	                <td style="background-color: #F0F0F0;font-weight: bold;" align="right">开班时间</td>
	                <td><span id="desc_Begintime"></span></td>
	                <td style="background-color: #F0F0F0;font-weight: bold;" align="right">结课时间</td>
	                <td><span id="desc_Endtime"></span></td>
	            </tr>
	                
			  <tr>
	                <td style="background-color: #F0F0F0;font-weight: bold;" align="right">授课老师</td>
	                <td><span id="desc_teacher"></span></td>
	                
	                <td style="background-color: #F0F0F0;font-weight: bold;" align="right">是否在校</td>
	                <td><span id="desc_status"></span></td>
	            </tr>
			<tr>
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">企业名称:</td>
				<td><span id="desc_company"></span></td>
				<td style="background-color: #F0F0F0;font-weight: bold;" align="right">备注:</td>
				<td><span id="desc_Note"></span></td>
			</tr>
		</table>
	</form>
</div>

<%@include file="../common/footer.jsp"%>

<!-- End of easyui-dialog -->
<script type="text/javascript">
/* $(function(){
	$("#fs1").lqfieldset({
		title:'个人信息',
		collapsible:true,
		collapsed:false,
		checkboxToggle:false
	});
	$("#fs2").lqfieldset({
		title:'考勤信息',
		collapsible:true,
		collapsed:false,
		checkboxToggle:false
	});
}); */


	/**
	*  添加记录
	*/
	function add(){
		var validate = $("#add-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#add-form").serialize();
		$.ajax({
			url:'add',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','添加成功！','info');
					$('#add-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* Name 修改记录
	*/
	function edit(){
		var validate = $("#edit-form").form("validate");
		if(!validate){
			$.messager.alert("消息提醒","请检查你输入的数据!","warning");
			return;
		}
		var data = $("#edit-form").serialize();
		$.ajax({
			url:'edit',
			dataType:'json',
			type:'post',
			data:data,
			success:function(data){
				if(data.type == 'success'){
					$.messager.alert('信息提示','修改成功！','info');
					$('#edit-dialog').dialog('close');
					$('#data-datagrid').datagrid('reload');
				}else{
					$.messager.alert('信息提示',data.msg,'warning');
				}
			}
		});
	}
	
	/**
	* 删除记录
	*/
	function remove(){
		var item = $('#data-datagrid').datagrid('getSelections');
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要删除的数据！','info');
			return;
		}
		$.messager.confirm('信息提示','确定要删除该记录？', function(result){
			if(result){
				var ids = '';
				for(var i=0;i<item.length;i++){
					ids += item[i].stuId + ',';
				}
				$.ajax({
					url:'delete',
					dataType:'json',
					type:'post',
					data:{ids:ids},
					success:function(data){
						if(data.type == 'success'){
							$.messager.alert('信息提示','删除成功！','info');
							$('#data-datagrid').datagrid('reload');
						}else{
							$.messager.alert('信息提示',data.msg,'warning');
						}
					}
				});
			}	
		});
	}
	
	/**
	* Name 打开添加窗口
	*/
	function openAdd(){
		//$('#add-form').form('clear');
		$('#add-dialog').dialog({
			closed: false,
			modal:true,
            title: "添加学生信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: add
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#add-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	//打开添加 窗口之前清空里面的数据
            	$("#add-form input").val('');
            }
        });
	}
	
	/**
	* 打开修改窗口
	*/
	function openEdit(){

		//$('#edit-form').form('clear');
		var item = $('#data-datagrid').datagrid('getSelections');
		//alert(item.length);
		if(item == null || item.length == 0){
			$.messager.alert('信息提示','请选择要修改的数据！','info');
			return;
		}
		if(item.length > 1){
			$.messager.alert('信息提示','请选择一条数据进行修改！','info');
			return;
		}
		item = item[0];
		$('#edit-dialog').dialog({
			closed: false,
			modal:true,
            title: "修改学生信息",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');                    
                }
            }],
            onBeforeOpen:function(){
            	$("#edit-id").val(item.stuId);
            	$("#edit-stuName").val(item.stuName);
            	$("#edit-stuSex").combobox('setValue',item.stuSex);
             	$("#edit-stuBirthday").datebox('setValue',item.stuBirthday);  
            	$("#edit-stuTel").val(item.stuTel);
            	$("#edit-stuAddress").val(item.stuAddress);
            	$("#edit-stuBegintime").datebox('setValue',item.stuBegintime);
            	$("#edit-clazzId").combobox('setValue',item.clazzId);
            	
            	$("#edit-stuEndtime").datebox('setValue',item.stuEndtime); 
            	
            	$("#edit-stuStatus").val(item.stuStatus);
            	$("#edit-companyId").combobox('setValue',item.companyId);
            	$("#edit-teacherId").combobox('setValue',item.teacherId); 
             	$("#edit-stuNote").val(item.stuNote); 
            	 
            	
            }
        });
	}	
	
	
	//搜索按钮监听
	$("#search-btn").click(function(){
		var student = $("#search-form").serialize();
		$('#data-datagrid').datagrid('load',{
			stuName:$("#search-stuName").val(),
			clazzId:$("#search-clazzName").combobox('getValue'),
			teacherId:$("#search-teacherName").combobox('getValue'),
			companyId:$("#search-companyName").combobox('getValue') 			
  		});
	});
	
	
	/** 
	* 载入数据
	*/
	$('#data-datagrid').datagrid({
		url:'list',
		rownumbers:true,
		singleSelect:false,
		pageSize:20,           
		pagination:true,
		multiSort:true,
		fitColumns:true,
		idField:'stuId',
	    treeField:'name',
		fit:true,
		columns:[[
			{ field:'chk',checkbox:true},
			{ field:'stuId',title:'学生编号',width:80,sortable:true},
			{ field:'stuName',title:'学生姓名',width:100,sortable:true},
			{ field:'stuSex',title:'性别',width:50,sortable:true,
				formatter:function(value,row,index){
					if (value == 1) {
			            return '男';
			        }else {
			            return '女';
			        }
				}
			},
			{ field:'stuTel',title:'联系电话',width:125},
			{ field:'stuAddress',title:'地址',width:250},
		    { field:'companyId',title:'企业名称',width:200,
				formatter: function(value,row,index){
					var companyList = $("#search-companyName").combobox("getData");
					for(var i=0;i<companyList.length;i++ ){
						if(row.companyId == companyList[i].companyId)return companyList[i].companyName;
					}
				}	
			},  
			{ field:'stuBegintime',title:'入校时间',width:125,sortable:true},
		 	{ field:'clazzId',title:'班级名称',width:175,sortable:true,
				formatter: function(value,row,index){
					var clazzList = $("#search-clazzName").combobox("getData");
					for(var i=0;i<clazzList.length;i++ ){
						if(row.clazzId == clazzList[i].clazzId)return clazzList[i].clazzName;
					}
				}
			}, 
			{ field:'teacherId',title:'授课老师',width:100,
				formatter: function(value,row,index){
					var teacherList = $("#search-teacherName").combobox("getData");
					for(var i=0;i<teacherList.length;i++ ){
						if(row.teacherId == teacherList[i].teacherId)return teacherList[i].teacherName;
					}
				}
			},{ field:'stuStatus',title:'学生状态',width:75,sortable:true,
				formatter:function(value,row,index){
					if (value == 1) {
			            return '<font color="blue">在校</font>';
			        }else {
			            return '<font color="gray">离校</font>';
			        }
			}}
		]],
		onDblClickRow:function(rowIndex){//鼠标双击事件
	        $("#data-datagrid").datagrid("selectRow",rowIndex);//选中此行
	        var currentRow = $("#data-datagrid").datagrid("getSelected");//获得选中行的信息
	        //弹出框赋值
	        $("#desc_name").html(currentRow.stuName);
	        
	        if(currentRow.stuSex == 1){
	       	 	$("#desc_stuSex").html("男");
	        }else{
	       	 	$("#desc_stuSex").html("女");
	        }
	        
	        $("#desc_Birthday").html(currentRow.stuBirthday);
	        
	        $("#desc_Tel").html(currentRow.stuTel);
	        
	        $("#desc_Address").html(currentRow.stuAddress);
	        
	        var clazzList = $("#search-clazzName").combobox("getData");
			for(var i=0;i<clazzList.length;i++ ){
				if(currentRow.clazzId == clazzList[i].clazzId){
					$("#desc_Clazz").html(clazzList[i].clazzName);
					break;
				}
			}
	        
	        
	        $("#desc_Begintime").html(currentRow.stuBegintime);

	        $("#desc_Endtime").html(currentRow.stuEndtime);
	        
	        
	   
			
			var teacherList = $("#search-teacherName").combobox("getData");
			for(var i=0;i<teacherList.length;i++ ){
				if(currentRow.teacherId == teacherList[i].teacherId){
					$("#desc_teacher").html(teacherList[i].teacherName);
					 break;
				}
			}
	        
	       
	        
	        if(currentRow.stuStatus == 1){
		        $("#desc_status").html("在校");
	        }else{
		        $("#desc_status").html("离校");
	        }
	        
	        
	        var companyList = $("#search-companyName").combobox("getData");
			for(var i=0;i<companyList.length;i++ ){
				if(currentRow.companyId == companyList[i].companyId){
	        		$("#desc_company").html(companyList[i].companyName);
	        		break;
				}
			}
	        
	        $("#desc_Note").html(currentRow.stuNote);
	        
	        /* $("#newsTitle").val(currentRow["trainTitle"]);
	        $("#newsAuthor").val(currentRow["trainAuthor"]);
	        $("#newImg").attr('src','');
	        $("#newImg").attr('src',httpurl+'/'+currentRow["imgPath"]);
	        $("#newsBody").val(currentRow["trainBody"]);
	        $("#imgPath").hide(); */
	        
	        $('#detail-dialog').dialog({//弹出框
	            closed: false,
	            modal: true,
	            title: "查看信息"/* ,
	            buttons: [{
	                text: '确定',
	                iconCls: 'icon-ok',
	                handler:  function () {
	                    $('#detail-dialog').dialog('close');
	                }
	            }] */
	        });
	    },
		onLoadSuccess:function(data){  
			//$('.authority-edit').linkbutton({text:'编辑权限',plain:true,iconCls:'icon-edit'});  
		 }  
	});
	
	
	/*
	导入Excel
	*/
	function importExcel(){
		 $("#importDialog").dialog({
		    	title: "导入学生信息",
		    	width: 450,
		    	height: 150,
		    	modal: true,
		    	collapsible: false,
		    	minimizable: false,
		    	maximizable: false,
		    	draggable: true,
		    	closed: true
		    });
		
		$("#importDialog").dialog("open");
	}
</script>