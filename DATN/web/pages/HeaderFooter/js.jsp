<%-- 
    Document   : js
    Created on : Jan 26, 2018, 11:05:19 AM
    Author     : sonnc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- js files -->
<!-- js -->
<script src="pages/lib/js/jquery-2.1.4.min.js"></script>
<!-- bootstrap -->
<script src="pages/lib/js/bootstrap.js"></script>
<!-- stats numscroller-js-file -->
<script src="pages/lib/js/numscroller-1.0.js"></script>
<!-- //stats numscroller-js-file -->

<!-- Flexslider-js for-testimonials -->
<script>
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 1,
            animationSpeed: 500,
            autoPlay: false,
            autoPlaySpeed: 1000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 1
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 1
                }
            }
        });

    });
</script>
<script src="pages/lib/js/jquery.flexisel.js"></script>
<!-- //Flexslider-js for-testimonials -->
<!-- smooth scrolling -->
<script src="pages/lib/js/SmoothScroll.min.js"></script>
<script src="pages/lib/js/move-top.js"></script>
<script src="pages/lib/js/easing.js"></script>
<!-- here stars scrolling icon -->
<script>
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear' 
         };
         */

        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>