<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Trang chu</title>

  <!-- Bootstrap core CSS -->
  <link href="<c:url value='/templates/web/vendor/bootstrap/css/bootstrap.min.css' />" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value='/templates/web/css/small-business.css'/>" rel="stylesheet">

</head>

<body>
	<!-- Navigation -->
  <%@ include file="/common/web/header.jsp" %>

  <!-- Page Content -->
  <dec:body/>

  <!-- Footer -->
    <%@ include file="/common/web/footer.jsp" %>

  <!-- Bootstrap core JavaScript -->
  <script src="<c:url value='/templates/web/vendor/jquery/jquery.min.js'/>"></script>
  <script src="<c:url value='/templates/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

</body>

</html>
