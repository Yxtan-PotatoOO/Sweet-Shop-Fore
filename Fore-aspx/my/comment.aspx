<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comment.aspx.cs" Inherits="comment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" href="../../Fore-css/layui/css/layui.css" />
    <link href="../../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../Fore-css/comment.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../jquery-3.4.1/jquery-3.4.1.js"></script>
    <style> 
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
            left: 25%; 
            width: 45%; 
            height: 30%; 
            padding: 20px; 
            border: 5px solid #FF6C26; 
            background-color: white; 
            z-index:1002; 
            overflow: auto; 
        } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!--导航栏  开始-->
         <div class="daohang"> 
            <div class="title">
                <p>Sweep - shop</p>
            </div>
            <ul>
                <li>
                    <a href="#" class="item" style="margin-right: 160px;" >我的</a>
                </li>
                <li>
                    <a href="../my-buy/carts.aspx" class="item" style="margin-right: 10px;">购物车</a>
                </li>      
                <li>
                    <a href="../index.aspx" class="item" style="margin-right: 10px;">首页</a>
                </li>          
            </ul>  
        </div>
        <!--导航栏  结束-->

        <div style="width:80%; height:600px; margin:20px auto; border:1px solid #000;">
            <div style="width:100%; height:40px;  border-bottom:1px solid #000000;/*background-color:Silver;*/">
                <h2 style="margin-left:20px; vertical-align:middle; line-height:40px; /*background-color:Gray;*/">我的个人中心</h2>
            </div>
            <%--左侧导航栏  开始--%>
            <div class="left-daohang">
                <ul>
                    <li>
                        <p style="font-family:黑体; font-size:18px;">订单中心</p>
                    </li>            
                    <li>
                        <a href="order.aspx">我的订单</a>
                    </li>
                    <li>
                        <a href="comment.aspx">我的评论</a>
                    </li>
                    <li>
                        <p style="font-family:黑体; font-size:18px;">账户中心</p>
                    </li>            
                    <li>
                        <a href="my.aspx">我的信息</a>
                    </li>
                    <li>
                        <a href="address.aspx">地址管理</a>
                    </li>
                </ul>
            </div>
            <%--左侧导航栏  结束--%>    

            <div style="float:left; width:88%; height:560px; /*background-color:#8aa8d0;*/ overflow:auto;">
                <div style="width:80%; margin:40px auto;">
                    <table class="layui-table">
                        <colgroup>
                            <col width="120" />
                            <col width="250" />
                            <col width="400" />
                            <col width="120" />
                        </colgroup>
                        <thead>
                            <tr>
                            <th>时间</th>
                            <th>商品</th>
                            <th>我的评论</th>
                            <th>操作</th>
                            </tr> 
                        </thead>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%# Eval("Date")%></td>
                                        <td><%# Eval("Gname")%></td>
                                        <td><%# Eval("Eval")%></td>
                                        <td>

                                            <a href = "#" style="text-decoration:none; color:Black;" onmouseout="this.className='p1'" onmouseover="this.className='p2'" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">修改</a>
                                             
                                            <asp:Button ID="btn_comment_delete" runat="server" Text="删除" style="margin-left:5px; border: none; background-color: transparent; color:Black;" onmouseout="this.className='p1'" onmouseover="this.className='p2'" onclick="btn_comment_delete_click" CommandArgument=' <%# Eval("Gname")+","+Eval("Eval")%>' />
                                    </td>
                                </tr>
                            </tbody>
                            <div id="light" class="white_content">
                                <textarea name="evaluate" rows="" value="" style="width:100%; height:65%; margin: 10px auto;" placeholder="请重新输入你的评论，不超过100个字。" ></textarea>
                                <div style="width:150px; height:30px; margin:5px auto; /*border:1px solid #000;*/ text-align:center; padding-top:10px; border-radius:5px;">
                                    <asp:Button ID="btn_order_evaluateagain" Text="提交" runat="server" class="layui-btn" style="width:60px; height:35px; float:left; background-color:#FF6C26;" OnClientClick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" CommandArgument=' <%# Eval("Gname")%>'  OnClick="btn_order_evaluateagain_click"/>
                                    <asp:Button ID="Button1" Text="返回" runat="server" class="layui-btn" style="width:60px; height:35px; float:left; margin-left:30px; background-color:#FF6C26;" OnClick="btn_back_click" />
                                </div>
                            </div>
                            <div id="fade" class="black_overlay"></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
