<%@ Page Language="C#" AutoEventWireup="true" CodeFile="carts.aspx.cs" Inherits="my_buy_carts1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" href="../../Fore-css/layui/css/layui.css" />
    <link href="../../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../Fore-css/shopcar.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../jquery-3.4.1/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="../../Fore-css/layui/layui.all.js"></script>
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
                    <a href="../my/order.aspx"class="item" style="margin-right: 160px;" >我的</a>
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

        <!--列表 -->
        <table style="width:80%; height:auto; margin:20px auto; border-radius:5px; ">
			<tr style="width:100%; height:40px; border:1px solid #000; background-color:#e7e7e7; overflow:hidden; border-radius:5px; text-align:center;">
				<td style="width:100px;">全选</td>
				<td style="width:150px;">产品</td>
                <td style="width:200px;">名称</td>
				<td style="width:300px;">单价</td>
				<td style="width:180px;">数量</td>
				<td style="width:180px;">小计</td>
				<td style="width:150px;">操作</td>
			</tr>
            <tr style="width:100%; height:10px; border:1px solid #000; background-color:#e7e7e7; overflow:hidden; border-radius:5px; ">
			</tr>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
			        <tr style="width:100%; height:80px; border:1px solid #000; border-radius:5px; margin-top:20px; text-align:center;">
				        <td style="margin-left:35px; width:100px; text-align:center;"> 
                            <input id="sum" name="select" type="checkbox" value="<%# Eval("Gno")%>,<%# Eval("Totalmoney")%>"  onclick="getSum()"/>
                            <input type="hidden" id="Glist" name="glist" value="" />
                        </td>
				        <td style="width:100px; height:auto; margin-top:0;">
                            <img src="../../Fore-images/<%# Eval("Gimage1")%>" alt="" style="height:70px; width: 70px;"/>
                        </td>
				        <td style="width:300px;">
                            <p><%# Eval("Gname")%></p>
                        </td>
				        <td style="width:180px;"><%# Eval("Gprice")%></td>
				        <td style="width:175px;"><%# Eval("Number")%></td>
				        <td style="width:180px;"><%# Eval("Totalmoney")%></td>
                        <td style="width:100px;">
                            <asp:Button ID="btn_delete" runat="server" Text="删除" style="border: none; background-color: transparent; " onmouseout="this.className='p1'" onmouseover="this.className='p2'"  CommandArgument='<%# Eval("Gname") %>' onclick="btn_delete_click"/> 
                        </td>
			        </tr>
                </ItemTemplate>
            </asp:Repeater>
		</table>
        <div style="margin:5px auto 0 auto; width:80%; height:40px; border:1px solid #000; background-color:#e7e7e7; border-radius:5px;">
            <ul>
                <li style="float:right; margin-right:30px; ">
                    <asp:Button ID="jiesuan_btn" runat="server" Text="结算"  
                        class="layui-btn layui-btn-danger" onclick="jiesuan_btn_Click"/>
                </li>
                <li style="float:right; margin-right:50px; font-size:28px; font-weight:bolder; color:#FF6C26" >￥<span id="sumid"></span></li>
            </ul>
        </div>
        <script type="text/javascript">
			function getSum() {
			    var sum = 0;
			    var lst = "";
			    var select = document.getElementsByName("select");
			    for (var i = 0; i < select.length; i++) {
			        if (select[i].checked) {//被选中
			            sum += parseFloat(select[i].value.split(",")[1]);
			            lst += select[i].value.split(",")[0];
			            lst += ",";
			        }
			    }
			    var span = document.getElementById("sumid");
			    span.innerHTML = (new String(sum)).fontcolor("red");
			    document.getElementById("Glist").value = new String(lst);
			}
        </script>
    </form>
</body>
</html>
