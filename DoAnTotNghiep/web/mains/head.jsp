<%-- 
    Document   : head
    Created on : Feb 26, 2018, 9:39:27 AM
    Author     : sonnc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="Bootstrap 3 template for corporate business" />
    <!-- css -->
    <link href="./pages/libs/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./pages/libs/plugins/flexslider/flexslider.css" rel="stylesheet" media="screen" />
    <link href="./pages/libs/css/cubeportfolio.min.css" rel="stylesheet" />
    <link href="./pages/libs/css/style.css" rel="stylesheet" />

    <!-- Theme skin -->
    <link id="t-colors" href="./pages/libs/skins/default.css" rel="stylesheet" />

    <!-- boxed bg -->
    <link id="bodybg" href="./pages/libs/bodybg/bg1.css" rel="stylesheet" type="text/css" />
</head>