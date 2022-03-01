using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class my_changepsss : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        string id;
        id = Session["Uno"].ToString();
        string Old_Password = this.Old_Password.Text;
        string New_Password = this.New_Password.Text;
        string Newpass_again = this.Newpass_again.Text;

        string sqlUpdate = "Update Users set Upasswd='" + New_Password + "' where Uno='" + id + "' and Upasswd='" + Old_Password + "'";

        OperateDataBase obd = new OperateDataBase();
        if (New_Password == Newpass_again)
        {
            bool add = obd.ExceSql(sqlUpdate);
            if (add == true)
            {
                Response.Write("<script>window.alert('修改成功!');</script>");
            }
            else
            {
                Response.Write("<script>window.alert('修改失败!');</script>");
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("my.aspx");
    }
}