<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bbs.aspx.cs" Inherits="bbs"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>��������-ά����̳</title>
    <style type="text/css">
        .style2
        {
            color: black;
            background-color: #FFFFFF;
             text-align:center;
        }
		#title{
	line-height:5pt;
	font-family:"����";
	font-size:20pt;
    color:#ffffff;
    line-height:40pt;
	letter-spacing:8pt;
}
    body {
	background-image: url(imgs/class/20121024114155_CjSGG.jpeg);
	background-repeat: repeat;
	background-attachment: fixed;
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
        .auto-style1 {
            background-color: #C0C0C0;
        }
    </style>
</head>
  <body>
  <script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
    <form id="form1" runat="server">
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0" class="layout">
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
    <td   align="center" valign="middle" bgcolor="#647588"><a href="show.aspx"><h2>���չʾ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="error.aspx"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="fix.aspx"><h2>��������</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#66CCC1"><h2>ά����̳</h2></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="shop.aspx"><h2>�������</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#647588"> <a href="staff.aspx"><h2>�˲���Ƹ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="messages.aspx"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="connect.aspx"><h2>��ϵ����</h2></a></td>
  </tr>  
  <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
      <tr>
        <td colspan="9" align="middle" valign="middle"><img src="imgs/class/img5.gif" width="200" height="194" /><div id="title" runat="server">ά����̳</div></td>
        </tr>
          <tr>
            <td rowspan="2" align="left" valign="top" bgcolor="#FFFFFF" class="contents">
                <asp:GridView ID="gvart" runat="server" AllowPaging="True" PageSize="20"
                    AutoGenerateColumns="False" CellPadding="4"   ForeColor="#333333" GridLines="None" 
                    Width="696px" DataSourceID="SqlDataSource1" CssClass="auto-style1">
                    <PagerSettings FirstPageText="��һҳ&nbsp;" LastPageText="���һҳ" 
                        Mode="NextPreviousFirstLast" NextPageText="��һҳ&nbsp; " PreviousPageText="��һҳ&nbsp; " />
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("artid", "detail.aspx?id={0}") %>' 
                                    Text='<%# SubStr(Eval("artitle"),19) %>' ToolTip='<% #Eval("artitle")%>'></asp:HyperLink>
                            </ItemTemplate>
                            <ControlStyle Font-Bold="False" Font-Names="΢���ź�" Font-Size="Medium" 
                                Font-Underline="True" ForeColor="Black" />
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False" SortExpression="artmkr">
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# SubStr(Eval("artmkr"),10) %>' ToolTip='<%# Eval("artmkr") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Font-Size="Medium" ForeColor="#666666" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="arttime" SortExpression="arttime" 
                            DataFormatString="{0:yyyy��M��d��}" ShowHeader="False"  >
                            <ControlStyle Font-Size="Smaller" ForeColor="#666666" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle  BackColor="#ffffff" Font-Bold="True" ForeColor="#1C5E55" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        ��û������Ŷ��
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"
                    SelectCommand="SELECT * FROM [Article] order by [artid] desc">
                </asp:SqlDataSource>
              </td>
            <td align="center" valign="top" bgcolor="#FFFFFF">
          <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                    BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                    Width="200px" onprerender="Calendar1_PreRender" ToolTip="����">
                    <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" />
                    <WeekendDayStyle BackColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <OtherMonthDayStyle ForeColor="#808080" />
                    <NextPrevStyle VerticalAlign="Bottom" />
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                    <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                </asp:Calendar>
              </td>
          </tr>
          <tr>
            <td align="center" valign="middle" bgcolor="#FFFFFF" style="text-align: right">
                <asp:GridView ID="gvabl" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4"    ForeColor="White" GridLines="None" AllowPaging="True" 
                    pagesize="5" style="text-align: left">
                    <RowStyle BackColor="#FFFfff" ForeColor="#ffffff" />
                    <Columns>
                        <asp:TemplateField>
                            <EditItemTemplate>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/unlock.gif" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="newl" 
                                    NavigateUrl='<%# Eval("alid", "imagelist.aspx?aid={0}") %>' 
                                    Text='<%# SubStr(Eval("alname"),6) %>' ToolTip='<%#Eval("alname") %>'></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#ffffff" Font-Bold="True"  />
                    <PagerStyle BackColor="#ffffff" ForeColor="#ffffff" HorizontalAlign="Center" />
                    <EmptyDataTemplate>
                        <span class="style2">û����ᣡ</span>
                    </EmptyDataTemplate>
                    <SelectedRowStyle BackColor="#ffffff" Font-Bold="True" ForeColor="#000000" />
                    <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
      </table></td>
  </tr>
  <tr>
     <td  class="footer" height="40" colspan="9" bgcolor="#A1A1A1"><p>&nbsp;</p>
   <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text=""></asp:Label></p>
            <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">����Ա��¼</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">���ڱ�վ����</a></p>
</td>
  </tr>
</table>
    </form>
</body>
</html>
