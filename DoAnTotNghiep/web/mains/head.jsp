<%-- 
    Document   : head
    Created on : Feb 26, 2018, 9:39:27 AM
    Author     : sonnc
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- css -->
<link href="./pages/libs/css/bootstrap.min.css" rel="stylesheet" />
<link href="./pages/libs/plugins/flexslider/flexslider.css" rel="stylesheet" media="screen" />
<link href="./pages/libs/css/cubeportfolio.min.css" rel="stylesheet" />
<link href="./pages/libs/css/style.css" rel="stylesheet" />
<link href="./pages/libs/css/load.css" rel="stylesheet" />

<!-- Theme skin -->
<link id="t-colors" href="./pages/libs/skins/default.css" rel="stylesheet" />

<!-- boxed bg -->
<link id="bodybg" href="./pages/libs/bodybg/bg1.css" rel="stylesheet" type="text/css" />
<link href="./pages/libs/img/logoEn.png" rel="shortcut icon" type="image/x-icon" />
<script src="./pages/libs/js/sweetalert.min.js"></script>
<script src="./pages/libs/js/jquery.min.js"></script>
<script src="./pages/libs/js/editer.js"></script> 
<script type="text/javascript">
    bkLib.onDomLoaded(function () {
        nicEditors.allTextAreas();
        $('.nicEdit-panelContain').parent().width('100%');
        $('.nicEdit-panelContain').parent().next().width('100%');
        $('.nicEdit-main').width('100%');
        $('.nicEdit-main').height('100px');
        $('textarea[type=submit]').bind('click', function () {
            for (var i = 0; i < nicEditor.nicInstances.length; i++) {
                nicEditor.nicInstances[i].saveContent();
            }
        });
    });
</script>
<script>
    setTimeout(function () {
        $('body').removeClass('preloading');
        $('#preload').delay(1000).fadeOut('fast');
    }, 1000);
</script>

<script type="text/javascript">
    function Pager(tableName, itemsPerPage) {
        this.tableName = tableName;
        this.itemsPerPage = itemsPerPage;
        this.currentPage = 1;
        this.pages = 0;
        this.inited = false;

        this.showRecords = function (from, to) {
            var rows = document.getElementById(tableName).rows;
            // i starts from 1 to skip table header row
            for (var i = 1; i < rows.length; i++) {
                if (i < from || i > to)
                    rows[i].style.display = 'none';
                else
                    rows[i].style.display = '';
            }
        }

        this.showPage = function (pageNumber) {
            if (!this.inited) {
                alert("not inited");
                return;
            }
            var oldPageAnchor = document.getElementById('pg' + this.currentPage);
            oldPageAnchor.className = 'pg-normal';

            this.currentPage = pageNumber;
            var newPageAnchor = document.getElementById('pg' + this.currentPage);
            newPageAnchor.className = 'pg-selected';

            var from = (pageNumber - 1) * itemsPerPage + 1;
            var to = from + itemsPerPage - 1;
            this.showRecords(from, to);
        }

        this.prev = function () {
            if (this.currentPage > 1)
                this.showPage(this.currentPage - 1);
        }

        this.next = function () {
            if (this.currentPage < this.pages) {
                this.showPage(this.currentPage + 1);
            }
        }

        this.init = function () {
            var rows = document.getElementById(tableName).rows;
            var records = (rows.length - 1);
            this.pages = Math.ceil(records / itemsPerPage);
            this.inited = true;
        }
        this.showPageNav = function (pagerName, positionId) {
            if (!this.inited) {
                alert("not inited");
                return;
            }
            var element = document.getElementById(positionId);

            var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> &#171 TRƯỚC </span> | ';
            for (var page = 1; page <= this.pages; page++)
                pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> | ';
            pagerHtml += '<span onclick="' + pagerName + '.next();" class="pg-normal"> SAU &#187;</span>';

            element.innerHTML = pagerHtml;
        }
    }
</script>
<style>
    .pg-normal {
        color: red;
        font-weight: normal;
        text-decoration: none;  
        cursor: pointer;  
    }

    .pg-selected {
        color: black;
        font-weight: bold;     
        text-decoration: underline;
        cursor: pointer;
    }
    .error{
        color: red;
        text-orientation: initial;
    }
</style>