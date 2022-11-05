<%@page import="model.Appointment"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Admin - Dashboard HTML Template</title>
     <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css'>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/css-admin/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/css-admin/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/css-admin/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
<%
	/*	HttpSession session1=request.getSession();
        if(session1.getAttribute("uname")==null){   
            out.print("Please login first");  
    		response.sendRedirect("index.jsp");
        }  */ %>
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="#">
                    <h1 class="tm-site-title mb-0">Doctor Dashboard</h1>
                </a>
                <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <span id="boot-icon" class="bi bi-speedometer" style="font-size: 34px; opacity: 1; -webkit-text-stroke-width: 0px; color: rgb(128, 128, 128);"></span>
                                Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                            
                        </li>
                        
                        
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="logoutadmin">
                            <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        <%Class.forName("com.mysql.cj.jdbc.Driver");
    	System.out.println("Driver Registerd");
    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/doctor","root","abc123");
    	System.out.println("Connection successfully");
    	String id = request.getParameter("aid");
    	Appointment a=new Appointment();
    	PreparedStatement ps=con.prepareStatement("SELECT * FROM appointment WHERE aid=?");
    	
		ps.setString(1,id);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
	    	a.setAnote(rs.getString(6));
	    	a.setStatus(rs.getString(7));
	   }%>
        <br>
            <div class="col-12">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12 text-center">
                <h2 class="tm-block-title mb-4">Update Info</h2>
              </div>
            </div>
            <div class="row mt-12">
              <div class="col-12">
                <form action="updateappointment" method="post" class="tm-login-form">
                  <input type="hidden" name="id" value="<%=id %>">
                  <div class="form-group">
                    <label for="note">Note</label>
                    <input name="note" type="text" class="form-control validate" id="note" value="<%=a.getAnote() %>"  required />
                  
                  <div class="form-group">
                    <label for="status">Status</label>
                   <!--  <input name="status" id="status" type="text" class="form-control validate" value="" required /> -->
                    <select class="form-control" id="status" name="status"  >
                                        <option value="<%=a.getStatus() %>" selected>Pending</option>
                                        <option value="Approved">Approved</option>
                                        
                                    </select>
                  </div>
                  
                  <div class="form-group mt-4">
                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Update</button>
                  </div>
                  
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    <script>
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie,
            lineChart;
        barChart, pieChart;
        // DOM is ready
        $(function () {
            drawLineChart(); // Line Chart
            drawBarChart(); // Bar Chart
            drawPieChart(); // Pie Chart

            $(window).resize(function () {
                updateLineChart();
                updateBarChart();                
            });
        })
    </script>
</body>

</html>