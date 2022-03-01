<%@ Page Language="C#" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="address" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sweet - shop</title>
    <link rel="stylesheet" href="../../Fore-css/layui/css/layui.css" />
    <link href="../../Fore-css/index.css" rel="stylesheet" type="text/css" />
    <link href="../../Fore-css/address.css" rel="stylesheet" type="text/css" />
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
            top: 20%; 
            left: 25%; 
            width: 45%; 
            height: 45%; 
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
                        <a href="my.aspx">我的信息</a>
                    </li>
                    <li>
                        <a href="address.aspx">地址管理</a>
                    </li>
                </ul>
            </div>
            <%--左侧导航栏  结束--%>

            <!--主体-->
            <div style="float:left; width:88%; height:560px; /*background-color:#8aa8d0;*/ overflow:auto;">
                <div style="width:70%; margin:40px auto;">
                    <div class="layui-form-item">
                        <label class="layui-form-label">地址信息：</label>
                        <div class="layui-input-block">
                        <asp:TextBox ID="city" runat="server" lay-verify="required" placeholder="请输入省/市/区/街道" autocomplete="off" class="layui-input"  Height:35px></asp:TextBox>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">详细地址：</label>
                        <div class="layui-input-block">
                        <asp:TextBox ID="detail" runat="server" lay-verify="required" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" autocomplete="off" class="layui-input"  Height="35px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">邮政编码：</label>
                        <div class="layui-input-block">
                        <asp:TextBox ID="postcode" runat="server" lay-verify="required" placeholder="请填写邮编" autocomplete="off" class="layui-input"  Height="35px" ></asp:TextBox>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">收货人：</label>
                        <div class="layui-input-block">
                        <asp:TextBox ID="received" runat="server" lay-verify="required" placeholder="请填写收件人" autocomplete="off" class="layui-input"  Height="35px"></asp:TextBox>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label">手机号码：</label>
                        <div class="layui-input-block">
                        <asp:TextBox ID="phone" runat="server" lay-verify="required" placeholder="请填写联系方式" autocomplete="off" class="layui-input"  Height="35px"></asp:TextBox>

                        </div>
                    </div>

                    <div class="layui-form-item" style="margin-top:20px;">
                        <div style="float:left; margin-left:120px;">
                            <input type="checkbox" />
                        </div>
                        <div style="float:left; margin-left:20px; ">设置为默认收货地址</div>
                    </div>

                    <div class="layui-form-item" style="margin-top:35px;">
                        <div class="layui-input-block">
                        <asp:Button ID="btn_save" runat="server" Text="保存" class="layui-btn layui-bg-red" lay-submit lay-filter="formDemo" onclick="btn_save_Click"/>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </div>
                
                <div style="width:70%; margin:40px auto;">
                    <table class="layui-table">
                        <colgroup>
                            <col width="80" />
                            <col width="120" />
                            <col width="200" />
                            <col width="80" />
                            <col width="100" />
                            <col width="110" />
                        </colgroup>
                        <thead>
                            <tr>
                            <th>收件人</th>
                            <th>所在地区</th>
                            <th>详细地址</th>
                            <th>邮编</th>
                            <th>联系方式</th>
                            <th>操作</th>
                            </tr> 
                        </thead>
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td><%# Eval("ADrecipient")%></td>
                                        <td><%# Eval("ADcity")%></td>
                                        <td><%# Eval("ADdetail")%></td>
                                        <td><%# Eval("ADpostcode")%></td>
                                        <td><%# Eval("ADphone")%></td>
                                        <td>
                                            <a href = "#" style="text-decoration:none; color:Black;" onmouseout="this.className='p1'" onmouseover="this.className='p2'" onclick = "document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">修改</a>
                                            <asp:Button ID="btn_address_delete" runat="server" Text="删除" style="border: none; background-color: transparent; margin-left:5px; color:Black; " onmouseout="this.className='p1'" onmouseover="this.className='p2'" onclick="btn_address_delete_click" CommandArgument= '<%# Eval("ADno")+","+Eval("ADrecipient")+","+Eval("ADcity")+","+Eval("ADdetail")+","+Eval("ADpostcode")+","+Eval("ADphone") %>' />

                                        </td>
                                    </tr>
                                </tbody>
                                <div id="light" class="white_content">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">地址信息：</label>
                                        <div class="layui-input-block">
                                        <textarea name="city2" class="layui-input" style="height:35px; line-height:35px; resize:none;" placeholder="请输入省/市/区/街道" ></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">详细地址：</label>
                                        <div class="layui-input-block">
                                        <textarea name="detail2" class="layui-input" style="height:35px; line-height:35px; resize:none;" placeholder="请输入详细地址信息，如道路、门牌号、小区、楼栋号、单元等信息" ></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">邮政编码：</label>
                                        <div class="layui-input-block">
                                        <textarea name="postcode2" class="layui-input" style="height:35px; line-height:35px; resize:none;" placeholder="请填写邮编" ></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">收货人：</label>
                                        <div class="layui-input-block">
                                        <textarea name="received2" class="layui-input" style="height:35px; line-height:35px; resize:none;" placeholder="请填写收件人" ></textarea>
                                        </div>
                                    </div>

                                    <div class="layui-form-item">
                                        <label class="layui-form-label">手机号码：</label>
                                        <div class="layui-input-block">
                                        <textarea name="phone2" class="layui-input" style="height:35px; line-height:35px; resize:none;" placeholder="请填写联系方式" ></textarea>
                                        </div>
                                    </div>
                                    <div style="width:150px; height:30px; margin:5px auto; /*border:1px solid #000;*/ text-align:center; padding-top:10px; border-radius:5px; /*background-color:Silver;*/">
                                        <asp:Button ID="btn_order_evaluateagain" Text="提交" runat="server" class="layui-btn" style="width:60px; height:35px; float:left; background-color:#FF6C26;" OnClientClick = "document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'" CommandArgument='<%# Eval("ADno") %>'  OnClick="btn_address_again_click"/>
                                        <asp:Button ID="Button1" Text="返回" runat="server" class="layui-btn" style="width:60px; height:35px; float:left; margin-left:30px; background-color:#FF6C26;" OnClick="btn_back_click"/>
                                    </div>
                                </div>
                                <div id="fade" class="black_overlay"></div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>    
            </div>
            <!--主体  结束-->
        </div>
    </form>
</body>
</html>