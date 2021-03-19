<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="newAPI" value="/api/new"/>
<c:url var ="newURL" value="/quan-tri/bai-viet/danh-sach"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List New</title>
</head>
<body>
	<div class="main-content">
		<form action="<c:url value='/quan-tri/bai-viet/danh-sach'/>" id="formSubmit">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
									chủ</a></li>
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
										<div class="widget-box table-filter">
												<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<c:url var="createNew" value="/quan-tri/bai-viet/chinh-sua"/>
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='${createNew}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onClick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
										</div>
										</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" value=""></label></th>
														<th>Tên Bài Viết</th>
														<th>Mô tả ngắn</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
												<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td>
																<div class="checkbox">
																  <label><input type="checkbox" value="${item.id}" id="checkbox_${item.id}"></label>
																</div>
															</td>
															<td>${item.title}</td>
															<td>${item.shortDescription}</td>
															<td>
																<c:url value="/quan-tri/bai-viet/chinh-sua" var="updateNewURL">
																   <c:param name = "id" value = "${item.id}"/>
																</c:url>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
												</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page" >
											<input type="hidden" value="" id="limit" name="limit" >
<!-- 											 <input type="hidden"  value="" id="sortName" name="sortName"> -->
<!-- 											 <input type="hidden" value="" id="sortBy" name="sortBy" > -->
<!-- 											 <input type="hidden" value="list" id="type" name="type" > -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
	</div>
	<!-- /.main-content -->
	<script type="text/javascript">
		var currentPage = ${model.page}; 
		var totalPages = ${model.totalPage};
		var limit = (!${model.limit}) ? 2 : ${model.limit};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : limit,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page){
						$('#limit').val(10);
						$('#page').val(page);
// 						$('#sortName').val('title');
// 						$('#sortBy').val('desc');
						$('#formSubmit').submit();
					}
				}
			});
		});
		
		function warningBeforeDelete(){
				swal({
				  title: "Xác nhận xóa",
				  text: "Bạn có chắc xóa những bài viết đã chọn không?",
				  type: "warning",
				  showCancelButton: true,
				  confirmButtonClass: "btn-danger",
				  cancelButtonClass: "btn-success",
				  confirmButtonText: "Xác nhận",
				  cancelButtonText: "Hủy bỏ",
				  
				}).then(function(isConfirm) {
				  if (isConfirm) {
					  	//call delete api
						var ids = $('tbody input[type=checkbox]:checked').map(function () {
				            return $(this).val();
				        }).get();
						deleteNew(ids);
				  } else {
					  console.log("do not confirm");
				  }
				});
		}
		function deleteNew(data){
			$.ajax({
				url: '${newAPI}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				//dataType:'json',
				success: function(result){
					 window.location.href = "${newURL}?limit=10&page=1&message=delete_success";
				},
				error: function(error){
					window.location.href = "${newURL}?limit=10&page=1&message=error_system";
				}
			});
		}
	</script>
</body>
</html>