
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS & JS -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
        <link rel="stylesheet" href="css/style.css" >
        <script src="js/jquery-2.2.3.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%@include file="adminHeader.jsp" %>
        <section id="search-box">
            <div class="container">
                <h2>Search Option</h2>
                <form class="navbar-form navbar-right" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
            </div>
        </section>

        <section id="table">
            <div class="container">

                <div id="carousel-id" class="carousel slide" data-ride="carousel">
                    <div class="panel panel-default">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <h2>Insert Information</h2>
                        </div>
                        <!-- Table -->
                        <table class="table">
                            <s:form action="updateUser"> 

                                <s:textfield readonly="true" name="user.userId" label="User ID" value="%{initUser.userId}"/>
                                <s:textfield name="user.userName" label="User Name" value="%{initUser.userId}"/>
                                <s:textfield name="user.password" label="Password" value="%{initUser.password}"/>
                                <s:textfield name="user.phone" label="Phone" value="%{initUser.phone}"/>
                                <s:textfield name="user.email" label="Email" value="%{initUser.email}"/>
                                <s:textfield name="user.status" label="Status" value="%{initUser.status}"/>
                                <s:textfield name="user.address" label="Address" value="%{initUser.address}"/>
                                <s:textfield name="user.userType" label="User Type" value="%{initUser.userType}"/>
                                <s:textfield name="user.created" label="Created" value="%{initUser.created}"/>                                
                                <s:submit value="Update"/>
                            </s:form>



                        </table>
                    </div>

                </div>
            </div>
        </section>
    </body>
</html>
