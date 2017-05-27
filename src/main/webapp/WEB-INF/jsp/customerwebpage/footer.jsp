    <div class="footer">
        <div class="footer-middle">
            <div class="container">
                <div class="col-md-4 footer-middle-in">
                    <h6 class="footer-text-1">CUSTOMER SERVICES</h6><br>
                    <ul class="in pull-left">
                        <li><a href="404.html">About Us</a></li>
                        <li><a href="contact.html">Contact Us</a></li>
                        <li><a href="terms.html">Terms and Conditions</a></li>
                        <li><a href="contact.html">Our Location</a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>

                <div class="col-md-4 footer-middle-in">
                    <h6 class="footer-text-1">NEWSLETTER</h6><br>
                    <span>Sign up for News Letter</span>
                    <form>
                        <input type="text" value="Enter Mail" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Enter Mail';}">
                        <input type="submit" value="Subscribe">
                    </form>
                </div>

                <div class="col-md-1 footer-middle-in"></div>

                <div class="col-md-3 footer-middle-in">
                    <h6 class="footer-text-1">CONNECT</h6><br>

                    <ul class="icon-social list-inline">
                        <li>
                            <a href="http://facebook.com/" class="btn-social btn-outline icon-social"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li>
                            <a href="http://instagram.com/" class="btn-social btn-outline icon-social"><i class="fa fa-instagram"></i></a>
                        </li>
                        <li>
                            <a href="http://twitter.com/" class="btn-social btn-outline icon-social"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li>
                            <a href="http://google.com/" class="btn-social btn-outline icon-social"><i class="fa fa-google-plus"></i></a>
                        </li>

                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <p class="copyright pull-right">&copy; 2017 All Rights Reserved | Design by  <a href="#" target="_blank">Creative Team</a> </p>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
</body>


<script>
$( document ).ready(function() {
    $('.sub_thumbnail').hover(
        function(){
            $(this).find('.slide_new').slideDown(10); //.fadeIn(250)
        },
        function(){
            $(this).find('.slide_new').slideUp(10); //.fadeOut(205)
        }
    );
});
</script>

<!--   Core JS Files   -->
<script src="/public/customer/assets/js/jquery.min.js" type="text/javascript"></script>
<script src="/public/customer/assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/public/customer/assets/js/material.min.js"></script>

<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
<script src="/public/customer/assets/js/nouislider.min.js" type="text/javascript"></script>

<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
<script src="/public/customer/assets/js/bootstrap-datepicker.js" type="text/javascript"></script>

<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
<script src="/public/customer/assets/js/material-kit.js" type="text/javascript"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="assets/js/simpleCart.min.js"> </script>-->

</html>

