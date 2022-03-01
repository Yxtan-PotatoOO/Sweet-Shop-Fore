<%@ Page Language="C#" AutoEventWireup="true" CodeFile="changepsss.aspx.cs" Inherits="my_changepsss" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet - shop</title>
    <link href="../../Fore-css/password.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="big-box">
        <div class="pass">
            <div class="title">
                <p>修改密码</p>
            </div>
            <div class="setPassword">
                <asp:Label ID="Label1" runat="server" Text="原密码：" Width="100px"></asp:Label>
                <asp:TextBox ID="Old_Password" runat="server"></asp:TextBox>
            </div>
        
            <div class="setPassword">
                <asp:Label ID="Label2" runat="server" Text="新密码：" Width="100px"></asp:Label>
                <asp:TextBox ID="New_Password" runat="server"></asp:TextBox>
            </div>

            <div class="setPassword">
                <asp:Label ID="Label3" runat="server" Text="重新输入：" Width="100px"></asp:Label>
                <asp:TextBox ID="Newpass_again" runat="server"></asp:TextBox>
            </div>

            <div style="width: 500px; margin-top: 30px;">
                <asp:Button ID="btn_confirm" runat="server" Text="确认" Height="30px" 
                    Width="60px" style="margin-left: 140px;" ForeColor="White" BackColor="#D83F0C" 
                    BorderColor="#D83F0C" onclick="btn_confirm_Click"/>
                <asp:Button ID="Button1" runat="server" Text="返回" Height="30px" 
                Width="60px" style="margin-left: 80px" ForeColor="White" BackColor="#D83F0C" 
                    BorderColor="#D83F0C" onclick="Button1_Click"/>
            </div>
        </div>        
    </div>
    </form>
</body>
</html>
