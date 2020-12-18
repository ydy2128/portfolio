<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>PMS ::: 사원별 통계</title>
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
            <h1>사원별 통계</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/main">홈</a></li>
              <li class="breadcrumb-item active">사원별 통계</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-4" style="width:30%;">


            <!-- PIE CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">파이 Chart</h3>

                <div class="card-tools">
                </div>
              </div>
              <div class="card-body">
                <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- card-body -->
            </div>
            <!-- card -->
            
            <div class="card card-danger" style="width:100%;">
              <div class="card-body">
                회사 이름 : &nbsp;<input type="text" id="txtCorp"><button id="btnSearch">검색</button><br><br>
                <input type="radio" name="inout" value="0" checked="checked">입차 수&nbsp;&nbsp;<input type="radio" name="inout" value="1">출차 수<br>
              </div>
              <!-- card-body -->
            </div>
            <!-- card -->
            </div>
            
            
            <!-- 기간별 CHART -->
            <div class="col-md-8">
            <div class="card card-primary" style="width: 100%;">
              <div class="card-header">
                <h3 class="card-title">기간별 Chart</h3>

                <div class="card-tools">
                </div>
              </div>
              <div class="card-body" style="background-color:white;">
                <div class="chart">
                  <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            <!-- 기간별 Chart -->
            <div class="card card-primary" style="width:100%;">
              <div class="card-body" style="background-color:white;">
                <div class="chart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;">
	                <select id="hrList">
	                <option>우선 회사 이름을 검색하시오.</option>
	                </select></br>
	                <label for = "PeriodSetting">chart 기간 설정 : </label>&emsp;
                   <input type="radio" name="PeriodSetting" id="year" value="year">년도별&nbsp;
                   <input type="radio" name="PeriodSetting" id="month" value="month">이번년 월별&nbsp;
                   <input type="radio" name="PeriodSetting" id="day" value="day">이번달 일별&nbsp;
                   <input type="radio" name="PeriodSetting" id="time" value="time">당일 시간별<br>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  <%@ include file="../include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Add Content Here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<%=request.getContextPath()%>/resources/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
<!-- page script -->
<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<script>
/* 라디오버튼 선택에 따라 select 값 변경 */
$(document).ready(function () {
	//검색 버튼 누른 후의 이벤트. '#pieChart' json 업데이트
	$('#btnSearch').on('click', function() {
		alert($('input[name=inout]:checked').val());
		changeChart2($('input[name=inout]:checked').val());
		$('#hrList').empty();
		var htmlStr = '<option>선택하시오.</option>';
		
		$.getJSON("<%=request.getContextPath()%>/api/hr/list",
	    		function(data) {

	      $.each(data, function(idx, obj) {
	    	  if(obj.corp == $('#txtCorp').val()){
	    		  if(obj.plate.length > 0){
		    		  htmlStr += '<option value="'+
		    		  obj.ssn+
		    		  '">사원번호 : '+
		    		  obj.ssn+
		    		  ',&nbsp;&nbsp;이름 : '+
		    		  obj.name+
		    		  ',&nbsp;&nbsp;번호판 : '+
		    		  obj.plate+
		    		  ',&nbsp;&nbsp;회사 : '+
		    		  obj.corp+
		    		  '</option>';
		    		}
	    		}
	      });

			$('#hrList').append(htmlStr);
		});
	});
	
	$('#hrList').on('change', function() {
		changeChart(this.value, $('input[name=PeriodSetting]:checked').val());
	});
	
	$('input[name=PeriodSetting]').on('change', function() {
		changeChart($('#hrList option:selected').val(), this.value);
	});
	
	$('input[name=inout]').on('change', function(){
		changeChart2($('input[name=inout]:checked').val());
	});
	
	//Datatable이 왜 안되는지 의문... 많은 js 라이브러리 때문에 충돌인가...
	<%-- 
	$('#hrTable tbody').on('click', 'tr', function() {
		changeChart($(this).children().eq(0).text());
	});
	

    //datatable
    $('#hrTable').DataTable({
    	alert('데이터테이블 생성');
	ajax: {
	 url: '<%=request.getContextPath()%>/api/hr/list',
	 dataSrc: ''
	},
  
	columns: [
		{"data": "ssn"},
		{"data": "name"},
		{"data": "tel"},
		{"data": "corp"},
		{"data": "plate"}
	]
	}); --%>
});

function changeChart(ssn, periodName) {
	chartLabels = []; 
	chartData1 = [];
	chartData2 = [];

    $.getJSON("<%=request.getContextPath()%>/api/stat/personal",
    		{s : ssn, p : periodName},
    		function(data) {
      $.each(data, function(idx, obj) {
    	 chartLabels.push(obj.period);
         chartData1.push(obj.car_in);
         chartData2.push(obj.car_out);
      });
      createChart();
   });
}
function changeChart2(inout) {
	chartLabels2 = [];
	chartData = [];
	
	corp = $('#txtCorp').val();
	
	if(inout == 0){
	    $.getJSON("<%=request.getContextPath()%>/api/stat/hr",
	    		{c:corp},
	    		function(data) {
	      $.each(data, function(idx, obj) {
	    	 chartLabels2.push(obj.ssn);
	         chartData.push(obj.car_in);
	      });
	      createChart2();
	   });
	} else if(inout == 1){
	    $.getJSON("<%=request.getContextPath()%>/api/stat/hr",
	    		{c:corp},
	    		function(data) {
	      $.each(data, function(idx, obj) {
	    	 chartLabels2.push(obj.ssn);
	         chartData.push(obj.car_out);
	      });
	      createChart2();
	   });
	}
}

    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------
	function createChart() {
	    // Get context with jQuery - using jQuery's .get() method.
	    var areaChart = null;
	    var areaChartCanvas = $('#areaChart').get(0).getContext('2d');
	    
	    /* $.ajaxSetup({
	  		async: false
		}); */
		
	    var areaChartData = {
	      labels  : chartLabels,
	      datasets: [
	        {
	          label               : '입차 수',
	          backgroundColor     : 'rgba(60,141,188,0.9)',
	          borderColor         : 'rgba(60,141,188,0.8)',
	          pointRadius          : 6,
	          pointColor          : '#3b8bba',
	          pointStrokeColor    : 'rgba(60,141,188,1)',
	          pointHighlightFill  : '#fff',
	          pointHighlightStroke: 'rgba(60,141,188,1)',
	          pointStyle : 'rectRot',
	          pointBorderColor : '#3b8bba', 
	          data                : chartData1
	        },
	        {
	          label               : '출차 수',
	          backgroundColor     : 'rgba(210, 214, 222, 1)',
	          borderColor         : 'rgba(210, 214, 222, 1)',
	          pointRadius         : 6,
	          pointColor          : 'rgba(210, 214, 222, 1)',
	          pointStrokeColor    : '#c1c7d1',
	          pointHighlightFill  : '#fff',
	          pointHighlightStroke: 'rgba(220,220,220,1)',
	          pointStyle : 'rect',
	          pointBorderColor : 'rgba(210, 214, 222, 1)', 
	          data                : chartData2
	        },
	      ]
	    }

	    var areaChartOptions = {
	      maintainAspectRatio : false,
	      responsive : true,
	      legend: {
	        display: false
	      },
	      scales: {
	        xAxes: [{
	          gridLines : {
	            display : false,
	          }
	        }],
	        yAxes: [{
	          gridLines : {
	            display : false,
	          },
	          ticks: {
	        	  beginAtZero: true,
	        	  stepSize: 1
	          }
	        }]
	      }
	    }

	    // This will get the first returned node in the jQuery collection.
	    areaChart       = new Chart(areaChartCanvas, { 
	      type: 'line',
	      data: areaChartData, 
	      options: areaChartOptions
	    })

	}
    
	//-------------
    //- PIE CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    function createChart2() {
		var pieChart = null;
    	var pieChartCanvas = $('#pieChart').get(0).getContext('2d');
        var pieData        = {
        	      labels: chartLabels2,
        	      datasets: [
        	        {
        	          data : chartData,
        	          backgroundColor : ["#0074D9", "#FF4136", "#2ECC40", "#FF851B", "#7FDBFF", "#B10DC9", "#FFDC00", "#001f3f", "#39CCCC", "#01FF70", "#85144b", "#F012BE", "#3D9970", "#111111", "#AAAAAA"],
        	        }
        	      ]
        	    };
        var pieOptions     = {
          maintainAspectRatio : false,
          responsive : true,
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        pieChart = new Chart(pieChartCanvas, {
          type: 'pie',
          data: pieData,
          options: pieOptions      
        })
	}
</script>
</body>
</html>