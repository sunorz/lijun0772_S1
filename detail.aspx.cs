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
            if (!rdr.Read())//���idδ������ߴ���
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
                txtcomment.Attributes.Add("Value", "�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��");
                txtcomment.Attributes.Add("OnFocus", "if(this.value=='�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��'){this.value=''}");
                txtcomment.Attributes.Add("OnBlur", "if(this.value==''){this.value='�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��'}");
            }
            showfoot();
           
        }
    }
    //�޵�ʵ�ַ���
    protected void btngood_Click(object sender, ImageClickEventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string newid = Request.QueryString["id"];
        string st = "update Article set good=good+1 where artid='" + @newid + "'";
        cnn.Open();
        SqlCommand cmd = new SqlCommand(st, cnn);
        int ret = cmd.ExecuteNonQuery();//������Ӱ�������
        if (ret != 0)
        {
            cnn.Close();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('лл֧�֣�');</script>");
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
            aptips.InnerText = "�������ǳƣ� ";

        }
        else if (cmail.Trim() == "")
        {
            aptips.InnerText = "���������䣡";

        }
        else if (comment.Trim() == "" || comment.Trim() == "�벻Ҫ�������������˽���˺�����ȣ������ݣ�лл��")
        {
            aptips.InnerText = "û���������ۣ�";


        }
        else if (comment.Length > 140)
         {
             aptips.InnerText = "����̫���ˣ�";
         }

         else
         {
             string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
             SqlConnection cnn = new SqlConnection(connectionString);
             string newid = Request.QueryString["id"];
             DateTime dt = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(DateTime.Now, "China Standard Time");//ת������
             string st = "insert into Comment (aid,comment,cposttime,coname,comail) values('" + @newid + "','" + @comment + "','" + @dt + "','" + @coname + "','" + @cmail + "')";
             cnn.Open();
             SqlCommand cmd = new SqlCommand(st, cnn);
             SqlDataReader rdr = cmd.ExecuteReader();
             Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script type='text/javascript'>alert('���۳ɹ���');window.location.href=window.location.href; </script>");
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
    protected void showgood()//��ȡ�޵�����
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
        DataColumn col=ds.Tables[0].Columns.Add("state",typeof(bool));//�Զ�����state���ж�reply�Ƿ�Ϊ�գ���Datalist�еġ��ظ�����
        RowsCount = ds.Tables[0].Rows.Count;//ΪRowsCount��ֵ��������ʾ¥��
        for (int k = 0; k < ds.Tables[0].Rows.Count; k++)//����DataTable�����Զ����state�и�ֵ
        {
            for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
            {
                if (ds.Tables[0].Rows[k]["reply"].ToString().Trim() == "")
                {
                    ds.Tables[0].Rows[k]["state"] = false;//���
                }
                else
                {
                    ds.Tables[0].Rows[k]["state"] =true;
                }
            }
        }
        ds.AcceptChanges();//�������
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
      //����
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
    protected void getnews()//������ʾ��һƪ����һƪ����
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
