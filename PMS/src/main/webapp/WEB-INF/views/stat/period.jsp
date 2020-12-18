<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>PMS ::: 기간별 통계</title>
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
 
 <!-- DatePicker를 위한 jquery -->
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
            <h1>기간별 통계</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/main">홈</a></li>
              <li class="breadcrumb-item active">기간별 통계</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- <div class="col-md-6"> -->
            <!-- 기간별 CHART -->
            <div class="card card-primary" style="width: 100%;">
              <div class="card-header">
                <h3 class="card-title">기간별 Chart</h3>

                <div class="card-tools">
                  <!-- <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button> -->
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
            <div class="card card-primary" style="width: 100%;">
              <!-- <div class="card-header">
                <h3 class="card-title">기간별 Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div> -->
              <div class="card-body" style="background-color:white;">
                <div class="chart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;">
                     <form>
                     <label for = "PeriodSetting">chart 기간 설정 : </label>&emsp;
                   <input type="radio" name="PeriodSetting" id="year" value="year">년도별&nbsp;
                   <input type="radio" name="PeriodSetting" id="month" value="month">월별&nbsp;
                   <input type="radio" name="PeriodSetting" id="day" value="day">일별&nbsp;
                   <input type="radio" name="PeriodSetting" id="time" value="time">시간별<br>
                <label for = "Period">chart 기간 : </label>&emsp;
                   <select id="Period">
                   <option>기간을 선택하시오.</option>
                   </select>
               </form>
               
               <!-- 달력 출력하는 부분 (제대로 출력 안됨...) -->
               <input type="text" id="datePicker" placeholder="날짜입력" style="display:none;">
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

<!--             DONUT CHART
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Donut Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              /.card-body
            </div>
            /.card

            PIE CHART
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Pie Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              /.card-body
            </div>
            /.card

          </div>
          /.col (LEFT)
          <div class="col-md-6">
            LINE CHART
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Line Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              /.card-body
            </div>
            /.card

            BAR CHART
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              /.card-body
            </div>
            /.card

            STACKED BAR CHART
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Stacked Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i></button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="stackedBarChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              /.card-body
            </div>
            /.card -->

          <!-- </div> -->
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
<%-- <script src="<%=request.getContextPath()%>/resources/plugins/jquery/jquery.min.js"></script> --%>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="<%=request.getContextPath()%>/resources/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=request.getContextPath()%>/resources/dist/js/demo.js"></script>
<!-- page script -->
<!-- <script src="//code.jquery.com/jquery-3.3.1.js"></script> -->
<script>

/* 라디오버튼 선택에 따라 select 값 변경 */
$(document).ready(function () {
   $('#year').click(function () {
      $('#Period').show();
      $('#datePicker').hide();
      let date = new Date();
      $('#Period').empty();
      var periods = [date.getFullYear()+" - "+(date.getFullYear()-9),(date.getFullYear()-10)+" - "+(date.getFullYear()-19)];
      for(var cnt = 0; cnt < periods.length; cnt++){
         var option = $("<option value='"+periods[cnt]+"'>"+periods[cnt]+"</option>");
         $('#Period').append(option);
      }
  	changeChart();
   });
   $('#month').click(function () {
      $('#Period').show();
      $('#datePicker').hide();
      let date = new Date();
      $('#Period').empty();
      let date1 = new Date();
      var periods = new Array();
      date1.setMonth(date1.getMonth() - 9);
      for(var cnt = 0; cnt < 10; cnt++){
         periods[cnt] = date.getFullYear() + "." + ("0"+(date.getMonth()+1)).slice(-2) + " - " + date1.getFullYear() + "." + ("0"+(date1.getMonth()+1)).slice(-2);
         date.setMonth(date.getMonth() - 10);
         date1.setMonth(date1.getMonth() - 10);
      }
      for(var cnt = 0; cnt < periods.length; cnt++){
         var option = $("<option value='"+periods[cnt]+"'>"+periods[cnt]+"</option>");
         $('#Period').append(option);
      }
  	changeChart();
   });
   $('#day').click(function () {
      $('#Period').show();
      $('#datePicker').hide();
      let date = new Date();
      $('#Period').empty();
      let date1 = new Date();
      var periods = new Array();
      date1.setDate(date1.getDate() - 9);
      for(var cnt = 0; cnt < 20; cnt++){
         periods[cnt] = date.getFullYear() + "." + ("0"+(date.getMonth()+1)).slice(-2) + "." + ("0"+date.getDate()).slice(-2) + " - " + date1.getFullYear() + "." + ("0"+(date1.getMonth()+1)).slice(-2) + "." + ("0"+date1.getDate()).slice(-2);
         date.setDate(date.getDate() - 10);
         date1.setDate(date1.getDate() - 10);
      }
      for(var cnt = 0; cnt < periods.length; cnt++){
         var option = $("<option value='"+periods[cnt]+"'>"+periods[cnt]+"</option>");
         $('#Period').append(option);
      }
  	changeChart();
   });
   $('#time').click(function () {
      $('#Period').hide();
      $('#datePicker').show();
   });
   $("#datePicker").on("change", function() {
	   alert('날짜 바뀌었습니다. 날짜 : '+$("#datePicker").val());
	   chartLabels = [];
	   chartData1 = [];
	   chartData2 = [];
	   $.getJSON("<%=request.getContextPath()%>/api/stat/period",
	    		{p:'time', s:$("#datePicker").val(), e:''},
	    		function(data) {
	      $.each(data, function(idx, obj) {
	    	 chartLabels.push(obj.period+"시");
	         chartData1.push(obj.car_in);
	         chartData2.push(obj.car_out);
	      });
	      createChart();
	   });
	});

   /* 달력 출력하기(제대로 출력 안됨...) */
     $("#datePicker").datepicker({
    	 dateFormat: 'yy.mm.dd'
     });
});

var start;
var end;
var periodName;

//select 박스 선택에 따라 '#arechart' json 업데이트
$("#Period").change(function(){
	changeChart();
});

function changeChart() {
	chartLabels = [];
	chartData1 = [];
	chartData2 = [];
	
	periodName = $('input[name=PeriodSetting]:checked').val();
	var strArray = $('#Period').val().split('-');
	var arr0 = strArray[0].split(' ');
	
	start = arr0[0];
	end = strArray[1].substring(1);
	

    $.getJSON("<%=request.getContextPath()%>/api/stat/period",
    		{p:periodName, s:start, e:end},
    		function(data) {
      $.each(data, function(idx, obj) {
    	 chartLabels.push(obj.period);
         chartData1.push(obj.car_in);
         chartData2.push(obj.car_out);
      });
      createChart();
   });
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
	    alert(chartLabels);
		alert(chartData1);
		alert(chartData2);
		
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
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: [
          'Chrome', 
          'IE',
          'FireFox', 
          'Safari', 
          'Opera', 
          'Navigator', 
      ],
      datasets: [
        {
          data: [700,500,400,600,300,100],
          backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
    }
    //Create pie or douhnut chart
    // You can switch between pie and douhnut using the method below.
    var donutChart = new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions      
    })

</script>
</body>
</html>