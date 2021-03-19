<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="newAPI" value="/api/new"/>
<c:url var ="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<c:url var ="editNewURL" value="/quan-tri/bai-viet/chinh-sua"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
							chủ</a></li>
					<li class="active">Chỉnh sửa bài viết</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message }">
							<div class="alert alert-${alert }">
								<strong>${message }</strong>
							</div>
						</c:if>
						<form:form id="formSubmitNew" modelAttribute="model">
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
							<div class="col-sm-9">
								<form:input class="form-control" path="title" id="title"/>
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
							<div class="col-sm-9">
								<input type="file" class="form-control" id="thumbnail" name="thumbnail"	value="" />
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
							<div class="col-sm-9">
								 <form:textarea path="shortDescription" rows="" cols="" id="shortDescription" style="width: 945px;height: 240px" />
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label for="categoryCode" class="col-sm-3 control-label no-padding-right">Thể loại:</label>
							<div class="col-sm-9">
							      <form:select path="categoryCode" id="categoryCode" class="form-control">
							      		<form:option value="" label="-- Chọn thể loại --"/>
							      		<form:options items="${categories}"/>
							      </form:select>
							</div>
						</div>
						<br>
						<br>
						<div class="form-group">
							<label class="col-sm-3 control-label no-padding-right">Nội dung</label>
							<div class="col-sm-9">
								<form:textarea path="content" rows="" cols="" id="content" style="width: 945px;height: 240px" />
							</div>
						</div>
						<br>
						<br/>
						<div class="form-group">
							<div class="col-sm-12">
								 <c:if test="${not empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật bài viết" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm bài viết" id="btnAddOrUpdateNew"/>
                                    </c:if>
							</div>
						</div>
						<form:hidden path="id" id="id"/>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$("#btnAddOrUpdateNew").click( function(e){
			e.preventDefault();
			var data = {};
			var formData = $("#formSubmitNew").serializeArray();
			$.each(formData, function( i, v){
				data[""+v.name+""] = v.value;
			});
			var id = $('#id').val();
			if (id == ""){
				delete data["id"];
				addNew(data);
			} else {
				updateNew(data);
			}
		});
	function addNew(data){
		$.ajax({
			url: '${newAPI}',
			type: 'POST',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType:'json',
			success: function(result){
				window.location.href = "${editNewURL}?id="+result.id+"&message=insert_success";
			},
			error: function(error){
				window.location.href = "${newURL}?page=1&limit=10&message=error_system";
			}
		});
	}
	
	function updateNew(data){
		$.ajax({
			url: '${newAPI}',
			type: 'PUT',
			contentType: 'application/json',
			data: JSON.stringify(data),
			dataType:'json',
			success: function(result){
				window.location.href = "${editNewURL}?id="+result.id+"&message=update_success";
			},
			error: function(error){
				window.location.href = "${editNewURL}?id="+data["id"]+"&message=error_system";
			}
		});
	}
</script>
</body>
</html>