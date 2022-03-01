using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

public partial class good_infor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
            string gno_infor;
            gno_infor = Request.QueryString["gno"];
            string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
            //string sqlSelect = String.Format("select Gimage1,Gname,Gprice,Gnum from Goods where Gno='" + gno_infor + "'");
            string sqlSelect = String.Format("select Gimage1,Gname,Gprice from Goods where Gno='" + gno_infor + "'");
            string sqlSelect2 = String.Format("select Gslogan,Gdetail from Goods where Gno='" + gno_infor + "'");
            //string sqlSelect3 = String.Format("select convert(char(10),Etime,120) as Etime,Eval,Uname from Evaluation where Gname in (select Gname from Goods where Gno='" + gno_infor + "')");
            string sqlSelect3 = String.Format("select convert(char(10),Etime,120) as Etime,Eval,Uname from Evaluation where Gno='" + gno_infor + "'");
            string sqlSelect4 = String.Format("select Gimage1,Gimage2,Gimage3 from Goods where Gno='" + gno_infor + "'");

            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
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
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect3, str); //创建DataAdapter数据适配器实例
                DataSet ds = new DataSet();//创建DataSet实例
                da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                Repeater3.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
                Repeater3.DataBind(); //用DataBind方法绑定具体的控件
            }
            using (SqlConnection sqlCon = new SqlConnection(str))
            {
                sqlCon.Open();
                SqlDataAdapter da = new SqlDataAdapter(sqlSelect4, str); //创建DataAdapter数据适配器实例
                DataSet ds = new DataSet();//创建DataSet实例
                da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
                Repeater4.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
                Repeater4.DataBind(); //用DataBind方法绑定具体的控件
            }
        }
    }

    //立即购买
    protected void LinkButton_Buy_Click(object sender, EventArgs e)
    {
        if (Session["Uno"] == null)
            Response.Write("<script>alert('请先登录!');</script>");
        else
        {
            string uno = Session["Uno"].ToString();
            int num = int.Parse(Request.Form["num"].ToString());
            string gno_infor = Request.QueryString["gno"];
            string[] estr = ((LinkButton)sender).CommandArgument.ToString().Split(',');
            string gname = Convert.ToString(estr[0]);
            string gprice = Convert.ToString(estr[1]);
            string gimage1 = Convert.ToString(estr[2]);
            decimal totalmoney = decimal.Parse(gprice) * num;

            Session["b_gimage1"] = gimage1;
            Session["b_gname"] = gname;
            Session["b_gprice"] = gprice;
            Session["b_num"] = num.ToString();
            Session["b_totalmoney"] = totalmoney;
            Session["b_gno"] = gno_infor;
            Response.Redirect("my-buy/settlement2.aspx");

        }
    }

    //购物车
    protected void Add_to_cart_Click(object sender, EventArgs e)
    {
        if (Session["Uno"] == null)
            Response.Write("<script>alert('请先登录!');</script>");
        else
        {
            string uno = Session["Uno"].ToString();
            int num = int.Parse(Request.Form["num"].ToString());
            string gno_infor = Request.QueryString["gno"];
            string[] estr = ((LinkButton)sender).CommandArgument.ToString().Split(',');
            string gname = Convert.ToString(estr[0]);
            string gprice = Convert.ToString(estr[1]);
            string gimage1 = Convert.ToString(estr[2]);
            decimal totalmoney = decimal.Parse(gprice) * num;

            string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
            SqlConnection sqlCon = new SqlConnection(str);
            sqlCon.Open();
            SqlCommand sqlComGet = new SqlCommand();
            sqlComGet.Connection = sqlCon;
            sqlComGet.CommandText = "select * from Carts where Uno = '" + uno + "' and Gno='" + gno_infor + "'";  //匹配id和密码
            SqlDataReader sqlDr = sqlComGet.ExecuteReader();
            if (sqlDr.Read())  //如果购物车中已有该商品数据，则更新数量和总价
            {
                int ole_num = Convert.ToInt32(sqlDr[5].ToString());
                sqlCon.Close();
                sqlCon.Open();
                int new_num = ole_num + num;
                string sqlupdate = "update Carts set Number='" + new_num + "' where  Uno = '" + uno + "' and Gno='" + gno_infor + "'";
                SqlCommand cmd = new SqlCommand(sqlupdate, sqlCon);
                if (cmd.ExecuteNonQuery() > 0)
                    Response.Write("<script>window.alert('添加成功!');</script>");
            }
            else  //购物车中没有该商品，则添加
            {
                string sqlInsert = "insert into Carts values('" + uno + "','" + gno_infor + "','" + gname + "','" + gimage1 + "','" + gprice + "','" + num + "','" + totalmoney + "')";//

                OperateDataBase obd3 = new OperateDataBase();
                bool add3 = obd3.ExceSql(sqlInsert);
                if (add3 == true)
                {
                    Response.Write("<script>window.alert('提交成功!');</script>");
                }
                else
                {
                    Response.Write("<script>window.alert('提交失败!');</script>");
                }
            }      
        }
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