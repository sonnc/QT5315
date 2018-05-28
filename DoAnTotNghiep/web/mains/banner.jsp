<%-- 
    Document   : banner
    Created on : Mar 7, 2018, 12:24:02 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<section id="featured" class="bg">
    <!-- start slider -->
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Slider -->
                <div id="main-slider" class="main-slider flexslider">
                    <ul class="slides">
                        <s:iterator value="%{#session.lstBanner}">
                            <li>
                                <img style="max-height: 415px; height: auto; width: 100%" src="<s:property value="photoLink"/>" alt="" />
                                <div class="flex-caption">
                                    <h3 style="font-size: 16px"><s:property value="tieuDe"/></h3>
                                    <a href="detail?id=<s:property value="id"/>" class="btn btn-theme">Xem thêm</a>
                                </div>
                            </li>
                        </s:iterator>
                    </ul>
                </div>
                <!-- end slider -->
            </div>
        </div>
    </div>
</section>
