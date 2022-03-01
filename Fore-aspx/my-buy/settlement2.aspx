<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settlement2.aspx.cs" Inherits="my_buy_settlement2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" href="../../Fore-css/layui/css/layui.css" />
    <link href="../../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../Fore-css/settlement.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../jquery-3.4.1/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../../Fore-css/layui/layui.all.js"></script>
    <style type="text/css"> 
        table
        {
            border:1px solid #fff;
        } 
        table td
        {
            border:2px solid #fff;
        }
        .black_overlay{ 
            display: none; 
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; 
            -moz-opacity: 0.8; 
            opacity:.80; 
            filter: alpha(opacity=88); 
        } 
        .white_content { 
            display: none; 
            position: absolute; 
            top: 25%; 
            left: 35%; 
            width: 30%; 
            height: 20%; 
            padding: 20px; 
            border: 5px solid #EA5753; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style> 
    <script type="text/javascript">
        $(document).ready(function () {
            var totalRow = 0;
            var table = document.getElementById("table_id");
            $('#table_id tr:gt(0)').each(function () {
                $(this).find('td:eq(5)').each(function () {
                    totalRow += parseFloat($(this).text());
                });
            });
            var span = document.getElementById("sumid");
            span.innerHTML = totalRow;
        }); 
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  开始-->
        <div class="daohang"> 
            <div class="title">
                <p>Sweet - shop</p>
            </div>
            <ul>
                <li>
                    <a href="../my/order.aspx" class="item" style="margin-right: 160px;" >我的订单</a>
                </li>
                <li>
                    <a href="carts.aspx" class="item" style="margin-right: 10px;">购物车</a>
                </li>      
                <li>
                    <a href="../index.aspx" class="item" style="margin-right: 10px;">首页</a>
                </li>         
            </ul>  
        </div>  
        <!--导航栏  结束-->
        <div style="width:70%; margin:20px auto;"><!-- background-color: #F7F7F7;-->
            <div style="padding:5px;">
                <h3 style="font-weight:bold;">收货地址信息</h3>
            </div>
            <asp:Repeater ID="Repeater1" runat="server" >
                <ItemTemplate>
                    <div style="background-color:#FDF0F0; border:1px solid #EA5342; width:100%; height:30px; margin-top:5px; ">
                        <div style="margin-left:200px;">
                            <input id="sum" name="select" type="checkbox" value="<%# Eval("ADno")%>,<%# Eval("ADcity")%>"  onclick="Select()" lay-skin="primary" style="float:left; line-height:30px; margin:9px 10px;"/>
                            <input type="hidden" id="AD" name="AD" value="" />

                            <p style="float:left; line-height:30px; margin-left:5px;"><%# Eval("ADcity")%></p>
                            <p style="float:left; line-height:30px; margin-left:5px;"><%# Eval("ADdetail")%></p>
                            <p style="float:left; line-height:30px; margin-left:5px;">（<%# Eval("ADrecipient")%>  收）</p>
                            <p style="float:left; line-height:30px; margin-left:5px;"><%# Eval("ADphone")%></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <script type="text/javascript">
                function Select() {
                    var lst = "";
                    var select = document.getElementsByName("select");
                    for (var i = 0; i < select.length; i++) {
                        if (select[i].checked) {//被选中
                            lst += select[i].value.split(",")[0];
                        }
                    }
                    document.getElementById("AD").value = new String(lst);
                }
            </script>
        </div>
        
        <br />
        <br />
        <br />
        <div style="padding:5px; "><!--border-bottom:2px solid #73A8A0;-->
            <h3 style="font-weight:bold; margin-left:15%;">确认订单信息</h3>
        </div>

        <table id="table_id" onclick="getSum()" border="2"; width="70%" bgcolor="#FEF2F1" cellpadding="2" style="margin:10px auto;">
            <tr align="center">
                <td style="width:80px; height:30px; border-bottom-color: #EA5753; background-color: #FFFFFF;">商品图片</td>
                <td style="width:200px; border-bottom-color: #EA5753; background-color: #FFFFFF;">商品标题</td>
                <td style="width:100px; border-bottom-color: #EA5753; background-color: #FFFFFF;">商品属性</td>
                <td style="width:100px; border-bottom-color: #EA5753; background-color: #FFFFFF;">单价</td>
                <td style="width:100px; border-bottom-color: #EA5753; background-color: #FFFFFF;">数量</td>
                <td style="width:100px; border-bottom-color: #EA5753; background-color: #FFFFFF;">小计</td>
            </tr>
                <tr align="center">
                    <td style="height:80px;">
                        <asp:Image ID="Image1" runat="server" ImageUrl="" Height="70px" Width="70px" />
                    </td>
                    <td>
                        <asp:Label ID="Gname" runat="server" Text=""></asp:Label></td>
                    <td>
                        <asp:Label ID="Gname2" runat="server" Text=""></asp:Label></td>
                    <td>
                        <asp:Label ID="Gprice" runat="server" Text=""></asp:Label></td>
                    <td>
                        <asp:Label ID="Number" runat="server" Text=""></asp:Label></td>
                    <td id="Td1">
                        <asp:Label ID="Totalmoney" runat="server" Text=""></asp:Label></td>
                </tr>

                <tr align="left">
                    <td colspan="3" style="height:80px;">
                        <p style="margin-left:30px;">
                            留言：<asp:TextBox ID="TextBox1" runat="server" Height="55px" Width="350px"></asp:TextBox>
                        </p>
                    </td>
                    <td colspan="3"><p style="margin-left:20px;">运送方式：</p></td>
                </tr>
        </table>

        <div style="width:70%; margin:20px auto;">
            <div style="float:right; ">
                <a href = "#" class="layui-btn" style="width:100px; height:40px; background-color:#EA5753;  cursor:hand; border: 1px solid #EA5753; color:White; font-weight:bold;" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">提交订单</a>
            </div>
            <div id="light" class="white_content">
                <div style="width: 400px; margin: 20px auto; font-size: 16px; font-family:@Adobe 宋体 Std L;">
                    <div style="float:left; font-family:黑体; font-size:20px; font-weight:bolder;">
                        <asp:Label ID="sex" runat="server" Text="支付方式：" Width="120px"></asp:Label> 
                    </div>
                    <div style="float:left;">
                        <asp:RadioButtonList ID="cost_RadioButtonList" name="usex" runat="server" 
                        RepeatDirection="Horizontal" Width="280px">
                            <asp:ListItem Value="1">微信</asp:ListItem>
                            <asp:ListItem Value="2">支付宝</asp:ListItem>
                            <asp:ListItem Value="3">银行卡</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <br/>
                    <br/>
                    <div style="width:200px; height:30px; margin:5px auto; /*border:1px solid #000;*/ text-align:center; padding-top:10px; border-radius:5px;">
                        <asp:Button ID="btn_order_evaluate" class="layui-btn confirm_btn" Text="确定" runat="server" style="height:35px; margin-left:20px; background-color:#EA5753;" OnClientClick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" OnClick="tijiao_btn_Click" CommandArgument=''/>
                        <asp:Button ID="Button1" class="layui-btn confirm_btn" Text="返回" runat="server" style="margin-left:35px; height:35px; background-color:#EA5753;" OnClick="btn_back_click" />
                    </div>
                </div>
            </div>
            <div id="fade" class="black_overlay"></div> 

            <h2 style="float:right; line-height:40px; margin-right:30px;">￥<span id="sumid"></span></h2>
            <h3 style="float:right; line-height:40px;">实付款：</h3>
        </div>       
    </form>
</body>
</html>