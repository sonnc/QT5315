<%-- 
    Document   : home
    Created on : Feb 26, 2018, 9:42:24 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <%@include file="mains/head.jsp" %>
    <body>
        <div id="wrapper">
            <%                session.setAttribute("email", "sinhVien");
                if (session.getAttribute("email").equals("sinhVien")) {
            %>
            <%@include file="mains/sinhVienHeader.jsp" %>
            <%
            } else {
            %>
            <%@include  file="mains/header.jsp"%>
            <%
                }
            %>
            <section id="featured" class="bg">
                <!-- start slider -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Slider -->
                            <div id="main-slider" class="main-slider flexslider">
                                <ul class="slides">
                                    <li>
                                        <img src="pages/libs/img/banner/b1.png" alt="" />
                                        <div class="flex-caption">
                                            <h3>Modern Design</h3>
                                            <p>Duis fermentum auctor ligula ac malesuada. Mauris et metus odio, in pulvinar urna</p>
                                            <a href="#" class="btn btn-theme">Learn More</a>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="pages/libs/img/banner/b2.jpg" alt="" />
                                        <div class="flex-caption">
                                            <h3>Fully Responsive</h3>
                                            <p>Sodales neque vitae justo sollicitudin aliquet sit amet diam curabitur sed fermentum.</p>
                                            <a href="#" class="btn btn-theme">Learn More</a>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="pages/libs/img/banner/b3.png" alt="" />
                                        <div class="flex-caption">
                                            <h3>Clean & Fast</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit donec mer lacinia.</p>
                                            <a href="#" class="btn btn-theme">Learn More</a>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="pages/libs/img/banner/b4.jpg" alt="" />
                                        <div class="flex-caption">
                                            <h3>Clean & Fast</h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit donec mer lacinia.</p>
                                            <a href="#" class="btn btn-theme">Learn More</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- end slider -->
                        </div>
                    </div>
                </div>
            </section>
            <section id="content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <article>
                                <div class="post-image">
                                    <div class="post-heading">
                                        <h3><a href="#">This is an example of standard post format</a></h3>
                                    </div>
                                    <img src="img/dummies/blog/img1.jpg" alt="" class="img-responsive" />
                                </div>
                                <p>
                                    Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                                    ea. Usu ea justo malis, pri quando everti electram ei, ex homero omittam salutatus sed.
                                </p>
                                <div class="bottom-article">
                                    <ul class="meta-post">
                                        <li><i class="fa fa-calendar"></i><a href="#"> Mar 27, 2014</a></li>
                                        <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                        <li><i class="fa fa-folder-open"></i><a href="#"> Blog</a></li>
                                        <li><i class="fa fa-comments"></i><a href="#">4 Comments</a></li>
                                    </ul>
                                    <a href="#" class="readmore pull-right">Continue reading <i class="fa fa-angle-right"></i></a>
                                </div>
                            </article>

                            <article>
                                <div class="post-slider">
                                    <div class="post-heading">
                                        <h3><a href="#">This is an example of slider post format</a></h3>
                                    </div>
                                    <!-- start flexslider -->
                                    <div id="post-slider" class="postslider flexslider">
                                        <ul class="slides">
                                            <li>
                                                <img src="img/dummies/blog/img1.jpg" alt="" />
                                            </li>
                                            <li>
                                                <img src="img/dummies/blog/img2.jpg" alt="" />
                                            </li>
                                            <li>
                                                <img src="img/dummies/blog/img3.jpg" alt="" />
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- end flexslider -->
                                </div>
                                <p>
                                    Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                                    ea. Usu ea justo malis, pri quando everti electram ei, ex homero omittam salutatus sed.
                                </p>
                                <div class="bottom-article">
                                    <ul class="meta-post">
                                        <li><i class="fa fa-calendar"></i><a href="#"> May 17, 2014</a></li>
                                        <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                        <li><i class="fa fa-folder-open"></i><a href="#"> Blog</a></li>
                                        <li><i class="fa fa-comments"></i><a href="#">4 Comments</a></li>
                                    </ul>
                                    <a href="#" class="readmore pull-right">Continue reading <i class="fa fa-angle-right"></i></a>
                                </div>
                            </article>
                            <article>
                                <div class="post-quote">
                                    <div class="post-heading">
                                        <h3><a href="#">Nice example of quote post format below</a></h3>
                                    </div>
                                    <blockquote>
                                        <i class="fa fa-quote-left"></i> Lorem ipsum dolor sit amet, ei quod constituto qui. Summo labores expetendis ad quo, lorem luptatum et vis. No qui vidisse signiferumque...
                                    </blockquote>
                                </div>
                                <div class="bottom-article">
                                    <ul class="meta-post">
                                        <li><i class="fa fa-calendar"></i><a href="#"> May 17, 2014</a></li>
                                        <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                        <li><i class="fa fa-folder-open"></i><a href="#"> Blog</a></li>
                                        <li><i class="fa fa-comments"></i><a href="#">4 Comments</a></li>
                                    </ul>
                                    <a href="#" class="readmore pull-right">Continue reading <i class="fa fa-angle-right"></i></a>
                                </div>
                            </article>
                            <article>
                                <div class="post-video">
                                    <div class="post-heading">
                                        <h3><a href="#">Amazing video post format here</a></h3>
                                    </div>
                                    <div class="video-container">
                                        <iframe src="http://player.vimeo.com/video/30585464?title=0&amp;byline=0">
                                        </iframe>
                                    </div>
                                </div>
                                <p>
                                    Qui ut ceteros comprehensam. Cu eos sale sanctus eligendi, id ius elitr saperet, ocurreret pertinacia pri an. No mei nibh consectetuer, semper laoreet perfecto ad qui, est rebum nulla argumentum ei. Fierent adipisci iracundia est ei, usu timeam persius
                                    ea. Usu ea justo malis, pri quando everti electram ei.
                                </p>
                                <div class="bottom-article">
                                    <ul class="meta-post">
                                        <li><i class="fa fa-calendar"></i><a href="#"> May 17, 2014</a></li>
                                        <li><i class="fa fa-user"></i><a href="#"> Admin</a></li>
                                        <li><i class="fa fa-folder-open"></i><a href="#"> Blog</a></li>
                                        <li><i class="fa fa-comments"></i><a href="#">4 Comments</a></li>
                                    </ul>
                                    <a href="#" class="readmore pull-right">Continue reading <i class="fa fa-angle-right"></i></a>
                                </div>
                            </article>
                            <div id="pagination">
                                <span class="all">Page 1 of 3</span>
                                <span class="current">1</span>
                                <a href="#" class="inactive">2</a>
                                <a href="#" class="inactive">3</a>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="col-lg-4">
                            <aside class="right-sidebar">
                                <div class="widget">
                                    <form role="form">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="s" placeholder="Search..">
                                        </div>
                                    </form>
                                </div>
                                <div class="widget">
                                    <h5 class="widgetheading">Categories</h5>
                                    <ul class="cat">
                                        <li><i class="fa fa-angle-right"></i><a href="#">Web design</a><span> (20)</span></li>
                                        <li><i class="fa fa-angle-right"></i><a href="#">Online business</a><span> (11)</span></li>
                                        <li><i class="fa fa-angle-right"></i><a href="#">Marketing strategy</a><span> (9)</span></li>
                                        <li><i class="fa fa-angle-right"></i><a href="#">Technology</a><span> (12)</span></li>
                                        <li><i class="fa fa-angle-right"></i><a href="#">About finance</a><span> (18)</span></li>
                                    </ul>
                                </div>
                                <div class="widget">
                                    <h5 class="widgetheading">Latest posts</h5>
                                    <ul class="recent">
                                        <li>
                                            <img src="img/dummies/blog/65x65/thumb1.jpg" class="pull-left" alt="" />
                                            <h6><a href="#">Lorem ipsum dolor sit</a></h6>
                                            <p>
                                                Mazim alienum appellantur eu cu ullum officiis pro pri
                                            </p>
                                        </li>
                                        <li>
                                            <a href="#"><img src="img/dummies/blog/65x65/thumb2.jpg" class="pull-left" alt="" /></a>
                                            <h6><a href="#">Maiorum ponderum eum</a></h6>
                                            <p>
                                                Mazim alienum appellantur eu cu ullum officiis pro pri
                                            </p>
                                        </li>
                                        <li>
                                            <a href="#"><img src="img/dummies/blog/65x65/thumb3.jpg" class="pull-left" alt="" /></a>
                                            <h6><a href="#">Et mei iusto dolorum</a></h6>
                                            <p>
                                                Mazim alienum appellantur eu cu ullum officiis pro pri
                                            </p>
                                        </li>
                                    </ul>
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
                                    </ul>
                                </div>
                            </aside>
                        </div>
                    </div>
                </div>
            </section>
        </div>   
            <%@include file="mains/footer.jsp" %>
        <a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
            <%@include file="mains/js.jsp" %>
    </body>

</html>
