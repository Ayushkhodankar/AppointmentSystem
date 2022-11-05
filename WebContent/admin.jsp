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
		HttpSession session1=request.getSession();
        if(session1.getAttribute("uname")==null){   
            out.print("Please login first");  
    		response.sendRedirect("index.jsp");
        }   %>
    <div class="" id="home">
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.html">
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
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                </div>
            </div>
            <!-- row -->
            <div class="row tm-content-row">
               
                <%
String id = request.getParameter("id");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3307/";
String dbName = "doctor";
String userId = "root";
String password = "abc123";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
                <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">Appointment List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Appoinment No.</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">E-Mail</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Time</th>
                                    <th scope="col">Note</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql ="SELECT * FROM appointment";

						resultSet = statement.executeQuery(sql);
							while(resultSet.next()){
						%>
                        
                                <tr>
                                     <th scope="row"><b><%=resultSet.getString("aid") %></b></th> 
                                    <td><%=resultSet.getString("aname") %></td>
                                    <td><b><%=resultSet.getString("aemail") %></b></td>
                                    <td><b><%=resultSet.getString("adate") %></b></td>
                                    <td><b><%=resultSet.getString("atime") %></b></td>
                                    <td><%=resultSet.getString("anote") %></td>
                                    
                                    <td><%=resultSet.getString("status") %></td>
                                    <td><%=resultSet.getString("usname") %></td>
                                    <td><a href="deleteappointment?aid=<%=resultSet.getString("aid") %>"><input type="button" value="Delete">
                                    <a href="update.jsp?aid=<%=resultSet.getString("aid") %>"><input type="button" value="Update"></td>
                             <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>     </tr>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
                
                      <div class="col-12 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                        <h2 class="tm-block-title">User's List</h2>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">User ID.</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Password</th>
                                    <th scope="col">Action</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                             <% try{ 
						connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
						statement=connection.createStatement();
						String sql1 ="SELECT * FROM user";

						resultSet = statement.executeQuery(sql1);
							while(resultSet.next()){
						%>
                                <tr>
                                     <th scope="row"><b><%=resultSet.getString("id") %></b></th> 
                                    <td><%=resultSet.getString("name") %></td>
                                    <td><b><%=resultSet.getString("uname") %></b></td>
                                    <td><b><%=resultSet.getString("passw") %></b></td>
                                    <td><a href="deleteuser?id=<%=resultSet.getString("id") %>"><input type="button" value="Delete"></a></td>
                              
                                
                                   
                                </tr>
                                <% 
						}

					} catch (Exception e) {
						e.printStackTrace();
						}
						%>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2022</b> All rights reserved. 
                    
                    Design: <a rel="nofollow noopener" class="tm-footer-link">Ayush Khodankar</a>
                </p>
            </div>
        </footer>
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