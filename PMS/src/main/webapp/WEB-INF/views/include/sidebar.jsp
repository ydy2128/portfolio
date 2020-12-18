<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
      <img src="<%=request.getContextPath()%>/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">PMS</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
          <li class="nav-header">사원</li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/hr/adduser" class="nav-link">
              <i class="nav-icon fas fa-plus"></i>
              <p>추가</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/hr/list" class="nav-link">
              <i class="nav-icon fas fa-search"></i>
              <p>조회</p>
            </a>
          </li>
          
          <li class="nav-header">현황</li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/log/log" class="nav-link">
              <i class="nav-icon fas fa-parking"></i>
              <p>조회</p>
            </a>
          </li>
          
          <li class="nav-header">통계</li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/stat/corp" class="nav-link">
              <i class="nav-icon fas fa-building"></i>
              <p>회사별</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/stat/period" class="nav-link">
              <i class="nav-icon fas fa-calendar"></i>
              <p>기간별</p>
            </a>
          </li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/stat/employee" class="nav-link">
              <i class="nav-icon fas fa-user"></i>
              <p>회원별</p>
            </a>
          </li>
          
          <li class="nav-header">커뮤니티</li>
          <li class="nav-item">
            <a href="<%=request.getContextPath()%>/community/faq?page=1&range=1" class="nav-link">
              <i class="nav-icon fas fa-question-circle"></i>
              <p>FAQ</p>
            </a>
          </li>
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>