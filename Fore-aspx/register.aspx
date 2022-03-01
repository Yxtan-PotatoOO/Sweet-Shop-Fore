<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" type="text/css" href="../Fore-css/register.css" />
</head>
<style>
    .box 
    {
        background-color: rgba(255,255,255,0.8);
        border-radius: 10px;
    }
</style>
<body>
    <form id="form1" runat="server">

    <div class="big-box">
        <div class="box" >
            <div class="login">
                <asp:Label ID="Label1" runat="server" Text="注册" ></asp:Label>
            </div>
            <br />
            <div class="imformation1">
                <asp:Label ID="Label2" runat="server" Text="昵称：" style="float:left; margin-top:0px; width:50px; height:25px;" ></asp:Label>
                <asp:TextBox ID="Nickname" runat="server" style="float:left; border-top-style: none; border-right-style: none; border-left-style: none; background-color:transparent; width:180px; height:16px; margin-top:0px; border-bottom-color:#999999;"></asp:TextBox>
            </div>        
            <br />
            <div class="imformation2">
                <asp:Label ID="Label3" runat="server" Text="账号：" style="float:left; margin-top:0px; width:50px; height:25px;" ></asp:Label>
                <asp:TextBox ID="ID" runat="server" style="float:left; border-top-style: none; border-right-style: none; border-left-style: none; background-color:transparent; width:180px; height:16px; margin-top:0px; border-bottom-color:#999999;"></asp:TextBox>
            </div>
            <br />
            <div class="imformation3">
                <asp:Label ID="Label4" runat="server" Text="密码：" style="float:left; margin-top:0px; width:50px; height:25px;" ></asp:Label>
                <asp:TextBox ID="password" runat="server" type="password" style="float:left; border-top-style: none; border-right-style: none; border-left-style: none; background-color:transparent; width:180px; height:16px; margin-top:0px; border-bottom-color:#999999;"></asp:TextBox>
            </div>
            <br />
            <div class="button1">
                <asp:Button ID="btn_register" runat="server" Text="注册" BackColor="#D83F0C" 
                    BorderColor="#D83F0C" BorderStyle="Solid" ForeColor="White" Width="75px" 
                    Height="30px" onclick="btn_register_Click"/>
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

