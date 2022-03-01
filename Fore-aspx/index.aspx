<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet - shop</title>
    <link href="../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../Fore-css/layui/css/layui.css" />
    <script type="text/javascript" src="../jquery-3.4.1/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../Fore-css/layui/layui.all.js"></script>
    <script type="text/javascript">
        function getLoginName() {
            if (Session["Uno"] != null) {
                var oA = document.getElementById('login');
                oA.className = 'item2';
            }
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
        <div class="daohang2">
            <div class="logo">
                <p>Sweet - shop</p>
            </div>
            <ul>
                <li>
                    <a href="index.aspx" class="item2">首页</a>
                </li>
                <li>
                    <a href="western.aspx" class="item2">西式甜点</a>
                </li>      
                <li>
                    <a href="chinese.aspx" class="item2">中式甜点</a>
                </li>          
            </ul>
            <div class="sousuokuang">   
                <asp:TextBox ID="sousuo_text" runat="server" CssClass="sousuo"></asp:TextBox>
                <div style="float:left; margin-left:20px; width: 25px; ">
                    <asp:Button ID="sousuo" runat="server" Text="搜索" onclick="Sousuo_Click" style="width:40px; height:23px; background-color:white; border:0; outline:none;" onmouseout="this.className='p3'" onmouseover="this.className='p4'"/>
                </div>
            </div>
        </div>
        <!--导航栏  结束-->

        <!--轮播-->
        <div style="width:1200px; margin:0 auto;">
            <div class="layui-carousel" id="test1">
                <div carousel-item>
                    <div><img style="float:left; width:50%;" src="../Fore-images/滚轮/Fruitcake1.jpg" alt=""/><img style="float:right; width:50%;" src="../Fore-images/滚轮/Fruitcake2.jpg" alt=""/></div>
                    <div><img style="float:left; width:50%;" src="../Fore-images/滚轮/Marcadragon1.jpg" alt=""/><img style="float:right; width:50%;" src="../Fore-images/滚轮/Chinesedateyamcake1.jpg" alt=""/></div>
                    <div><img style="float:left; width:50%;" src="../Fore-images/滚轮/Cheesecake1.jpg" alt=""/><img style="float:right; width:50%;" src="../Fore-images/滚轮/Icecream1.jpg" alt=""/></div>
                    <div><img style="float:left; width:50%;" src="../Fore-images/滚轮/Greenbeancake1.jpg" alt=""/><img style="float:right; width:50%;" src="../Fore-images/滚轮/Beanjelly1.jpg" alt=""/></div>
                    <div><img style="float:left; width:50%;" src="../Fore-images/滚轮/Puff1.jpg" alt=""/><img style="float:right; width:50%;" src="../Fore-images/滚轮/Pudding1.jpg" alt=""/></div>
                </div>
            </div>
            <script type="text/javascript" src="../Fore-js/index.js"></script>
        </div>
        <!--轮播  结束-->

        <!--商品列表-->
        <div style="width:1200px; margin:20px auto; background-color: #EAECEA;">
            <div style="width:100%; height:30px; margin:5px auto; /*border:1px solid #000;*/ text-align:center;">
               <i class="layui-icon layui-icon-release" style="float:left; font-size: 30px; color: #1E9FFF;"></i>  
               <h3 style="float:left; margin-left:10px;">系列一</h3>
            </div>
            <div style="width:100%; height:220px; margin:5px auto; /*border:1px solid #000; */">
                <asp:Repeater ID="Repeater1" runat="server" >
                    <ItemTemplate>
                        <div class="produce"  style="border: 1px solid #000;">
                            <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("Gno")%>' CausesValidation="false" runat="server" CssClass="SSimg" OnClick="LinkButtonDelete1_Click">
                                <img src="../Fore-images/<%# Eval("Gimage1")%>" alt="" style="height:150px; width: 200px;"/>
                            </asp:LinkButton>
                            <div  class="Gtitle">
                                <p style="float:left; margin-top:5px; margin-left:5px; width:120px;"><%# Eval("Gname")%></p>
                                <asp:Label ID="GNo1" runat="server" Width="50px" CssClass="Gprice"><%# Eval("Gprice")%></asp:Label>
                            </div>                           
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <br />

            <div style="width:1200px; height:30px; margin:5px auto; /*border:1px solid #000;*/ text-align:center;">
               <i class="layui-icon layui-icon-release" style="float:left; font-size: 30px; color: #1E9FFF;"></i>  
               <h3 style="float:left; margin-left:10px;">系列二</h3>
            </div>
            <div style="width:100%; height:220px; margin:5px auto; /*border:1px solid #000;*/ ">
                <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                        <div class="produce"  style="border: 1px solid #000;">
                            <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("Gno")%>' CausesValidation="false" runat="server" CssClass="SSimg" OnClick="LinkButtonDelete2_Click">
                                <img src="../Fore-images/<%# Eval("Gimage1")%>" alt="" style="height:150px; width: 200px;"/>
                            </asp:LinkButton>
                            <div class="Gtitle">
                                <p style="float:left; margin-top:5px; margin-left:5px; width:120px;"><%# Eval("Gname")%></p>
                                <asp:Label ID="GNo2" runat="server" Width="50px" CssClass="Gprice"><%# Eval("Gprice")%></asp:Label>
                            </div>                           
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <!--商品列表  结束-->

        <%--底部栏--%>
        <div class="dilan">
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
