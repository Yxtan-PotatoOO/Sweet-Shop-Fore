using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;  

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_logon_Click(object sender, EventArgs e)
    {
        string id = this.ID.Text;  //获取id
        string pass = this.password.Text;  //获取密码

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";   //连接数据库
        SqlConnection sqlCon = new SqlConnection(str);  
        sqlCon.Open();
        SqlCommand sqlComGet = new SqlCommand();
        sqlComGet.Connection = sqlCon;
        sqlComGet.CommandText = "select * from Users where Uno='" + id + "' and Upasswd='" + pass + "'";  //匹配id和密码
        SqlDataReader sqlDr = sqlComGet.ExecuteReader();

        if (sqlDr.Read())                                  //帐号和密码正确
        {
            Session["Uno"] = id;                      //用Session记录帐号
            Session["Upasswd"] = pass;                //用Session记录密码
            Response.Redirect("index.aspx");
        }
        else                                              //帐号或密码错误
        {
            Response.Write("<script>window.alert('您输入的用户名或密码不正确！');</script>");
        }
        sqlCon.Close();
    }

    public void id(object sender, EventArgs e)
    {
        string id = this.ID.Text;
        Session["Uno"] = id;  //缓存id
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");  //登录到首页
    }

}