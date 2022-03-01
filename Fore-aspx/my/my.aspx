<%@ Page Language="C#" AutoEventWireup="true" CodeFile="my.aspx.cs" Inherits="My" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" href="../../Fore-css/layui/css/layui.css" />
    <link href="../../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../Fore-css/my.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../jquery-3.4.1/jquery-3.4.1.js"></script>
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
            <div style="width:100%; height:40px; border-bottom:1px solid #000000;/*background-color:Silver;*/">
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
                        <a href="My.aspx">我的信息</a>
                    </li>
                    <li>
                        <a href="address.aspx">地址管理</a>
                    </li>
                </ul>
            </div>
            <%--左侧导航栏  结束--%>

            <!--主体-->
            
            <div style="float:left; width:88%; height:560px; /*background-color:#8aa8d0*/">
                <div class="box">
                    <div class="information" style="margin-bottom: 30px;">
                        <asp:Label ID="Label1" runat="server" Text="头像：" Width="100px"></asp:Label>
                        <asp:Repeater ID="Repeater1" runat="server" >
                            <ItemTemplate>
                                <%--<img style="width:80px; height:80px; /*border:1px solid #000;*/" src="../../images/头像/<%# Eval("uportrait")%>.jpg" id="headphoto"/>--%>
                                <img style="width:80px; height:80px; /*border:1px solid #000;*/" src="../../aspx/UserManagement/imgUploads/<%# Eval("uportrait")%>.jpg" id="headphoto"/>
                            </ItemTemplate>
                        </asp:Repeater>
                        <br/>
                        <%--<input type="file" runat="server" id="fileuploadid" style="width:180px; height:30px; margin-left:100px; margin-top:20px;" />
                        <asp:Button runat="server" ID="btupload" class="layui-btn" style="background-color:#FF6C26; padding:0;" OnClick="BtUpLoad_Click" Text="上传" Width="60px" Height="30px" />--%>
                    </div>
                    <div class="information">
                        <asp:Label ID="Label2" runat="server" Text="昵称：" Width="100px"></asp:Label>
                        <asp:TextBox ID="uname" name="uname" runat="server" Height="24px"></asp:TextBox>
                    </div>
                    <div class="information">
                        <asp:Label ID="Label3" runat="server" Text="账号：" Width="100px" ></asp:Label>
                        <asp:Label ID="uno" runat="server" Text="Label" Height="24px"></asp:Label>
                    </div>
                    <div class="information">
                        <asp:Label ID="Label5" runat="server" Text="密码：" Width="100px"></asp:Label>
                        <asp:Button ID="btn_change" runat="server" Text="修改" class="layui-btn" style="background-color:#FF6C26; padding:0;" Height="30px" Width="60px" onclick="btn_change_Click" /> 
                    </div>
                    <div class="information">
                        <div style="float: left;">
                        <asp:Label ID="sex" runat="server" Text="性别：" Width="100px"></asp:Label> 
                    </div>
                    <div style="float: left;">
                        <asp:RadioButtonList ID="sex_RadioButtonList" name="usex" runat="server" 
                        RepeatDirection="Horizontal" Width="100px">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="2">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <br />
                    </div>
                    <div class="information">
                        <asp:Label ID="Label7" runat="server" Text="联系电话：" Width="100px"></asp:Label>
                        <asp:TextBox ID="uphone" name="uphone" runat="server"  Height="24px"></asp:TextBox>
                    </div>
<%--                    <div class="information">
                        <asp:Label ID="Label8" runat="server" Text="地址：" Width="100px"></asp:Label>
                        <asp:TextBox ID="Address" runat="server"  Height="24px"></asp:TextBox>
                    </div>--%>
                    <div  style="width: 60px; margin: 30px auto;">
                        <asp:Button ID="btn_preservation" runat="server" Text="保存"  Width="60px" CssClass="layui-btn layui-btn-danger" OnClick="btn_preservation_Click"/>
                    </div>         
                </div>
            </div>
            
            <!--主体  结束-->
        </div>
    </form>
</body>
</html>
