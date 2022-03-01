using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class my_buy_carts1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                string uno = Session["Uno"].ToString();
                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
                string sqlSelect = String.Format("select Gno, Gname, Gimage1, Gprice, Number, Totalmoney from Carts where Uno='" + uno + "'");
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
            else
            {
                Response.Write("<script language='javascript'>alert('请先登录!'); location='../index.aspx';</script>");
            }
        }
    }

    protected void btn_delete_click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string gname = (((Button)sender).CommandArgument.ToString()).ToString();
        string sqldelete = "delete from Carts where Uno='" + uno + "' and Gno=(select Gno from Goods where Gname='" + gname + "')";  //删除信息

        OperateDataBase obd = new OperateDataBase();
        bool del = obd.ExceSql(sqldelete);
        if (del == true)
        {
            Response.Write("<script>window.alert('删除成功!');</script>");
        }
        else
        {
            Response.Write("<script>window.alert('删除失败!');</script>");
        }

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
        string sqlSelect = String.Format("select Gno, Gname, Gimage1, Gprice, Number, Totalmoney from Carts where Uno='" + uno + "'");
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
    protected void jiesuan_btn_Click(object sender, EventArgs e)
    {
        string str = Request["glist"].ToString();
        if (str != null)
        {
            Response.Redirect("settlement.aspx?list="+str);
        }
        
    }
}