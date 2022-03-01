using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    
    protected void btn_register_Click(object sender, EventArgs e)
    {
        string nickname = this.Nickname.Text;
        string id = this.ID.Text;
        string pass = this.password.Text;

        string sqlinsert = "insert into Users(Uname,Uno,Upasswd,Usex,Uphone) values('" + nickname + "','" + id + "','" + pass + "','男','00000000')";  //插入新用户信息

        OperateDataBase obd = new OperateDataBase();
        bool add = obd.ExceSql(sqlinsert);
        if (add == true)
        {
            Response.Redirect("login.aspx");
            Response.Write("<script>window.alert('注册成功!');</script>");
        }
        else
        {
            Response.Write("<script>window.alert('注册失败!');</script>");
        }
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");  //转到首页
    }
}