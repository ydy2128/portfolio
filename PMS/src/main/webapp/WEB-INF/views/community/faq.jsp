<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>PMS ::: FAQ 목록</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <!-- Navbar -->
  <%@ include file="../include/navigation.jsp" %>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <%@ include file="../include/sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>FAQ 목록</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/main">홈</a></li>
              <li class="breadcrumb-item active">FAQ 목록</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
         <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                 <button type="button" class="btn btn-secondary float-left" onclick="location.href='write'">작성하기</button>
                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 300px;">
                  	<select class="form-control" id="searchType">
                  		<option value="all">제목+내용</option>
                  		<option value="title">제목</option>
                  		<option value="content">내용</option>
                  	</select>
                    <input type="text" name="table_search" id="keyword" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default" id="btnSearch"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap" id="noticeTable">
                  <thead>
                    <tr>
                   	  <th>제목</th>
                      <th>작성자</th>
                      <th>조회수</th>
                      <th>작성일</th>
                    </tr>
                  </thead>
                  <tbody>
					<c:forEach var="noticeList" items="${noticeList}">
					  <tr id="${noticeList.idx}">
					    <td>${noticeList.title}</td>
					    <td>${noticeList.author}</td>
					    <td>${noticeList.hit}</td>
					    <td>${noticeList.postdate}</td>
					  </tr>
					</c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-right">
                 <c:if test="${pagination.prev}">
                  <li class="page-item"><a class="page-link" href="#" onclick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">&laquo;</a></li></c:if>
                 <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="num">
                 <li class="page-item <c:out value="${pagination.page == num ? 'active' : ''}"/>">
                 <a class="page-link" href="#" onclick="fn_pagination('${num}','${pagination.range}','${pagination.rangeSize}', '<%=request.getParameter("searchType")%>', '<%=request.getParameter("keyword")%>')">${num}</a></li></c:forEach>
                  <c:if test="${pagination.next}"><li class="page-item"><a class="page-link" href="#" onclick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}')">&raquo;</a></li></c:if>
                </ul>
              </div>
            <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.0.5
    </div>
    <strong>Copyright &copy; 2014-2019 <a href="http://adminlte.io">AdminLTE.io</a>.</strong> All rights
    reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
<!-- page script -->]
<script>
$(document).on('click', '#btnSearch', function (e) {
	e.preventDefault();
	var url = "${pageContext.request.contextPath}/community/faq?page=1&range=1";
	url += "&searchType=" + $('#searchType').val() + "&keyword=" + encodeURIComponent($('#keyword').val());
	location.href = url;
});
$('#noticeTable').on('click', 'tr', function() {
	location.href="faqContent?i=" + $(this).attr("id");
});

function fn_prev(page, range, rangeSize) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range -1;
	
	var url = "${pageContext.request.contextPath}/community/faq?page="+page+"&range="+range;
	location.href = url;
}

function fn_pagination(page, range, rangeSize, searchType, keyword) {
	var url = "${pageContext.request.contextPath}/community/faq?page="+page+"&range="+range+"&searchType=" + searchType + "&keyword=" + keyword;
	location.href=url;
}

function fn_next(page, range, rangeSize) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;
	
	var url = "${pageContext.request.contextPath}/community/faq?page="+page+"&range="+range;
	location.href = url;
}
</script>
</body>
</html>
