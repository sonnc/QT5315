<%-- 
    Document   : RightSidebar
    Created on : Mar 7, 2018, 12:19:04 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<div class="col-lg-4 col-md-4">
    <aside class="right-sidebar">
        <div class="widget">
            <form role="form">
                <div class="form-group">
                    <input type="text" class="form-control" id="s" placeholder="Tìm kiếm..">
                </div>
            </form>
        </div>
        <div class="widget" >
            <h5 class="widgetheading">CÔNG TY</h5>
            <ul class="recent">
                <marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="2" direction="up" width="100%" align="center">
                    <s:iterator value="%{#session.lstCongTys}">
                        <li style="margin: 0px;">
                            <div class="row" style="margin: 0px;">
                                <div class="col-lg-3 col-md-3">
                                    <img src="<s:property value="logo"/>" class="pull-left" alt="" style="height: 100%; width: 100%"/>
                                </div>
                                <div class="col-lg-9 col-md-9">
                                    <h6><a href="chiTietCongTy?maCongTy=<s:property value="maCongTy"/>"><s:property value="tenCongTy"/></a></h6>
                                    <p><s:property value="diaChi"/></p>
                                </div>
                            </div>
                        </li>
                    </s:iterator>
                </marquee>
            </ul>
        </div>
        <div class="widget" >
            <h5 class="widgetheading">TÀI LIỆU</h5>
            <style>
                #scroll_box {
                    height: 250px;
                    display: auto;
                    margin: 1em 0;
                }
            </style>
            <div id="scroll_box" style="overflow:auto;">
                <ul class="cat">
                    <s:iterator value="%{#session.lstFileAll}">
                        <li><i class="fa fa-angle-right"></i>
                            <a style="color: maroon" href="<s:property value="link"/>">
                                <s:property value="tenFile"/>
                            </a><br/>
                            <span><s:property value="ngayThang"/></span>
                        </li>
                    </s:iterator>
                </ul>
            </div>
        </div>

        <div class="widget">
            <h5 class="widgetheading">Popular tags</h5>
            <ul class="tags">
                <li><a href="#">Web design</a></li>
                <li><a href="#">Trends</a></li>
                <li><a href="#">Technology</a></li>
                <li><a href="#">Internet</a></li>
                <li><a href="#">Tutorial</a></li>
                <li><a href="#">Development</a></li>
                <li><a href="#">Web design</a></li>
                <li><a href="#">Trends</a></li>
                <li><a href="#">Technology</a></li>
                <li><a href="#">Internet</a></li>
                <li><a href="#">Tutorial</a></li>
                <li><a href="#">Development</a></li>
            </ul>
        </div>
    </aside>
</div>