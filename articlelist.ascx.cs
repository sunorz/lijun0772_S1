using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class articlelist : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.HeaderRow.Visible = false;
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
