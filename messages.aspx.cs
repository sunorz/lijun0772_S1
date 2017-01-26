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

public partial class messages : System.Web.UI.Page
{
    private int rowscount = 0;
    protected int RowsCount
    {

        get { return rowscount; }
        set { this.rowscount = value; }
    }    

    protected void Page_Load(object sender, EventArgs e)
    {
        footerload();
        Page();
      }
    protected void btnCommit_click(object sender, ImageClickEventArgs e)
    {
        txtcname.Text = txtcname.Text.Replace(" ", "");//去空格
        txtcmail.Text = txtcmail.Text.Replace(" ", "");
         string pname = txtcname.Text;
        string pmail = txtcmail.Text;
        string pcontent = txtccontent.Text;
        if (pcontent.Length > 280)
        {
            Response.Write("<script type='text/javascript'>alert('超过字数限制！');window.location.href=window.location.href; </script>");
        }
        else
        {
            if (pcontent.Trim() == "" || pcontent.Trim() == "报修请直接联系我们，请不要在此输入！")
            {
                Response.Write("<script type='text/javascript'>alert('没有新内容！');window.location.href=window.location.href; </script>");
            }
            else
            {
                int ispub=1;
                if (cbpub.Checked==false)
                {
                    ispub = 0;
                }
                string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                DateTime dt = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "China Standard Time");//转东八区
                string st = "insert into Mess (pname,pmail,pcontent,pposttime,ispub) values('" + @pname + "','" + @pmail + "','" + @pcontent + "','"+@dt+"','" + @ispub + "')";
                con.Open();
                SqlCommand cmd = new SqlCommand(st, con);
                int ret = cmd.ExecuteNonQuery();//返回受影响的行数
                if (ret!=0)
                {
                    con.Close();
                    txtcname.Text = "";
                    txtcmail.Text = "";
                    txtccontent.Text = " ";
                    Response.Write("<script type='text/javascript'>alert('谢谢您的支持！');window.location.href='messages.aspx?Page=1'; </script>");
                    dvmess.Visible = false;
                    close.Visible = false;
                    Page();
                }
                else
                {
                    con.Close();
                    Response.Write("<script type='text/javascript'>alert('发送失败！');window.location.href=window.location.href; </script>");

                }
            }
        }
    }
               
	
	protected void btnReset_click(object sender,ImageClickEventArgs e)
	{
		txtccontent.Text=" ";
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
            this.Label4.Text = Server.HtmlDecode(rdr["content"].ToString());
            cnn.Close();
        }
    }
  
    protected void close_Click(object sender, ImageClickEventArgs e)
    {
        dvmess.Visible = false;    
    }
    protected void btnnew_Click(object sender, EventArgs e)
    {
        dvmess.Visible = true;
        txtccontent.Attributes.Add("Value", "报修请直接联系我们，请不要在此输入！");
        txtccontent.Attributes.Add("OnFocus", "if(this.value=='报修请直接联系我们，请不要在此输入！'){this.value=''}");
        txtccontent.Attributes.Add("OnBlur", "if(this.value==''){this.value='报修请直接联系我们，请不要在此输入！'}");
 
    }
  public void Page() { 
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select * from Mess where ispub=1 order by pid";
        cnn.Open();
        SqlDataAdapter da = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataColumn col = ds.Tables[0].Columns.Add("state", typeof(bool));//自定义列state，判断reply是否为空，绑定Datalist中的“回复：”
        RowsCount = ds.Tables[0].Rows.Count;//为RowsCount赋值
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
                    ds.Tables[0].Rows[k]["state"] = true;
                }
            }
        }
        DataColumn col2 = ds.Tables[0].Columns.Add("rowsid", typeof(int));//序号
                   for (int i = 0; i < RowsCount; i++) {
                       ds.Tables[0].Rows[i]["rowsid"] = i + 1;
            }
        ds.AcceptChanges();//保存更改
        PagedDataSource objPds = new PagedDataSource(); //自定义分页绑定
        objPds.DataSource = ds.Tables[0].DefaultView; 
        objPds.AllowPaging = true; 
        objPds.PageSize = 5; 
              if (dlmess == null || RowsCount<= 0)
        {
            dvpage.Visible = false;
        }
        int CurPage;
        string pagers=Request.QueryString["Page"] ;
        CurPage=Convert.ToInt32(pagers);
      if(pagers==null)//如果pagers为空
      {
          CurPage=1;
      }
      else if(CurPage>objPds.PageCount||CurPage<1)  //如果pagers不在范围内
      {
           CurPage=1;
      }
      else
        {
            CurPage = Convert.ToInt32(Request.QueryString["Page"]);
        }       
       objPds.CurrentPageIndex = CurPage-1;
      lblCurrentPage.Text = "当前页："+ CurPage.ToString();

      if (!objPds.IsFirstPage)
      {
          lnkPrev.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage - 1);//上一页
          lnkFirst.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=1";//第一页
      }
      else
      {
          lnkPrev.Visible = false;
          lnkFirst.Visible = false;
      }

      if (!objPds.IsLastPage)
      {
          lnkNext.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(CurPage + 1);//下一页
          lnkLast.NavigateUrl = Request.CurrentExecutionFilePath + "?Page=" + Convert.ToString(objPds.PageCount);//最后一页
      }
      else
      {
          lnkNext.Visible = false;
          lnkLast.Visible = false;
      }
      DataTable dt = ds.Tables[0];//倒序显示在DataList
      DataView dv = new DataView();
      dv.Table = dt;
      dv.Sort = "pid desc";
      dlmess.DataSource=dv; 
      dlmess.DataBind();
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
 
}

    
         

