<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminlogin.aspx.cs" Inherits="adminlogin"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="adminsty.css" />
<title>管理员登录</title>
</head>
<body>
<script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
    <form id="form1" runat="server" autocomplete="off">
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
    <td colspan="9" align="left" valign="middle" bgcolor="#ff7d23" class="style1">丽军数码</td>
    </tr>
      <tr>
    <td height="15" colspan="17" bgcolor="#585858"></td>
  <tr>
  <tr>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="Default.aspx" target="_blank"><h2>网站首页</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="show.aspx" target="_blank"><h2>配件展示</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="error.aspx" target="_blank"><h2>常见故障</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="fix.aspx" target="_blank"><h2>报修流程</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="bbs.aspx" target="_blank"><h2>维修论坛</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="shop.aspx" target="_blank"><h2>网店介绍</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#ff7d23"> <a href="staff.aspx" target="_blank"><h2>人才招聘</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="messages.aspx" target="_blank"><h2>网上留言</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="connect.aspx" target="_blank"><h2>联系我们</h2></a></td>
  </tr>  <tr>
  <td height="15" colspan="17" align="center" bgcolor="#FFFFFF">
          <p><br /></p>
        <h1>&nbsp;&nbsp;</h1>
        <table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td align="center"><h1>后台管理</h1></td>
          </tr>
          <tr>
            <td align="center">            
                用户名
              <asp:TextBox ID="admin" runat="server" Width="200px" class="txt3" BackColor="Silver" maxlength="30"></asp:TextBox>
              <br />
              <br />
              <br />
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码
              <asp:TextBox ID="pwd" runat="server" Width="200px" class="txt3" 
                    BackColor="Silver" maxlength="30" textmode="password" Font-Bold="False"></asp:TextBox>
                <asp:Button ID="btnCeuser" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" OnClick="btnForget_Click" Text="忘记密码？" 
                    UseSubmitBehavior="False" />
            </td>
          </tr>
        </table>
        
                <div id="aptips" runat="server" class="aptips"></div>
 <br />            
  </tr>
  <tr>
    <td colspan="9" align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">&nbsp;&nbsp;&nbsp;&nbsp; <asp:ImageButton ID="btnLogin" runat="server" ImageUrl="~/imgs/loginbtn.gif" OnClick="btnLogin_click"/>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnReset" runat="server" ImageUrl="~/imgs/clearbtn.gif" OnClick="btnReset_click"/>            <p><br />
             <br />
            <br />
             <br /></p></td>
  </tr>
  <tr>
    <td height="40" colspan="9" bgcolor="#A1A1A1"  class="footer"><p>&nbsp;</p>
                     <p>&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </p>
</td>
  </tr>
</table>
    </form>
</body>
</html>