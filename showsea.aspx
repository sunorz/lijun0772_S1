<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showsea.aspx.cs" Inherits="showsea"%>
<%@ Register src="gotop.ascx" tagname="gotop" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>丽军数码-站内搜索</title>
 <style type="text/css">
        .style2
        {
            color: #FF7D23;
            font-weight: bold;
            font-size: 15px;
        }
#title{
	line-height:5pt;
	font-family:"楷书";
	font-size:20pt;
    color:#ffffff;
    line-height:40pt;
	letter-spacing:8pt;
}
    body {
	background-image: url(imgs/class/20140523145356_Bnrfn.jpg);
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
</style></head>
<body>
<div id="apDiv2" class="toplnk"><uc1:gotop ID="gotop1" runat="server" /></div>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
    <form id="form1" runat="server">
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0" class="layout">
  <tr>
    <td height="49px" colspan="8" valign="middle" class="foote"><a href="Default.aspx" title="返回首页"><img src="imgs/logo.gif" width="100px" height="49px" border="0"/></a>丽军数码摄影器材维修中心</td>
    <td height="49px" align="center" valign="middle" class="foote">&nbsp;</td>
  </tr>
  <tr>
    <td height="20" colspan="9">&nbsp;</td>
    </tr>
  <tr>
    <td colspan="9" align="center" bgcolor="#585858"></td>
  </tr>  
  <tr>
     <td  align="center" valign="middle" bgcolor="#647588"><a href="Default.aspx"><h2>网站首页</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="show.aspx"><h2>配件展示</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="error.aspx"><h2>常见故障</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="fix.aspx"><h2>报修流程</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="bbs.aspx"><h2>维修论坛</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="shop.aspx"><h2>网店介绍</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#647588"><a href="staff.aspx"><h2>人才招聘</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="messages.aspx"><h2>网上留言</h2></a></td>
     <td  align="center" valign="middle" bgcolor="#647588"><a href="connect.aspx"><h2>联系我们</h2></a></td>
  </tr>  
  <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
      <tr>
        <td colspan="9" align="middle" valign="middle"><img src="imgs/class/img10.gif" width="200" height="194" /><div id="title" runat="server">站内搜索</div></td>
        </tr>
  <tr>
    <td colspan="9" align="center"  valign="middle" bgcolor="#FFFFFF"  cellpadding="0" 
          style="text-align: center">
        <br />
<br />
<div><script>
         (function() {
             var cx = '016135306708263988424:dm1tpyezaei';
             var gcse = document.createElement('script');
             gcse.type = 'text/javascript';
             gcse.async = true;
             gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
             var s = document.getElementsByTagName('script')[0];
             s.parentNode.insertBefore(gcse, s);
         })();
</script>
<gcse:search></gcse:search>
</div><br />
        　　 　　</td>
  </tr>
  <tr>
    <td colspan="9">&nbsp;</td>
  </tr>
  <tr>
    <td  class="footer" height="40" colspan="9" bgcolor="#A1A1A1"><p>&nbsp;</p>
                <p> &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>
             <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">管理员登录</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">关于本站作者</a></p>
</td>
  </tr>
</table>
    </form>
</body>
</html>
