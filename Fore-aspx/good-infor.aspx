<%@ Page Language="C#" AutoEventWireup="true" CodeFile="good-infor.aspx.cs" Inherits="good_infor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet - shop</title>
    <link href="../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../Fore-css/layui/css/layui.css" />
    <link rel="stylesheet" href="../Fore-css/good-infor.css" />
    <script type="text/javascript" src="../jquery-3.4.1/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../Fore-css/layui/layui.all.js"></script>
    <script type="text/javascript">
        function enter(o) {
            document.getElementById("show-big").src = o.src;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
         <div class="daohang" style=""> <!--导航栏  开始-->
            <div class="title">
                <p>Sweet - shop</p>
            </div>
            <ul>
                <li class="item" style="margin-right:160px;">
                    <asp:Button ID="btn_back" runat="server" Text="退出" CssClass="hid" style="color:White; margin-right:10px; border: none; background-color: transparent; " onmouseout="this.className='p1'" onmouseover="this.className='p2'" OnClick="btn_back_Click"/>
                </li>
                <li class="item" style="margin-right:10px;">
                    <a href="my/order.aspx">我的</a>
                </li>
                <li class="item" style="margin-right:10px;">
                    <a href="my-buy/carts.aspx">购物车</a>
                </li>      
                <li class="item" style="">
                    <asp:Button ID="btn_register" runat="server" Text="注册" style="color:White; margin-right:10px; border: none; background-color: transparent; " onmouseout="this.className='p1'" onmouseover="this.className='p2'" OnClick="btn_register_Click"/>
                </li>   
                <li class="item" style="">
                    <asp:Button ID="btn_login" runat="server" Text="登录" CssClass="login_class" style="color:White; margin-right:10px; border: none; background-color: transparent; " onmouseout="this.className='p1'" onmouseover="this.className='p2'" OnClick="btn_login_Click"/>
                </li> 
                <li class="item" style="margin-right:10px;">
                    <a href="index.aspx">首页</a>
                </li>    
                <li class="item" style="margin-right:10px;">
                    <asp:Label ID="Label1" runat="server" Text="欢迎您！" CssClass="welcome" ForeColor="White"></asp:Label>
                </li>      
            </ul>  
        </div>
        <!--导航栏  结束-->

        <div style="width:80%; margin:20px auto; /*background-color: Teal;*/">
            <div style="width:100%; height:350px;">
                <!--商品图片-->
                <div style="float:left; width: 430px; height:350px; /*background-color:Lime;*/ font-size:0;">
                    <asp:Repeater ID="Repeater4" runat="server">
                        <ItemTemplate>
                            <img class="showimg" src="../Fore-images/<%# Eval("Gimage1")%>" id="show-big"/>
                            <div class="bigimg">
                                <img class="smallimg" style="margin-left:60px; margin-right:45px;" src="../Fore-images/<%# Eval("Gimage1")%>" onmouseenter="enter(this)" >
                                <img class="smallimg" style="margin-right:45px;" src="../Fore-images/<%# Eval("Gimage2")%>" onmouseenter="enter(this)" >
                                <img class="smallimg" src="../Fore-images/<%# Eval("Gimage3")%>" onmouseenter="enter(this)" >
                            </div>
                        </ItemTemplate>
                    </asp:Repeater> 
                </div>

                <!--购买商品-->
                <asp:Repeater ID="Repeater1" runat="server" >
                    <ItemTemplate>
                        <div class="buy-good">
                            <div style="margin-top:20px; margin-left:20px; font-size:32px; font-family:@Adobe 黑体 Std R;">
                                <asp:Label ID="title" runat="server" Text=""><%# Eval("Gname")%></asp:Label>
                            </div>
                            <div style="float:left; margin-top:10px; width: 400px; height:50px; background-color:#CCCCFF;">
                                <p style="font-size:20px; margin-left:20px; height:auto; float:left;">价格：￥</p>
                                <h3 id="price" style="/*color: #FF3300;*/ margin-left:60px; width:auto; font-size:32px;"><%# Eval("Gprice") %></h3>
                            </div>
                            <div style="float:left; margin-top:10px; width: 400px; height:50px; background-color:#CCCCFF;">
                                <p style="float:left; font-size:20px; margin-left:20px; margin-right:5px; height:auto; float:left;">数量：</p>
                                <a id="sub" href="javascript:void(0);" >-</a>
                                <input type="text" name="num" value="1" id="bookNum" class="num"/>
                                <a id="add" href="javascript:void(0);" >+</a>
                                <%--<p style="float:left; font-size:14px; margin-left:10px; margin-top:8px; height:auto; float:left;">（库存：<%# Eval("Gnum") %>）</p>--%>
                            </div>
                            <script type="text/javascript">
                                $("#bookNum").keypress(function (b) {
                                    var keyCode = b.keyCode ? b.keyCode : b.charCode;
                                    if (keyCode != 0 && (keyCode < 48 || keyCode > 57) && keyCode != 8 && keyCode != 37 && keyCode != 39) {
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }).keyup(function (e) {
                                    var keyCode = e.keyCode ? e.keyCode : e.charCode;
                                    console.log(keyCode);
                                    if (keyCode != 8) {
                                        var numVal = parseInt($("#bookNum").val()) || 0;
                                        numVal = numVal < 1 ? 1 : numVal;
                                        $("#bookNum").val(numVal);
                                    }
                                }).blur(function () {
                                    var numVal = parseInt($("#bookNum").val()) || 0;
                                    numVal = numVal < 1 ? 1 : numVal;
                                    $("#bookNum").val(numVal);
                                });
                                //增加
                                $("#add").click(function () {
                                    var num = parseInt($("#bookNum").val()) || 0;
                                    $("#bookNum").val(num + 1);
                                });
                                //减去
                                $("#sub").click(function () {
                                    var num = parseInt($("#bookNum").val()) || 0;
                                    num = num - 1;
                                    num = num < 1 ? 1 : num;
                                    $("#bookNum").val(num);
                                });
                            </script>
                            
                            <div style="float:left; margin-top:10px; width: 400px; height:50px; background-color:#CCCCFF;">
                                <p style="float:left; font-size:20px; margin-left:20px; margin-right:5px; height:auto; float:left;">运费：</p>
                                <p style="/*color: #FF3300;*/ margin-left:60px; width:auto; font-size:26px;">包邮</p>
                            </div>

                            <div style="float:left; margin-top:10px; width: 400px; height:50px; /*background-color:#CCCCFF;*/">
                                <asp:LinkButton ID="LinkButton_Buy" runat="server" CausesValidation="false" class="layui-btn" style="float:right; width:100px; height:35px; margin-right:60px; border: 0; outline :none; font-weight:bold; color:White; " BackColor="#D83F0C" CommandArgument='<%# Eval("Gname")+","+Eval("Gprice")+","+Eval("Gimage1") %>' OnClick="LinkButton_Buy_Click" >立即购买</asp:LinkButton>
                                <asp:LinkButton ID="LinkButton_Car"  CausesValidation="false" runat="server"  class="layui-btn" style="float:right; width:100px; height:35px; margin-right:80px; border: 0; outline :none; font-weight:bold; color:White; " BackColor="#D83F0C" Height="35px" CommandArgument='<%# Eval("Gname")+","+Eval("Gprice")+","+Eval("Gimage1") %>' OnClick="Add_to_cart_Click" >加入购物车</asp:LinkButton>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <!--商品简介-->
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div style="float:right; width: 350px; height:350px; background-color:#E9E8E7;">
                            <div style="width: 300px; height:120px; margin:35px auto; background-color:white;" >
                                <p style="width:auto; font-size:22px;">推荐物语：</p>
                                <p style="font-size:16px; margin-top:10px;"><%# Eval("Gslogan")%></p>
                            </div>
                            <div style="width: 300px; height:120px; margin:20px auto; background-color:white;" >
                                <p style="width:auto; font-size:22px;">配料：</p>
                                <p style="font-size:16px; margin-top:10px;"><%# Eval("Gdetail")%></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div> 

        
        <!--评论-->
        <div style="width:80%; margin: 30px auto 0 auto; /*background-color:GrayText;*/">
            <p style="font-size:30px; font-family:24px;">评论区</p>
            <div style="width:100%; height:auto; margin-top:10px;">
                <div style="width:100%; height:auto; margin:0 auto; border-bottom:1px solid #000000; /*border-top:1px solid #000000;*/">
                    <asp:Repeater ID="Repeater3" runat="server">
                        <ItemTemplate>
                            <p style="float:left; width:100px; margin-left:80px; line-height:80px; /*background-color:GrayText;*/"><%# Eval("Etime")%></p>
                            <h4 style="float:left;width:500px; margin-left:80px; line-height:80px;/*background-color:GrayText;*/"><%# Eval("Eval")%></h4>
                            <p style="float:left; width:100px; margin-left:300px; line-height:80px;/*background-color:GrayText;*/"><%# Eval("Uname")%></p>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

        <%--底部栏--%>
        <div class="dilan" style="position:fixed; bottom:0px;">
            <ul>
                <li class="dilan_li" style="margin-right:50px;">
                    <a href="#" class="item" style="margin-right:160px;" >相关证明</a>
                </li>
                <li class="dilan_li" style="margin-right:50px;">
                    <a href="#" target="_blank" class="item" style="margin-right:10px;">店铺地址：湛江市赤坎区寸金街道29号</a>
                </li>      
                <li class="dilan_li" style="margin-right:50px;">
                    <a href="#" target="_blank" class="item" style="margin-right:10px;">联系电话：13567806446</a>
                </li>   
                <li class="dilan_li" style="margin-right:50px;">
                    <a href="#" class="item" style="margin-right: 10px;">详情咨询</a>
                </li>          
            </ul>  
        </div>
        <%--底部栏 结束--%>    
    </form>
</body>
</html>
