using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

public partial class settlement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                string uno = Session["Uno"].ToString();
                string list = Request.QueryString["list"];
                string[] lst = list.Split(',');
                string glist = "";
                for (var i = 0; i < lst.Length; i++)
                {
                    if (i != lst.Length - 1)
                        glist += "'" + lst[i] + "',";
                    else
                        glist += "'" + lst[i] + "'";
                }
                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
                string sqlSelect1 = string.Format("select ADno,Uno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone from Address where Uno='" + uno + "'");

                string sqlSelect2 = String.Format("select Gno, Gname, Gimage1, Gprice, Number, Totalmoney from Carts where Uno='" + uno + "' and Gno in (" + glist + ")");
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect1, str); //创建DataAdapter数据适配器实例
                    DataSet ds = new DataSet();//创建DataSet实例
                    da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                    Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
                    Repeater1.DataBind(); //用DataBind方法绑定具体的控件
                }

                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect2, str); //创建DataAdapter数据适配器实例
                    DataSet ds = new DataSet();//创建DataSet实例
                    da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                    Repeater2.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
                    Repeater2.DataBind(); //用DataBind方法绑定具体的控件
                }

                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect2, str);
                    DataTable dt = new DataTable();
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    da.Fill(dt);
                    decimal sum = 0;
                    for (int i = 0; i < dt.Rows.Count; i++)
                        sum += (decimal)dt.Rows[i][5];
                }
            }
            else
            {
                Response.Write("<script language='javascript'>alert('请先登录!'); location='../index.aspx';</script>");
            }
        }
    }

    protected void tijiao_btn_Click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();

        string adno = Request["AD"].ToString();
        string adno2 = "";
        if (adno.Contains(","))
        {
            int endIndex = adno.IndexOf(",");
            adno2 = adno.Substring(0, endIndex);
        }
        else
        {
            adno2 = adno;
        }

        string list = Request.QueryString["list"];
        string[] lst = list.Split(',');
        string glist = "";
        for (var i = 0; i < lst.Length; i++)
        {
            if (i != lst.Length - 1)
                glist += "'" + lst[i] + "',";
            else
                glist += "'" + lst[i] + "'";
        }
        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
        string sqlSelect2 = String.Format("select Gno, Gname, Gimage1, Gprice, Number, Totalmoney from Carts where Uno='" + uno + "' and Gno in (" + glist + ")");
        SqlConnection conn = new SqlConnection(str);
        conn.Open();
        SqlDataAdapter SD = new SqlDataAdapter(sqlSelect2, str);
        DataSet data = new DataSet();
        SD.Fill(data);
        for (int i = 0; i < data.Tables[0].Rows.Count; i++)
        {
            string order_gno = data.Tables[0].Rows[i]["Gno"].ToString();
            string order_gprice = data.Tables[0].Rows[i]["Gprice"].ToString();
            string order_number = data.Tables[0].Rows[i]["Number"].ToString();
            string order_totalmoney = data.Tables[0].Rows[i]["Totalmoney"].ToString();
            string time = DateTime.Now.ToString();
            string cost = "";
            string uphone = Request["uphone"];
            if (this.cost_RadioButtonList.SelectedValue == "1")
            {
                cost = "微信";
            }
            else if (this.cost_RadioButtonList.SelectedValue == "2")
            {
                cost = "支付宝";
            }
            else
            {
                cost = "银行卡";
            }

            string sqlInsert = "insert into Orders(Ono,Gno,Uno,Gprice,Number,Totalmoney,Payment,Ptime,Ostate,ADno) values(replace(replace(replace(CONVERT(varchar, getdate(), 120 ),'-',''),' ',''),':',''),'" + order_gno + "','" + uno + "','" + order_gprice + "','" + order_number + "','" + order_totalmoney + "','" + cost + "','" + time + "','待发货','" + adno2 + "')";
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlCommand sqlComGet = new SqlCommand(sqlInsert, sqlCon);
                int n = sqlComGet.ExecuteNonQuery();
                if (n <= 0)
                {
                    Response.Write("<script language=javascript>alert('提交失败');</script> ");
                }
                else
                {
                    Response.Write("<script>window.alert('提交成功！');</script>");
                }
            }
            string sqldelete = "delete from Carts where Uno='" + uno + "')";  //删除信息
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
        }
        Response.Redirect("../my/order.aspx");
    }

    protected void btn_back_click(object sender, EventArgs e)
    {
        Response.Redirect("carts.aspx");
    }
}