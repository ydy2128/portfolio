<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>PMS | FAQ 조회</title>
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
            <h1>FAQ 조회</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/main">홈</a></li>
              <li class="breadcrumb-item active">FAQ 조회</li>
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
                <h3 class="card-title">데이터 영역</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table class="table table-bordered" style="text-align:center;">
                  <thead>                  
                    <tr>
                      <th>제목</th>
                      <td colspan="5">${view.title}</td>
                    </tr>
                    <tr>
                      <th>조회수</th>
                      <td>${view.hit}</td>
                      <th>작성자</th>
                      <td>${view.author}</td>
                      <th>작성일</th>
                      <td>${view.postdate}</td>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td colspan="6">${view.content}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
              	<button class="btn btn-default bg-gradient-secondary" style="left:50%;position:relative;" onclick="click_remove(${view.idx});">&nbsp;삭제&nbsp;</button>
              	<button class="btn btn-default bg-gradient-success" style="left:50%;position:relative;" onclick="click_modify(${view.idx});">&nbsp;수정&nbsp;</button>
                <button class="btn btn-default bg-gradient-primary" style="left:50%;position:relative;" onclick="location.href='faq'">&nbsp;목록&nbsp;</button><br>
              </div>
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
	var url = "${pageContext.request.contextPath}/community/faq";
	url += "?searchType=" + $('#searchType').val() + "&keyword=" + encodeURIComponent($('#keyword').val());
	location.href = url;
});

function click_remove(idx){
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		location.href='remove?i=' + idx;
	}else{   //취소
	    return;
	}
}	
function click_modify(idx){
	if (confirm("정말 수정하시겠습니까??") == true){    //확인
		location.href='write?i=' + idx;
	}else{   //취소
	    return;
	}
}
</script>
</body>
</html>
