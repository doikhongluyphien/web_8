<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"  media="all" href="<?=TPL_LINK?>/css/uynh_default.css" />
<link rel="stylesheet" type="text/css"  media="all" href="<?=TPL_LINK?>/css/style.css" />
<script type="text/javascript" src="<?=TPL_LINK?>/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/coin-slider.min.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/jquery.carouFredSel-6.2.1.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/custom.js"></script>

<script type="text/javascript" src="<?=TPL_LINK?>/js/front.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/accounting.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/accounting.min.js"></script>
<script type="text/javascript" src="<?=TPL_LINK?>/js/tabber.js"></script>
<title><?=$title?></title>
<script type="text/javascript">
                var baseUrl = '<?=WEB_DOMAIN?>/';
                var update_pizza = function () {
                      if ($("input#matruoc").val()!="" && $("input#matsau").val()!="") {
                          $('#sm').prop('disabled', false);
                      }
                      else {
                          $('#sm').prop('disabled', 'disabled');
                      }
                    };
                    $(update_pizza);

                    function check_login() {
                                    var user= $('#user').val();                              
                                    var pass = $('#pass').val();
                                    var dataString =  'func=check_login'+'&user='+ user+'&pass='+pass;
                                    alert(dataString);
                                    $.ajax
                                    ({
                                        type: "POST",
                                        url: "../lib/check_login.php",
                                        data: dataString,
                                        cache: false,                                                        
                                        success: function(html)
                                        {     
                                                  $('return_check_login').html(html);
                                         }
                                    });
                    }

                    function check_lg(){
                                         var sessionValue = "<?=$Auth['memberid']?>"; 
                                         var product = $('#product').val();
                                         var Type = $('#type').val();
                                         var payType = $('#payType').val();
                                         var mobile = $('#mobile').val();
                                         var game_tk = $('#game_tk').val();
                                         if(sessionValue == ""){
                                                    alert("Bạn phải đăng nhập để mua thẻ");
                                                    window.location.href = '<?=WEB_DOMAIN?>/login.html';
                                                    return false;
                                         }

                                           if(product <= 0){
                                                              alert("Sản phẩm này không tồn tại");
                                                              $('#product').focus();
                                                              return false;
                                                   }
                                                    if(payType != 1){
                                                              alert("Hình thức thanh toán này chưa hoàn thiện! Mời bạn chọn hình thức thanh toán khác");
                                                              $('#payType').focus();
                                                              return false;
                                                   }

                                           if(Type =="mobile"){
                                                            if(mobile == ""){
                                                                     alert("Mời bạn nhập số điện thoại");
                                                                     $('#mobile').focus();
                                                                     return false;
                                                          }
                                              }
                                               if(Type =="game"){
                                                        if(game_tk == ""){
                                                                 alert("Mời bạn nhập tài khoản game");
                                                                 $('#game_tk').focus();
                                                                 return false;
                                                      }
                                         }

                                       /*   if(Type =="both"){
                                                if(mobile == ""){
                                                                         alert("Mời bạn nhập số điện thoại");
                                                                        $('#mobile').focus();
                                                                        return false;
                                                             }

                                                        if(game_tk == ""){
                                                                   alert("Mời bạn nhập tài khoản game");
                                                                 $('#game_tk').focus();
                                                                 return false;
                                                      }
                                         }*/
                                        return true;
                    }

                    function buy_card_code(){
                               var sessionValue = "<?=$Auth['memberid']?>"; 
                               var product_id = $('#product_id').val();
                               var qty = $('#num_card').val();
                               var returncard = $('#getType').val();
                               var paytype =  $('#paytype').val();
                               var dataString = "func=buy_card_code"+"&sessionValue="+sessionValue+"&product_id="+product_id+"&qty="+qty+"&typereturn="+returncard+"&paytype="+paytype;
                                $.ajax({
                                        type: "POST",
                                        url: "../lib/ajaxHandling.php",
                                        data:  dataString,
                                        success: function(html){                             
                                               $('#result').html(html);
                                        },
                                        beforeSend:function(){
                                                     $("#result").html("Đang xử lý...")
                                                }
                             });
                    }



                     function check_add_money_card(){
                                var ajax = new XMLHttpRequest();
                                var sessionValue = "<?=$Auth['memberid']?>"; 
                                var method =document.getElementById("method").value;
                                var loaithe = document.getElementById("loaithe").value;
                                var pincode = document.getElementById("pincode").value;
                                var cardcode = document.getElementById("cardcode").value;
                                var code = document.getElementById("captcha-code").value;
                                ajax.open("GET","../lib/add_money_card.php?Webdesign=addmoneycard"+"&action=add"+"&code="+code+"&loaithe="+loaithe+"&pincode="+pincode+"&cardcode="+cardcode+"&method="+method+"&sessionValue="+sessionValue,true);
                                ajax.send(null);
                                ajax.onreadystatechange = function()
                                {
                                            if(ajax.readyState==4){
                                                        var kq = ajax.responseText;
                                                       document.getElementById('right_content_abc12345').innerHTML =  kq;                                                               
                                            }
                                }
                     }
                      function add_money_card(){
                                var ajax = new XMLHttpRequest();
                                var sessionValue = "<?=$Auth['memberid']?>"; 
                                var code = document.getElementById("vailSMS").value;
                                var loaithe = document.getElementById("idcheck").value;
                                var pincode = document.getElementById("pincheck").value;
                                var cardcode = document.getElementById("thecheck").value;
                                if(sessionValue > 1){
                                ajax.open("GET","../lib/add_money.php?Webdesign=addmoneycard_confirm"+"&action=add_confirm"+"&code="+code+"&loaithe="+loaithe+"&pincode="+pincode+"&cardcode="+cardcode+"&sessionValue="+sessionValue,true);

                               ajax.send(null);
                               ajax.onreadystatechange = function()
                               {
                                           if(ajax.readyState==4){
                                                        var kq = ajax.responseText;
                                                        if(kq == "check_card"){
                                                                     alert("Thong tin the cao khong hop le (da su sung) !");
                                                        }else if(kq=="check_sms"){
                                                                     alert("Mã xác nhận không đúng");
                                                        }else{
                                                                      alert(kq);
                                                                      window.history.back();
                                                        }
                                           }
                               }
                   }else {
                               window.location.replace("/login.html");
                   }
                     }

                     //add money bank
                       function check_add_money_bank(){ 
                               var sessionValue = "<?=$Auth['memberid']?>"; 
                               var nganhang = $('#bank_id').val();
                               var number_money = $('#moneyadd').val();
                               var code = $('#captcha-code').val();
                               var method =  $('#method_add_bank').val();
                               var dataString = "func=add_money_banking"+"&sessionValue="+sessionValue+"&nganhang="+nganhang+"&number_money="+number_money+"&code="+code+"&method="+method;
                                $.ajax({
                                                       type: "POST",
                                                       url: "../lib/ajaxHandling.php",
                                                       data:  dataString,
                                                       success: function(html){                             
                                                              $('#tab2').html(html);
                                                       }
                                            });

                     }

                     // kiểm tra số điện thoại chuyển khoản
                      function checkP(){
                                    var phone_sendto =$("#phone_sendto").val();
                                    var sessionValue = "<?=$Auth['user']?>";
                                   var dataString = "func=check_phone_sendto"+"&phone_sendto="+phone_sendto+"&sessionValue="+sessionValue;                                                 
                                  $.ajax({
                                                    type:"POST" ,
                                                     url:"./lib/ajaxHandling.php",
                                                     data: dataString,
                                                     success: function(html){
                                                                        $('#currentPhone').html(html);
                                                     }
                                      });
                      }


                     function  check_phone(){
                                    var ajax = new XMLHttpRequest();
                                    var phone_number = document.getElementById('phone_number').value;
                                    ajax.open("GET","./lib/check_phone.php?phone_number="+phone_number+"&action=check",true);
                                    ajax.send(null);
                                    ajax.onreadystatechange = function(){
                                    if(ajax.readyState==4){
                                    var kq = ajax.responseText;
                                    if(kq !=""){
                                            document.getElementById('check_phone').innerHTML = kq;
                                            $('#phone_number').focus();  
                                            $('#code').click(function(){
                                                                $('#phone_number').focus(); 
                                              });
                                    }else if(kq==""){
                                            document.getElementById('check_phone').innerHTML = kq; 
                                            $('#code').click(function(){
                                                                $('#code').focus(); 
                                              });
                                    }
                                    }
                                    }
                     }


                    function change_captcha() {
                                    document.getElementById('captcha').src="/extsource/get_captcha.php?rnd=" + Math.random();
                    } 


                    function showNeedLogin(){
                                    var sessionValue = "<?=$Auth['memberid']?>";
                                    if(sessionValue > 1){
                                                        alert("Bạn có chắc chắn muốn mua sản phẩm này không");
                                                        var ajax = new XMLHttpRequest();
                                                        var number = document.getElementById('sluong').value;
                                                        var cardType = document.getElementById('cardType').value;
                                                        var orderType = document.getElementById('orderType').value; 
                                                        var company_code = document.getElementById('company_code').value;
                                                        if(document.getElementById('get_phone')){
                                                            var get_phone = document.getElementById('get_phone').value;                                                             
                                                        }else{
                                                                var  get_phone = "";
                                                        }    
                                                        if(document.getElementById('get_account_game')){
                                                                var get_account_game = document.getElementById('get_account_game').value;
                                                        }else{
                                                                  var get_account_game = "";
                                                        }
                                                        ajax.open("GET","./lib/buycard.php?Webdesign=buycard"+"&sluong="+number+"&cardType="+cardType+"&orderType="+orderType+"&sessionValue="+sessionValue+"&get_phone="+get_phone+"&get_account_game="+get_account_game+"&company_code="+company_code,true);
                                                        ajax.send(null);
                                                        ajax.onreadystatechange = function(){
                                                                    if(ajax.readyState==4){                                                                                        
                                                                                document.getElementById('fLeftcontNews').innerHTML = ajax.responseText;
                                                                    }
                                                        }
                                    }else {
                                                       alert("Bạn phải đăng nhập mới có thể sử dụng được chức năng này.");
                                                        window.location.replace("/login.html");
                                    }
                    }

                    function change_method(){
                                    var ajax = new XMLHttpRequest();
                                    var val = document.getElementById('get_method').value;
                                    var type_catalog = document.getElementById('type_catalog').value;
                                    ajax.open("GET","./lib/get_method.php?get_method="+val+"&type_catalog="+type_catalog,true);
                                    ajax.send(null);
                                    ajax.onreadystatechange = function(){
                                                if(ajax.readyState==4){
                                                            document.getElementById('changeMethod').innerHTML = ajax.responseText;
                                                }
                                    }
                    }


                   function total(){
                                    var product_id= $('#product_id').val();                              
                                    var num_card = $('#num_card').val();
                                    var dataString = 'func=total'+'&product_id='+ product_id+'&num_card='+ num_card;
                                    $.ajax
                                    ({
                                        type: "POST",
                                        url: "../lib/ajaxHandling",
                                        data: dataString,
                                        cache: false,
                                        success: function(html)
                                        { 
                                             $("#box_total").html(html);
                                        } 
                                    });
                     }

                     function checkinput(){
                                           var username=$("#user_name").val();
                                           var password=$("#password").val();
                                           var dataString = "func=checklogin"+"&username="+username+"&pwr="+password;
                                            $.ajax({
                                                       type: "POST",
                                                       url: "./lib/ajaxHandling.php",
                                                       data:  dataString,
                                                       success: function(data){                             
                                                                    if (Array.isArray(data))
                                                                    {
                                                                                     $("#login_form").fadeOut("normal");
                                                                                      $("#shadow").fadeOut();                                                                                                     
                                                                                      return true;
                                                                    } 
                                                                     else
                                                                    {
                                                                          $("#add_err").html(data);
                                                                          return false;
                                                                    }    
                                                       }
                                            });
                                             return false;
                     }

                     function check_reis(){
                                var tem =  $('#check_regis').prop('checked');
                                if(tem == true){
                                        $('#id_of_your_button').prop('disabled', false);
                                 }else{
                                         $('#id_of_your_button').prop('disabled', 'disabled');
                                 }      
                     }

                    $(document).ready(function(){                                               
                                $('img#captcha-refresh').click(function() {  
                                       change_captcha();
                                });

                                $('#stbn').click(function(){
                                        check_add_money_card();
                                 });

                                 $('#phone_number').bind("change",function(){
                                                    check_phone();
                                 });

                                  $('#phone_sendto').bind("change blur",function(){
                                                   checkP();
                                 });

                                  $('#num_card').bind("change",function(){
                                                   total();
                                 });


                                  $('#product_id').change(function(){
                                                var num_card = $('#num_card').val();
                                                if(num_card != ""){
                                                           total();
                                                }
                                 });


                                $("input#matsau").change(update_pizza);

                                $("input#test").hover(function() {
                                             $(this).next("title").animate({opacity: "show", top: "-75", height:"45"}, "slow");
                                              }, function() {
                                                                       $(this).next("title").animate({opacity: "hide", top: "-150", height:"5"}, "slow");
                                });

          });

</script>
                                                
        </head>
        <body>
<div id="wapper">
    <div id="pager">                              
    <div class="header">
        <div class="header-1000">
    <div class="logo"><a href="<?=WEB_DOMAIN?>"><img src="<?=TPL_LINK?>/images/hg_logo_01.png" alt="Ví điện tử Hoàng Gia"></a> </div>
    <div class="right_header">
        <div class="top_menu">
            <ul>
                <li <?=$_GET["Webdesign"]==""?"class='active'":''?> ><a href="<?=WEB_DOMAIN?>"><?=$lang['menu_home']?></a></li>
                <li  <?=$_GET["Webdesign"]=="intro"?"class='active'":""?>><a href="<?=WEB_DOMAIN?>/gioi-thieu.htm"><?=$lang['about']?></a></li>
                <li <?=$_GET["Webdesign"]=="guide"?"class='active'":""?>><a href="<?=WEB_DOMAIN?>/huong-dan.htm"><?=$lang['guide']?></a></li>
                <li <?=$_GET["Webdesign"]=="news"?"class='active'":""?><?=$_GET["Webdesign"]=="newdetail"?"class='active'":""?>><a href="<?=WEB_DOMAIN?>/tin-tuc.html"><?=$lang['new']?></a></li>
                <li <?=$_GET["Webdesign"]=="contact"?"class='active'":""?>><a href="<?=WEB_DOMAIN?>/lien-he.html"><?=$lang['contact']?></a></li>
            </ul>
        </div>
            <div class="bottom_rightheader">
                <div class="serch">
                    <form action="<?=WEB_DOMAIN?>/ket-qua.html" method="post">
                    <input type="text" value="" name="text_search" />
                    <input type="submit" value="" />
                     </form>
                </div>
                <?php 
                        if($Auth["memberid"] > 1){
                ?>
                <div class="login_regiter loginsucess">
                    <p><i>Xin chào</i><a href="<?=WEB_DOMAIN?>/usercp.html"><?=$Auth["fullname"]?></a></p>
                    <p>Mã tài khoản:<span>HG-<?=$Auth["cmt"]?></span></p>
                    <p>Số dư tài khoản:<span><?=number_format(get_money($Auth["memberid"]),0)?> VNĐ</span></p>
                 </div>                                                                                                            
                <div class="out" style="float: right;padding-left: 10px"><a href="<?=WEB_DOMAIN?>/logout.html">Thoát</a></div>
                <?}else{ ?>
                <div class="login_regiter">
                <a  href="<?=WEB_DOMAIN?>/login.html" class="dangnhap font-a" ><?=$lang['login']?></a>
                <a href="<?=WEB_DOMAIN?>/register-phone.html" class="dangki font-a"><?=$lang['register']?></a>
                </div>
                <? } ?>
            </div>
    </div>
    <div class="clear"></div>
    <div class="nav_menu">
    <?nav_menu()?>
    </div>
    </div>
</div><!--header-->                            
                 