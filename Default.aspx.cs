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
using System.Text;

public partial class Default: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(connectionString);
            string st = "select * from Class where classid=1";
            cnn.Open();
            SqlCommand cmd = new SqlCommand(st, cnn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.Read())
            {
                this.Label1.Text = Server.HtmlDecode(rdr["content"].ToString());//��ȡ���ȴ�������ݿ��HTML����
                title.InnerText = rdr["cltitle"].ToString();
                cnn.Close();
                footerload();
            }
            else
            {
                this.Label1.Text = "���������ݣ���";
                cnn.Close();
            }


        }
    }

    public string getItems()
    {
        StringBuilder sb = new StringBuilder();
        string connectionString = ConfigurationManager.ConnectionStrings["lijunConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(connectionString);
        string st = "select * from Photo where alid=3 order by poid desc";
        cnn.Open();
        SqlDataAdapter adp = new SqlDataAdapter(st, cnn);
        DataSet ds = new DataSet();
        adp.Fill(ds, "honour");
        DataTable dt = ds.Tables["honour"];
        int rowcount = dt.Rows.Count;
        for (int i = 0; i < rowcount; i++)
        {
            string psmurl = dt.Rows[i]["psmurl"].ToString().Replace("~/imgs", "imgs");
            string pourl = dt.Rows[i]["pourl"].ToString().Replace("~/imgs", "imgs");
            sb.Append("theAutoScroll.addItem('" + psmurl + "','" + pourl + "',\"ͼƬ1\",\"_blank\")\n");
        }
        cnn.Close();
        return sb.ToString();
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
}
