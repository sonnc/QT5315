<%-- 
    Document   : head
    Created on : Jan 26, 2018, 11:02:05 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <%
        StringBuffer url = new StringBuffer();
        int port = request.getServerPort();
        if (port < 0) {
            port = 80; // Work around java.net.URL bug
        }
        String scheme = request.getScheme();
        url.append(scheme);
        url.append("://");
        url.append(request.getServerName());
        if (("http".equals(scheme) && (port != 80)) || ("https".equals(scheme) && (port != 443))) {
            url.append(':');
            url.append(port);
        }
        url.append(request.getContextPath());
        String URL = url.toString() + "/";
        session.setAttribute("httpURL", URL);
    %>
    <base href="<%=URL%>">
    <title>Hệ thống đăng ký thực tập trực tuyến - HUST</title>
    <link href="pages/lib/images/logo/LogoBK.jpg" rel="shortcut icon" type="image/x-icon" />
    <!-- meta-tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Soft Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
          Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <!-- //meta-tags -->
    <link href="pages/lib/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="pages/lib/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- font-awesome -->
    <link href="pages/lib/css/font-awesome.css" rel="stylesheet">
    <!-- fonts -->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Maven+Pro:400,500,700,900&amp;subset=latin-ext,vietnamese" rel="stylesheet">
</head>
