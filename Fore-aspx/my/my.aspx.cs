using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

public partial class My : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["Uno"] != null)
            {
                string uno = Session["Uno"].ToString();  //读取缓存id
                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";  //连接数据库
                string sqlSelect = String.Format("select * from Users where Uno='" + uno + "'");  //查找id的用户信息
                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    SqlCommand sqlComGet = new SqlCommand(sqlSelect, sqlCon);
                    SqlDataReader reader = sqlComGet.ExecuteReader();
                    if (reader.Read())
                    {
                        this.uno.Text = reader.GetString(0);  //账号
                        this.uname.Text = reader.GetString(1);  //昵称

                        if (reader.GetString(3) == "男")  //判断性别
                            this.sex_RadioButtonList.SelectedIndex = 0;
                        else
                            this.sex_RadioButtonList.SelectedIndex = 1;
                        this.uphone.Text = reader.GetString(4);  //手机号码
                    }
                }
                string sqlSelect2 = String.Format("select SUBSTRING(Uportrait, 1, CHARINDEX('.',Uportrait)-1) as uportrait from Users where Uno='" + uno + "'");

                using (SqlConnection sqlCon = new SqlConnection(str))
                {
                    sqlCon.Open();
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect2, str); //创建DataAdapter数据适配器实例
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

    protected void btn_change_Click(object sender, EventArgs e)  //修改密码
    {
        Response.Redirect("changepsss.aspx");
    }

    protected void btn_preservation_Click(object sender, EventArgs e)
    {
        string uno = Session["Uno"].ToString();
        string uname = Request["uname"];
        string usex = "";
        string uphone = Request["uphone"];
        if (this.sex_RadioButtonList.SelectedValue == "1")
        {
            usex = "男";
        }
        else
        {
            usex = "女";
        }

        string sqlUpdate = "update Users set Uname='" + uname + "', Usex='" + usex + "', Uphone='" + uphone + "' where Uno='" + uno + "'";

        string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlCommand sqlComGet = new SqlCommand(sqlUpdate, sqlCon);
            int n = sqlComGet.ExecuteNonQuery();
            if (n <= 0)
            {
                Response.Write("<script language=javascript>alert('更新失败');</script> ");
            }
            else
            {
                Response.Write("<script>window.alert('更新成功！');</script>");
            }
        }

        string sqlSelect = String.Format("select * from Users where Uno='" + uno + "'");  //查找id的用户信息
        using (SqlConnection sqlCon = new SqlConnection(str))
        {
            sqlCon.Open();
            SqlCommand sqlComGet = new SqlCommand(sqlSelect, sqlCon);
            SqlDataReader reader = sqlComGet.ExecuteReader();
            if (reader.Read())
            {
                this.uno.Text = reader.GetString(0);  //账号
                this.uname.Text = reader.GetString(1);  //昵称

                if (reader.GetString(3) == "男")  //判断性别
                    this.sex_RadioButtonList.SelectedIndex = 0;
                else
                    this.sex_RadioButtonList.SelectedIndex = 1;
                this.uphone.Text = reader.GetString(4);  //手机号码

            }
        }
    }


    //protected string DefaultTitle = ConfigurationSettings.AppSettings["SystemName"].ToString();             //获取系统名称
    //protected string strConn = ConfigurationSettings.AppSettings["strSqlConn"].ToString();                  //获取数据库连接字条串
    //protected string UploadFileTypes = ConfigurationSettings.AppSettings["UploadFileType"].ToString();            //获取允许上传的格式
    //protected string UploadSavePath = ConfigurationSettings.AppSettings["UploadSavePath"].ToString();       //获取附件保存根目录,如upfiles/

    //protected void BtUpLoad_Click(object sender, EventArgs e)
    //{
    //    string uno = Session["Uno"].ToString();
    //    string filePath;                                      //文件路径
    //    string fileName;                                      //附件名称
    //    int fileSize;                                      //附件大小
    //    string fileType;                                      //附件格式
    //    string sAbsoluteSavePath;                             //服务器端附件保存根目录
    //    string sFileSaveName;                                 //附件保存在服务器上的名称
    //    int tt;
    //    if (fileuploadid.PostedFile.FileName != "")
    //    {
    //        filePath = fileuploadid.PostedFile.FileName;
    //        fileName = Path.GetFileName(filePath);                           //原始附件名称
    //        fileSize = fileuploadid.PostedFile.ContentLength;               //附件大小
    //        tt = fileName.LastIndexOf(".");
    //        fileType = fileName.Substring(tt).ToLower();                   //附件格式,小写
    //        sAbsoluteSavePath = Path.Combine(Request.MapPath(UploadSavePath));
    //        sFileSaveName = DateTime.Now.ToString("yymmddhhmmss") + fileType;
    //        if (fileSize > 0 && fileType.Length > 0 && ("|" + UploadFileTypes + "|").IndexOf("|" + fileType + "|") > -1)
    //        {
    //            try
    //            {
    //                string strConn = "server=.; database=SweetyDB; uid=aa; pwd=123456"; //连接数据库
    //                string sqlUpdate;
    //                fileuploadid.PostedFile.SaveAs(Path.Combine(sAbsoluteSavePath, sFileSaveName));
    //                SqlConnection sqlcon = new SqlConnection(strConn);
    //                sqlUpdate = "update Users set Uportrait = '" + sFileSaveName + "' where Uno ='" + uno + "'";
    //                SqlCommand sqlcom = new SqlCommand(sqlUpdate, sqlcon);
    //                sqlcon.Open();
    //                sqlcom.ExecuteNonQuery();
    //                Response.Write("<script>alert('上传成功!');</script>");

    //                string str = "server=.; database=SweetyDB; uid=aa; pwd=123456";  //连接数据库
    //                string sqlSelect = String.Format("select SUBSTRING(Uportrait, 1, CHARINDEX('.',Uportrait)-1) as uportrait from Users where Uno='" + uno + "'");
    //                using (SqlConnection sqlCon = new SqlConnection(str))
    //                {
    //                    sqlCon.Open();
    //                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect, str); //创建DataAdapter数据适配器实例
    //                    DataSet ds = new DataSet();//创建DataSet实例
    //                    da.Fill(ds); //贴数据，说白了就是把数据贴到数据集上
    //                    Repeater1.DataSource = ds; //我们的Repeater控件ID为： repeater_info，这里调用.DataSource方法加载数据源头
    //                    Repeater1.DataBind(); //用DataBind方法绑定具体的控件
    //                }
    //            }
    //            catch (Exception ex)
    //            {
    //                Response.Write("错误：" + ex.Message);
    //            }
    //        }
    //    }
    //    else
    //    {
    //        Response.Write("<script>alert('请选择文件!');</script>");
    //    }
    //}
}