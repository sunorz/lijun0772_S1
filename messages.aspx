<%@ Page Language="C#" AutoEventWireup="true" CodeFile="messages.aspx.cs" Inherits="messages" Debug="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>��������-��������</title></head>
    <style type="text/css">
         .style2
        {
            color: #FF7D23;
            font-weight: bold;
            font-size: 15px;
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
	background-image: url(imgs/class/20130815141708_2KMMS.jpg);
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
        </style>

<body>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
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
    <td  align="center" valign="middle" bgcolor="#647588"><a href="bbs.aspx"><h2>ά����̳</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="shop.aspx"><h2>�������</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#647588"><a href="staff.aspx"><h2>�˲���Ƹ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#66CCC1"><h2>��������</h2></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="connect.aspx"><h2>��ϵ����</h2></a></td>
  </tr>  
  <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
      <tr>
        <td colspan="9" align="middle" valign="middle"><img src="imgs/class/img8.gif" width="200" height="194" /><div id="title" runat="server">���԰�</div></td></tr>
        <tr>
          <td align="center" bgcolor="#FFFFFF">              <br />
              <br /><asp:Button ID="btnnew" runat="server" BackColor="#FF7D23" 
                              BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                              ForeColor="White" OnClick="btnnew_Click" Text="��Ҫ����" 
                  UseSubmitBehavior="False" />
              <br />
              <br />
            </td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF" align="center"><div id="dvmess" class="divcss" runat="server" visible="false">
             <div id="dvclose" style="text-align: right" visible="false">
              <asp:ImageButton ID="close" runat="server" title="�ر�" 
                  ImageUrl="~/imgs/close.gif" CausesValidation="False" onclick="close_Click"/></div><br />
              <br />
              <asp:Label ID="Label3" runat="server" Text="�����ߣ�"></asp:Label>
              &nbsp;&nbsp;
            <asp:TextBox ID="txtcname" runat="server" BackColor="Silver" class="txt3" maxlength="20"></asp:TextBox>
            
            
            <asp:RequiredFieldValidator runat="server" ErrorMessage="�������ǳƣ�" 
                    Display="Dynamic" ControlToValidate="txtcname" Font-Bold="True"></asp:RequiredFieldValidator>
              <br />
              <br />
            <asp:Label ID="Label1" runat="server" Text="�����ַ��"></asp:Label>
            <asp:TextBox ID="txtcmail" runat="server" Width="285px" BackColor="Silver" class="txt3" maxlength="30"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ErrorMessage="�����ʼ�����Ϊ�գ�" Display="Dynamic" 
                                    ControlToValidate="txtcmail" Font-Bold="True"></asp:RequiredFieldValidator>
            
            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtcmail" ErrorMessage="�����ʽ����" Font-Bold="True" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>            
              <br />
              <br />
              <br /><p style="text-align: center">
              <asp:Label ID="Label2" runat="server" Text="�������ݣ���140�֣���"></asp:Label>   <asp:RequiredFieldValidator runat="server" ErrorMessage="�������������ݣ�" 
                    Display="Dynamic" ControlToValidate="txtccontent" Font-Bold="True"></asp:RequiredFieldValidator>
            
            <br />
            <br />
            <span class="style2">  
                  <asp:CheckBox ID="cbpub" runat="server" Text="�����ҵ�����" Checked="True" />
                  </span></p>
              <p style="text-align: center">
                  <span class="style2"> <br />
            <asp:TextBox 
                    id="txtccontent" runat="server" Columns="125" Rows="8" 
                    BackColor="Silver" class="txt3" Height="600px" TextMode="MultiLine" 
                    Width="650px">������ֱ����ϵ���ǣ��벻Ҫ�ڴ����룡</asp:TextBox>
              <br />
            <asp:ImageButton ID="btnCommit" runat="server" ImageUrl="~/imgs/sendbtn.gif" OnClick="btnCommit_click"/>
            &nbsp; &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnReset" runat="server" ImageUrl="~/imgs/clearbtn.gif" OnClick="btnReset_click"/></p></div></td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">
            <asp:DataList ID="dlmess" runat="server" BackColor="LightGoldenrodYellow" 
                  BorderColor="Tan" BorderWidth="1px" CellPadding="2"    ForeColor="Black" Font-Bold="False" 
                  Font-Italic="False" Font-Overline="False" Font-Strikeout="False" 
                  Font-Underline="False" HorizontalAlign="Left" Width="891px" AllowPaging="True" >
                  <FooterStyle BackColor="Tan" />
                  <AlternatingItemStyle BackColor="PaleGoldenrod" Wrap="True" />
                  <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                  <HeaderStyle BackColor="Tan" Font-Bold="True" />
                  <ItemTemplate>
                          <span class="style2">
                     <%# Eval("rowsid") %>¥</span>
                          <asp:Label ID="Label5" runat="server" style="font-size: small; color: #FF7D23;" 
                              Text='<%# Eval("pname") %>'></asp:Label>
                          <br />
                          <br />
                          &nbsp;&nbsp;
                          <asp:Label ID="Label6" runat="server" Text='<%#Eval("pcontent")%>'></asp:Label>
                          <br />
                          <br />&nbsp;&nbsp;<span class="style2">����ʱ�䣺</span>
                          <asp:Label ID="Label7" runat="server" style="font-size: small" 
                              Text='<%# Eval("pposttime","{0:yyyy-M-d HH:mm:ss}") %>'></asp:Label>
                          <br />
                          <br />
                      <asp:Label ID="Label9" runat="server" Text="�ظ���" Visible='<%# Eval("state") %>' 
                              style="color: #FF7D23" ></asp:Label><asp:Label ID="Label8" 
                              runat="server" Text='<%# Eval("reply") %>'></asp:Label>
                        
                  </ItemTemplate>
              </asp:DataList>
              
            </td>
        </tr>
        <tr>
          <td bgcolor="#FFFFFF">
              <div id="dvpage" style="padding:5px;background-color:#dedede; text-align: left;" runat="server"> 
 <asp:label ID=lblCurrentPage runat=server></asp:label>
 <asp:HyperLink id=lnkFirst runat=server>��һҳ</asp:HyperLink>&nbsp; 
<asp:HyperLink id=lnkPrev runat=server>��һҳ</asp:HyperLink>&nbsp; 
   <asp:HyperLink id=lnkNext runat=server>��һҳ</asp:HyperLink>&nbsp; 
   <asp:HyperLink id=lnkLast runat=server>���һҳ</asp:HyperLink>  
 </div></td>
        </tr>
        </table>
<br />
      &nbsp;</td>
  </tr>
  <tr>
     <td  class="footer" height="40" colspan="9" bgcolor="#A1A1A1"><p>&nbsp;</p>
            <p>&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text=""></asp:Label></p>
         <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">����Ա��¼</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">���ڱ�վ����</a></p>
</td>
  </tr>
</table>
    </form>
</body>

</html>
