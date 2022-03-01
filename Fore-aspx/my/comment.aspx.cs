using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class comment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                string uno = Session["Uno"].ToString();
                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
                string sqlSelect = String.Format("select convert(char(10),Etime,120) as Date,Gname,Eval from evaluation,Goods where Uno='" + uno + "' and evaluation.Gno=Goods.Gno");
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
                Response.Write("<script language='javascript'>alert('请先登录!'); location='../login.aspx';</script>");
            }
        }
    }

    protected void btn_order_evaluateagain_click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string gname = (((Button)sender).CommandArgument.ToString()).ToString();
        string evaluate = Request["evaluate"];
        string evaluate2 = "";
        if (evaluate.Contains(","))
        {
            int endIndex = evaluate.IndexOf(",");
            evaluate2 = evaluate.Substring(0, endIndex);
        }
        else
        {
            evaluate2 = evaluate;
        }
        string sqlUpdate = "update Evaluation set Eval='" + evaluate2 + "' where Uno='" + uno + "' and Gno=(select Gno from Goods where Gname='" + gname + "')";
        OperateDataBase obd = new OperateDataBase();
        bool del = obd.ExceSql(sqlUpdate);
        if (del == true)
        {
            Response.Write("<script>window.alert('修改成功!');</script>");
        }
        else
        {
            Response.Write("<script>window.alert('修改失败!');</script>");
        }

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
        string sqlSelect = String.Format("select convert(char(10),Etime,120) as Date,Gname,Eval from Goods,Evaluation where Uno='" + uno + "' and Goods.Gno=Evaluation.Gno");
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

    protected void btn_comment_delete_click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string[] estr = ((Button)sender).CommandArgument.ToString().Split(',');
        string gname = Convert.ToString(estr[0]);
        string eval = Convert.ToString(estr[1]);
        string sqlDelete = "delete from Evaluation where Uno='" + uno + "' and Gno=(select Gno from Goods where Gname='" + gname + "' and Eval='" + eval + "')";
        OperateDataBase obd = new OperateDataBase();
        bool del = obd.ExceSql(sqlDelete);
        if (del == true)
        {
            Response.Write("<script>window.alert('删除成功!');</script>");
        }
        else
        {
            Response.Write("<script>window.alert('删除失败!');</script>");
        }

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
        string sqlSelect = String.Format("select convert(char(10),Etime,120) as Date,Gname,Eval from Goods,Evaluation where Uno='" + uno + "' and Goods.Gno=Evaluation.Gno");
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

    protected void btn_back_click(object sender, EventArgs e)
    {
        Response.Redirect("comment.aspx");
    }
}