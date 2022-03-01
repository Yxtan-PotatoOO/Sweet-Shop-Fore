using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class address : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                string uno = Session["Uno"].ToString();
                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456"; 
                string sqlSelect = String.Format("select ADno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone from Address where Uno='" + uno + "'");
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

    protected void btn_save_Click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string city = this.city.Text;
        string detail = this.detail.Text;
        string postcode = this.postcode.Text;
        string received = this.received.Text;
        string phone = this.phone.Text;

        string sqlinsert = "insert into Address(Uno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone) values('" + uno + "','" + city + "','" + detail + "','" + postcode + "','" + received + "','" + phone + "')";  //插入新用户信息

        OperateDataBase obd = new OperateDataBase();
        bool add = obd.ExceSql(sqlinsert);
        if (add == true)
        {
            Response.Write("<script>window.alert('保存成功!');</script>");
            this.city.Text = null;
            this.detail.Text = null;
            this.postcode.Text = null;
            this.received.Text = null;
            this.phone.Text = null;
        }
        else
        {
            Response.Write("<script>window.alert('保存失败!');</script>");
        }

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
        string sqlSelect = String.Format("select ADno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone from Address where Uno='" + uno + "'");
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

    protected void btn_address_again_click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string adno = (((Button)sender).CommandArgument.ToString()).ToString(); ;
        string city = Request["city2"];
        string detail = Request["detail2"];
        string postcode = Request["postcode2"];
        string received = Request["received2"];
        string phone = Request["phone2"];
        string city2 = "";
        string detail2 = "";
        string postcode2 = "";
        string received2 = "";
        string phone2 = "";
        if (city.Contains(","))
        {
            int endIndex = city.IndexOf(",");
            city2 = city.Substring(0, endIndex);
        }
        else
        {
            city2 = city;
        }
        if (detail.Contains(","))
        {
            int endIndex = detail.IndexOf(",");
            detail2 = detail.Substring(0, endIndex);
        }
        else
        {
            detail2 = detail;
        }
        if (postcode.Contains(","))
        {
            int endIndex = postcode.IndexOf(",");
            postcode2 = postcode.Substring(0, endIndex);
        }
        else
        {
            postcode2 = postcode;
        }
        if (received.Contains(","))
        {
            int endIndex = received.IndexOf(",");
            received2 = received.Substring(0, endIndex);
        }
        else
        {
            received2 = received;
        }
        if (phone.Contains(","))
        {
            int endIndex = phone.IndexOf(",");
            phone2 = phone.Substring(0, endIndex);
        }
        else
        {
            phone2 = phone;
        }
        string sqlUpdate = "update Address set ADcity='" + city2 + "',ADdetail='" + detail2 + "',ADpostcode='" + postcode2 + "',ADrecipient='" + received2 + "',ADphone='" + phone2 + "' where Uno='" + uno + "' and ADno='" + adno + "'";
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
        string sqlSelect = String.Format("select ADno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone from Address where Uno='" + uno + "'");
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

    protected void btn_address_delete_click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string[] address = ((Button)sender).CommandArgument.ToString().Split(',');
        string adno = Convert.ToString(address[0]);
        string adrecipient = Convert.ToString(address[1]);
        string adcity = Convert.ToString(address[2]);
        string addetail = Convert.ToString(address[3]);
        string adpostcode = Convert.ToString(address[4]);
        string adphone = Convert.ToString(address[5]);
        string sqldelete = "delete from Address where Uno='" + uno + "' and ADno='" + adno + "'";  //删除信息

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
        string sqlSelect = String.Format("select ADno,ADcity,ADdetail,ADpostcode,ADrecipient,ADphone from Address where Uno='" + uno + "'");
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
        Response.Redirect("address.aspx");
    }
}