
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>Survey(Admin)</title>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="../plugins/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="../plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- chartist CSS -->
    
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
    <script src="https://kit.fontawesome.com/eb5ea08954.js" crossorigin="anonymous"></script>
   
</head>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String name=(String)session.getAttribute("user");  
if(name == null)
{

    %>
     <script>
     
          alert("Don't Trespass!!! Login");
        setTimeout(function() {
            document.location = "../../login.html";
        }, 500); // <-- this is the delay in milliseconds
</script>
    <%
}

String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "survey";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from clgsurvey_table where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<body class="fix-header">
	<!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <img src="../../images/SITBBS.png" />
                </div>
                <!-- /Logo -->
                <ul class="nav navbar-top-links navbar-right pull-right">
                    <li>
                        <a class="nav-toggler open-close waves-effect waves-light hidden-md hidden-lg"
                            href="javascript:void(0)"><i class="fa fa-bars"></i></a>
                    </li>
                    <li>

                    </li>
                    <li style="">
                        <i class="fas fa-user"
                            style="color: aliceblue; font-size: 30px; padding-top:15px; margin-left: 10px;"></i>
                        <br>
                        <b class="hidden-xs" style="color: aliceblue; padding-right: 15px;" id="name"><%= name %></b></a>
                      
                    </li>
                    <li>
                    <a style="padding-top:12px;" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Log Out</a>
                    </li>
                </ul>
                <!-- <button>Logout</button> -->
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span
                            class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 70px 0 0;">
                        <a href="Admin.jsp" class="waves-effect"><i class="fa fa-clock-o fa-fw"
                                aria-hidden="true"></i>Dashboard</a>
                    </li>
                    
                    <li>
                        <a href="basic-table.jsp" ><i class="fas fa-eye" aria-hidden="true"></i> View Survey</a>
                    </li>
                    <li>
                        <a href="download.jsp" ><i class="fas fa-download" aria-hidden="true"></i> Download Survey</a>
                    </li>
                    <li>
                        <a href="feedback_tbl.jsp" ><i  class="fas fa-comment-alt"  aria-hidden="true"></i> Feedback</a>
                    </li>
                    

                </ul>

            </div>


        </div>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Survey</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        
                        <ol class="breadcrumb">
                            <li><a href="Admin.jsp">Dashboard</a></li>
                            <li class="active">view Survey</li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                         <h3 class="box-title">Rating</h3>
                         <table width=100%>
                         <tr class="rating">
                         <td >1 -> Not Satisfied</td>
                         <td>2 -> Some What Satisfied</td>
                         <td>3 -> Satisfied</td>
                         <td>4 -> Very Much Satisfied</td>
                         <td>5 -> Extremely Satisfied</td>
                         </tr>
                         </table>
                         </div>
                    </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">Edit Survey Data</h3>


<form method="post" action="update_process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getInt(1) %>">
Id:
<%=resultSet.getString(1) %>
<table>
<tr>
<td>Branch:</td>
<td><input type="text" name="branch" value="<%=resultSet.getString(2) %>"></td>
</tr>
<tr>
<td>Year:</td>
<td><input type="text" name="year" value="<%=resultSet.getString(3) %>"></td>
</tr>
<tr>
<td>Gender:</td>
<td><input type="text" name="gender" value="<%=resultSet.getString(4) %>"></td>
</tr>
<tr>
<td>Cgpa:</td>
<td><input type="text" name="cgpa" value="<%=resultSet.getString(5) %>"></td>
</tr>
<tr>
<td>Ocuupation:</td>
<td><input type="text" name="occu" value="<%=resultSet.getString(6) %>"></td>
</tr>
<tr>
<td>Math:</td>
<td><input type="text" name="math" value="<%=resultSet.getString(8) %>"></td>
</tr>
<tr>
<td>Phy Science:</td>
<td><input type="text" name="phy" value="<%=resultSet.getString(9) %>"></td>
</tr>
<tr>
<td>Humaninties:</td>
<td><input type="text" name="hum" value="<%=resultSet.getString(10) %>"></td>
</tr>
<tr>
<td>Core Engg:</td>
<td><input type="text" name="core" value="<%=resultSet.getString(11) %>"></td>
</tr>
<tr>
<td>Engg courses imparted by :</td>
<td><input type="text" name="engg" value="<%=resultSet.getString(12) %>"></td>
</tr>
<tr>
<td>Classrooms:</td>
<td><input type="text" name="q_class" value="<%=resultSet.getString(13) %>"></td>
</tr>
<tr>
<td>Laboratories:</td>
<td><input type="text" name="lab" value="<%=resultSet.getString(14) %>"></td>
</tr>
<tr>
<td>Computing Facility:</td>
<td><input type="text" name="comp" value="<%=resultSet.getString(15) %>"></td>
</tr>
<tr>
<td>Library:</td>
<td><input type="text" name="lib" value="<%=resultSet.getString(16) %>"></td>
</tr>
<tr>
<td>Other labs:</td>
<td><input type="text" name="olab" value="<%=resultSet.getString(17) %>"></td>
</tr>
<tr>
<td>Admission cell:</td>
<td><input type="text" name="admis" value="<%=resultSet.getString(18) %>"></td>
</tr>
<tr>
<td>Administration:</td>
<td><input type="text" name="admin" value="<%=resultSet.getString(19) %>"></td>
</tr>
<tr>
<td>Examination Cell:</td>
<td><input type="text" name="exam" value="<%=resultSet.getString(20) %>"></td>
</tr>
<tr>
<td>Mentor Services:</td>
<td><input type="text" name="ment" value="<%=resultSet.getString(21) %>"></td>
</tr>
<tr>
<td>Traning & Placement Cell:</td>
<td><input type="text" name="train" value="<%=resultSet.getString(22) %>"></td>
</tr>
<tr>
<td>Hostel Facility:</td>
<td><input type="text" name="host" value="<%=resultSet.getString(23) %>"></td>
</tr>
<tr>
<td>Canteen:</td>
<td><input type="text" name="cant" value="<%=resultSet.getString(24) %>"></td>
</tr>
<tr>
<td>Transport:</td>
<td><input type="text" name="trans" value="<%=resultSet.getString(25) %>"></td>
</tr>
<tr>
<td>Sports:</td>
<td><input type="text" name="sport" value="<%=resultSet.getString(26) %>"></td>
</tr>
<tr>
<td>Security:</td>
<td><input type="text" name="secur" value="<%=resultSet.getString(27) %>"></td>
</tr>
<tr>
<td>Cirrcula for humanites:</td>
<td><input type="text" name="chum" value="<%=resultSet.getString(28) %>"></td>
</tr>
<tr>
<td>General course:</td>
<td><input type="text" name="gen" value="<%=resultSet.getString(29) %>"></td>
</tr>
<tr>
<td>Core Course:</td>
<td><input type="text" name="ccour" value="<%=resultSet.getString(30) %>"></td>
</tr>
<tr>
<td>Elective Course:</td>
<td><input type="text" name="ecour" value="<%=resultSet.getString(31) %>"></td>
</tr>
<tr>
<td>Computer Technology:</td>
<td><input type="text" name="secur" value="<%=resultSet.getString(32) %>"></td>
</tr>
<tr>
<td>Cirricula satisfaction:</td>
<td><input type="text" name="csat" value="<%=resultSet.getString(33) %>"></td>
</tr>
<tr>
<td>confidence of my knowledge:</td>
<td><input type="text" name="confi" value="<%=resultSet.getString(34) %>"></td>
</tr>
<tr>
<td>Oral communication:</td>
<td><input type="text" name="ocomm" value="<%=resultSet.getString(35) %>"></td>
</tr>
<tr>
<td>Project work:</td>
<td><input type="text" name="proj" value="<%=resultSet.getString(36) %>"></td>
</tr>
<tr>
<td>Academic prog by prof:</td>
<td><input type="text" name="aprog" value="<%=resultSet.getString(37) %>"></td>
</tr>
<tr>
<td>Academic prog by me:</td>
<td><input type="text" name="aprogm" value="<%=resultSet.getString(38) %>"></td>
</tr>
<tr>
<td>Skill satisfy:</td>
<td><input type="text" name="ssat" value="<%=resultSet.getString(39) %>"></td>
</tr>
<tr>
<td>Involved with prof:</td>
<td><input type="text" name="iprof" value="<%=resultSet.getString(40) %>"></td>
</tr>
<tr>
<td>Extra activities:</td>
<td><input type="text" name="eact" value="<%=resultSet.getString(41) %>"></td>
</tr>
<tr>
<td>Skills to loc,retrive info:</td>
<td><input type="text" name="sloc" value="<%=resultSet.getString(42) %>"></td>
</tr>
<tr>
<td>Continue study:</td>
<td><input type="text" name="cons" value="<%=resultSet.getString(43) %>"></td>
</tr>
<tr>
<td>experience in clg:</td>
<td><input type="text" name="exp" value="<%=resultSet.getString(44) %>"></td>
</tr>
<tr>
<td>Advice others:</td>
<td><input type="text" name="ado" value="<%=resultSet.getString(45) %>"></td>
</tr>
<tr>
<td>list course:</td>
<td><input type="text" name="list" value="<%=resultSet.getString(46) %>"></td>
</tr>
<tr>
<td>Suggestion:</td>
<td><input type="text" name="sugg" value="<%=resultSet.getString(47) %>"></td>
</tr>
</table>
<br><br>
<input type="submit" value="submit">

<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</form>
</div>
</div>
</div>
</div>
</div>
 <!-- /.container-fluid -->
             <footer class="footer" style="text-align: center;"> All rights reserved | This is made with
            <i class="fas fa-heart" style="padding-top: 10px;"></i>
            by
            Ashutosh,Sachin & Shriya</footer>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
</body>

</html>




