using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data.SqlClient;

public partial class detail: System.Web.UI.Page
{
     private int rowscount = 0;
         protected int RowsCount
         { 

              get{ return rowscount;}
              set{ this.rowscount = value; }
         }    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getnews();
            string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);
            string newid = Request.QueryString["id"];
            string st = "select * from Article where artid='" + @newid+ "'";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(st, cnn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (!rdr.Read())//如果id未输入或者错误
            {
                commpo.Visible = false;
                share.Visible = false;
                Label1.Visible = true;
                btngood.Visible = false;
                cnn.Close();
                Label5.Visible = false;
                banner.Visible = false;
            }
            else
            {
                bind1();
                bind2();
                showgood();
                cnn.Close();
                txtcomment.Attributes.Add("Value", "请不要输入包含个人隐私（账号密码等）的内容，谢谢！");
                txtcomment.Attributes.Add("OnFocus", "if(this.value=='请不要输入包含个人隐私（账号密码等）的内容，谢谢！'){this.value=''}");
                txtcomment.Attributes.Add("OnBlur", "if(this.value==''){this.value='请不要输入包含个人隐私（账号密码等）的内容，谢谢！'}");
            }
            showfoot();
           
        }
    }
    //赞的实现方法
    protected void btngood_Click(object sender, ImageClickEventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string newid = Request.QueryString["id"];
        string st = "update Article set good=good+1 where artid='" + @newid + "'";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        int ret = cmd.ExecuteNonQuery();//返回受影响的行数
        if (ret != 0)
        {
            cnn.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('谢谢支持！');</script>");
            showgood();
        }
        else
        {
            cnn.Close();
                    }
    }
    
    protected void btnPost_Click(object sender, EventArgs e)
    {

        string comment = txtcomment.Text;
        string cmail = txtmail.Text;
        string coname = txtname.Text;
        if (coname.Trim() == "")
        {
            aptips.InnerText = "请输入昵称！ ";

        }
        else if (cmail.Trim() == "")
        {
            aptips.InnerText = "请输入邮箱！";

        }
        else if (comment.Trim() == "" || comment.Trim() == "请不要输入包含个人隐私（账号密码等）的内容，谢谢！")
        {
            aptips.InnerText = "没有输入评论！";


        }
        else if (comment.Length > 140)
         {
             aptips.InnerText = "字数太多了！";
         }

         else
         {
             string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
             SqlConnection cnn = new SqlConnection(connectionString);
             string newid = Request.QueryString["id"];
             DateTime dt = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "China Standard Time");//转东八区
             string st = "insert into Comment (aid,comment,cposttime,coname,comail) values('" + @newid + "','" + @comment + "','" + @dt + "','" + @coname + "','" + @cmail + "')";
             cnn.Open();
             SqlCommand cmd = new SqlCommand(st, cnn);
             SqlDataReader rdr = cmd.ExecuteReader();
             Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('评论成功！');window.location.href=window.location.href; </script>");
             txtcomment.Text = "";
             bind1();
         }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtname.Text = "";
        txtmail.Text="";
        txtcomment.Text="";
    }

    protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("bbs.aspx");
    }
    protected void showfoot()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select * from Class where classid=7";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            this.Label3.Text = Server.HtmlDecode(rdr["content"].ToString());
          }
        cnn.Close();
    }
    protected void showgood()//获取赞的数量
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string newid = Request.QueryString["id"];
        string st = "select * from Article where artid='" + @newid + "'";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            this.Label4.Text = rdr["good"].ToString();
        }
        cnn.Close();
    }
    protected void bind1()
    {
       string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string newid = Request.QueryString["id"];
        string st = "select * from Comment where aid='" + @newid + "' order by comid desc";
        cnn.Open();
        SqlDataAdapter da = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataColumn col=ds.Tables[0].Columns.Add("state",typeof(bool));//自定义列state，判断reply是否为空，绑定Datalist中的“回复：”
        RowsCount = ds.Tables[0].Rows.Count;//为RowsCount赋值，用于显示楼层
        for (int k = 0; k < ds.Tables[0].Rows.Count; k++)//遍历DataTable，将自定义的state列赋值
        {
            for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
            {
                if (ds.Tables[0].Rows[k]["reply"].ToString().Trim() == "")
                {
                    ds.Tables[0].Rows[k]["state"] = false;//如果
                }
                else
                {
                    ds.Tables[0].Rows[k]["state"] =true;
                }
            }
        }
        ds.AcceptChanges();//保存更改
        dlcom.DataSource = ds;
        dlcom.DataBind();
        if (dlcom.Items.Count == 0)
        {
            Label5.Visible = false;
        }
        ds.Clear();
        cnn.Close();
    }
    protected void bind2()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string newid = Request.QueryString["id"];
        string st = "select * from Article where artid='" + @newid + "'";
        SqlDataAdapter da = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        fvtxt.DataSource = ds;
        fvtxt.DataBind();
        ds.Clear();
        cnn.Close();
    }
      //缩短
    public string SubStr(object caption, int nLeng)
    {
        string sString = caption.ToString().Trim();
        if (sString.Length <= nLeng)
        {
            return sString;
        }
        else
        {
            string sNewStr = sString.Substring(0, nLeng);
            sNewStr = sNewStr + "..."; return sNewStr;
        }
    }
    protected void getnews()//用于显示上一篇、下一篇文章
    {
        int newsid = Convert.ToInt32(Request.QueryString["id"]);
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select top 1 * from Article where artid<" + newsid + " order by artid desc";
        string st2 = "select top 1 *  from  Article  where artid>" + newsid + " order by artid"; 
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        SqlCommand cmd2 = new SqlCommand(st2, cnn);
        SqlDataReader rdr = cmd.ExecuteReader();
        if (rdr.Read())
        {
            hlpre.Text = rdr["artitle"].ToString();
            hlpre.Enabled = true;
            hlpre.NavigateUrl = "detail.aspx?id=" + rdr["artid"].ToString();
            cnn.Close();
        }
        else
        {
            cnn.Close();
        }
         cnn.Open();
         SqlDataReader rdr2 = cmd2.ExecuteReader();
         if (rdr2.Read())
         {
             hlnext.Text = rdr2["artitle"].ToString();
             hlnext.Enabled = true;
             hlnext.NavigateUrl = "detail.aspx?id=" + rdr2["artid"].ToString();
             cnn.Close();
         }
         else
         {
             cnn.Close();
         }

    }
}
