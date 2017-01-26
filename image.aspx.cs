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

public partial class image: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["suadmin"] == null)
        {
            Response.Write("<script type='text/javascript'>alert('登录超时！');window.location.href='Default.aspx';</script>");
        }

        else
        {
            if (!IsPostBack)
            {
                this.Label1.Text = "欢迎管理员：" + Session["issuper"];
                footerload();
                bind();
                
                }
                
                
           }
        }    


     protected void btnBack_click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("photo.aspx");
    }
    protected void btnLogout_click(object sender, ImageClickEventArgs e)
    {
        Session["issuper"] = null;
        Session["suadmin"] = null;
        Response.Write("<script type='text/javascript'>window.location.href='Default.aspx';</script>");
    }
    protected void footerload()
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
            cnn.Close();
        }
    }
    protected void bind()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string imgid = Request.QueryString["pid"];
        string st = "select * from Photo where poid='" + @imgid + "'";
        SqlDataAdapter da = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        fvimage.DataSource = ds;
        fvimage.DataBind();
        ds.Clear();
        cnn.Close();
    }
  
}
