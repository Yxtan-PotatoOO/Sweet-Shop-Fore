<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" type="text/css" href="../Fore-css/login.css" />
    <style>
    .box 
    {
        background-color: rgba(255,255,255,0.8);
        border-radius: 10px;
    }
    </style>
</head>

<body>
    <form id="form1" runat="server">

    <div class="big-box">
        <div class="box2">
            <asp:Image ID="Image1" runat="server" Width="500px" Height="300px" 
                ImageUrl="../Fore-images/login1.png" />
                <br />
                <br />
            <br />
            <br />
        </div>
        <div class="box" >
            <div class="login">
                <asp:Label ID="Label1" runat="server" Text="登录" ></asp:Label>
            </div>
            <br />
            <div class="imformation1">
                <p style="float:left;  margin-top:20px; width:50px; height:25px;">账号：</p>
                <asp:TextBox ID="ID" runat="server" style="float:left; border-top-style: none; border-right-style: none; border-left-style: none; background-color:transparent; width:180px; height:30px; margin-top:10px; border-bottom-color:#999999;"></asp:TextBox>
            </div>        
            <br />
            <div class="imformation2">
                <p style="float:left; /*background-color:Lime;*/ margin-top:15px; width:50px; height:25px;">密码：</p>
                <asp:TextBox ID="password" runat="server" type="password" style="border-top-style: none; border-right-style: none; border-left-style: none; background-color:transparent; width:180px; height:30px; margin-top:0; border-bottom-color:#999999;"></asp:TextBox>
            </div>
            <br />
            <div class="button1">
                <asp:Button ID="btn_logon" runat="server" Text="登录" BackColor="#D83F0C" 
                    BorderColor="#D83F0C" BorderStyle="Solid" ForeColor="White" Width="75px" 
                    Height="30px" onclick="btn_logon_Click"/>
            </div>
            <div class="button2">
                <asp:Button ID="btn_back" runat="server" Text="返回" BackColor="#D83F0C" 
                    BorderColor="#D83F0C" BorderStyle="Solid" ForeColor="White" Width="75px" 
                    Height="30px" onclick="btn_back_Click"/>
            </div>
        </div>
    </div>
    </form>
</body>
</html>



