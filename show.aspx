<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="show"%>
<%@ Register src="gotop.ascx" tagname="gotop" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>��������-���չʾ</title></head>
    <style type="text/css">
		#title{
	line-height:5pt;
	font-family:"����";
	font-size:20pt;
    color:#ffffff;
    line-height:40pt;
	letter-spacing:8pt;
}
 a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
    body {
	background-image: url(imgs/class/14172918940_1f8c6ed0b4_h.jpg);
	background-repeat: repeat;
	background-attachment: fixed;
}
    </style>

<body>
<div id="apDiv2" class="toplnk"><uc1:gotop ID="gotop1" runat="server" /></div>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
    <form id="form1" runat="server">
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
    <td height="49px" colspan="8" valign="middle" class="foote"><a href="Default.aspx" title="������ҳ"><img src="imgs/logo.gif" width="100px" height="49px" border="0"/></a>����������Ӱ����ά������</td>
    <td height="49px" align="center" valign="middle" class="foote"><a href="showsea.aspx" title="�������"><img src="imgs/search.gif" width="40" height="48" border="0" /></a></td>
  </tr>
  <tr>
    <td height="20" colspan="9">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="9" align="center" bgcolor="#585858"></td>
  </tr>  
  <tr>
     <td  align="center" valign="middle" bgcolor="#647588"><a href="Default.aspx"><h2>��վ��ҳ</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#66CCC1"><h2>���չʾ</h2></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="error.aspx"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="fix.aspx"><h2>��������</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="bbs.aspx"><h2>ά����̳</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="shop.aspx"><h2>�������</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#647588"> <a href="staff.aspx"><h2>�˲���Ƹ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="messages.aspx"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="connect.aspx"><h2>��ϵ����</h2></a></td>
  </tr>  
     <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
<tr>
<td colspan="9" align="middle" valign="middle">
        <img src="imgs/class/img2.gif" width="200" height="194" /><div id="title" runat="server">���չʾ</div></td>
        </tr>
  <tr>
    <td colspan="9" align="center" bgcolor="#CCCCCC">
        <table width="100%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td align="center" bgcolor="#CCCCCC">
              <asp:FormView ID="fvphoto" runat="server" AllowPaging="True" PageSize="1"
                    DataSourceID="SqlDataSource1" DataKeyNames="poid" CellPadding="3" 
                    BackColor="#CCCCCC" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    GridLines="Vertical" HorizontalAlign="Center">
                    <PagerSettings FirstPageText="��һҳ&nbsp;" LastPageText="���һҳ" 
                        Mode="NextPreviousFirstLast" NextPageText="��һҳ&nbsp;" PageButtonCount="5" 
                        PreviousPageText="��һҳ&nbsp;" Position="Top" />
                    <FooterStyle BackColor="#FFFFFF" ForeColor="Black" />
                    <RowStyle BackColor="#cccccc" ForeColor="White" />
                    <EditItemTemplate>                       
                    </EditItemTemplate>
                    <InsertItemTemplate>                     
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <span class="contents"><asp:Label ID="Label4" runat="server" 
                            Text='<%# Eval("poname") %>' Font-Names="arial,����,sans-serif;" ForeColor="Black"></asp:Label></span>
                        <br />
                        <br />
                        <asp:Image ID="Image1" Width="100%" Height="100%" runat="server" ImageUrl='<%# Eval("pourl") %>' />
                    </ItemTemplate>
                    <PagerStyle BackColor="#FF7D23" ForeColor="White"  HorizontalAlign="Center" 
                        Font-Bold="True" Font-Overline="False" Font-Size="Medium" 
                        Font-Underline="True"/>
                    <EmptyDataTemplate>
                        û��ͼƬ��
                    </EmptyDataTemplate>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                </asp:FormView>   
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"
                    SelectCommand="SELECT * FROM [Photo] WHERE ([alid] = @alid)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="alid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br /><br /><br /><br />
              <div class="bshare-custom"><div class="bsPromo bsPromo2"></div><a title="��������΢��" class="bshare-sinaminiblog"></a><a title="������Ѷ΢��" class="bshare-qqmb"></a><a title="����i����" class="bshare-itieba" href="javascript:void(0);"></a><a title="����Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="����Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="����ƽ̨" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;">
                  </span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></td>
          </tr>
          </table> </table>   
        <br />
        <br />
      
      </td>
  </tr>
  <tr>
    <td height="40" colspan="9" class="footer">
           <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p>
      <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">����Ա��¼</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">���ڱ�վ����</a></p>
  </td>
  </tr>
</table>
    </form>
</body>
</html>
