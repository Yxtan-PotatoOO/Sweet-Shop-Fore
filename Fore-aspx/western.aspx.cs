using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class western : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                btn_login.Style.Clear();
                btn_login.CssClass = "hid";
                btn_register.Style.Clear();
                btn_register.CssClass = "hid";
                Label1.CssClass = "welcome2";
                btn_back.CssClass = "welcome2";
            }
        }
        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
        string sqlSelect = String.Format("select Gno,Gname,Gimage1,Gprice from Goods where Gsort like '%西式%'");
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
            DataSet ds = new DataSet();//创建DataSet实例
            da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
            Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
            Repeater1.DataBind(); //用DataBind方法绑定具体的控件
        }
    }

    protected void LinkButtonDelete1_Click(object sender, EventArgs e)
    {
        string gno = (((LinkButton)sender).CommandArgument.ToString()).ToString();
        Response.Redirect("good-infor.aspx?gno=" + gno);
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btn_register_Click(object sender, EventArgs e)
    {
        Response.Redirect("register.aspx");
    }

    protected void btn_back_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }
}