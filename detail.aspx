<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" Debug="true"%>
<%@ Register src="gotop.ascx" tagname="gotop" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>丽军数码-维修论坛</title>
        

        <style type="text/css">
            .style2
        {
            color: black;
            background-color: #FFFFFF;
             text-align:center;
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
<div id="apDiv2" class="toplnk"><uc1:gotop ID="gotop1" runat="server" /></div>
<script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
    <form id="form1" runat="server">    
<table width="1038" border="0" align="center" cellpadding="0" cellspacing="0" class="layout">
  <tr>
    <td height="49px" colspan="8" valign="middle" class="foote"><a href="Default.aspx" title="返回首页"><img src="imgs/logo.gif" width="100px" height="49px" border="0"/></a>丽军数码摄影器材维修中心</td>
    <td height="49px" align="center" valign="middle" class="foote"><a href="showsea.aspx" title="点此搜索"><img src="imgs/search.gif" width="40" height="48" border="0" /></a></td>
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
    <td  align="center" valign="middle" bgcolor="#66CCC1"><h2>维修论坛</h2></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="shop.aspx"><h2>网店介绍</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#647588"> <a href="staff.aspx"><h2>人才招聘</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#647588"><a href="messages.aspx"><h2>网上留言</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#647588"><a href="connect.aspx"><h2>联系我们</h2></a></td>
  </tr>  
  <tr>
    <td colspan="9" align="center" valign="middle" cellpadding="0">
<table width="100%" border="0" cellspacing="0" cellpadding="12">
      <tr>
        <td colspan="9" align="middle" valign="middle"><img src="imgs/class/img5.gif" width="200" height="194" /><div id="title" runat="server">维修论坛</div></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#FFFFFF"><asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" Height="32" Width="32" title="返回" OnClick="btnBack_click"/></td>
          </tr>
          <tr>
            <td colspan="2" align="center" valign="top" bgcolor="#FFFFFF"><div id="banner" runat="server" style="font-size: 0.9em">上一篇：<asp:HyperLink 
                    ID="hlpre" runat="server" Enabled="False">没有上一篇了。</asp:HyperLink>
                &nbsp;&nbsp;下一篇：<asp:HyperLink ID="hlnext" runat="server" Enabled="False">没有下一篇了。</asp:HyperLink>
                </div>
                <span class="contents"><asp:Label ID="Label1" runat="server" Text="文章不存在或已被删除！" Visible="False"></asp:Label><span class="contents"> <br />
                <asp:FormView ID="fvtxt" runat="server" DataKeyNames="artid" 
                      Width="90%" style="text-align: left">
                    <EditItemTemplate>                       
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        &nbsp;<asp:Label ID="artidLabel" runat="server" Text='<%# Eval("artid") %>' 
                            Visible="False" />
                        <br />
                        <p align="center"><asp:Label ID="artitleLabel" runat="server" Text='<%# Eval("artitle") %>' 
                            Font-Bold="True" style="font-size: large" /></p>
                        <br />
                        <br />
                        <span class="bbsdel" style="color: #FF9424">作者:</span>
                        <asp:Label ID="artmkrLabel" runat="server" Text='<%# Eval("artmkr") %>' 
                            Font-Size="Small" style="color: #FF7D23" />
                        &nbsp;&nbsp; <span class="bbsdel" style="color: #FF7D24">发表时间：</span>
                        <asp:Label ID="arttimeLabel" runat="server" Font-Size="Small" 
                            style="color: #FF7D23" Text='<%# Eval("arttime","{0:yyyy年M月d日}") %>'/>
                        <br />
                        <span class="bbsdel"><asp:Label ID="artcntLabel" runat="server" Text='<%# Eval("artcnt") %>' /></asp:Label></span>
                        <br />
                        <br />
                        <br />
                        &nbsp;<br />
                    </ItemTemplate>
                </asp:FormView>
                <p id="share" runat ="server"><div class="bshare-custom"><div class="bsPromo bsPromo2"></div><a title="分享到新浪微博" class="bshare-sinaminiblog"></a><a title="分享到腾讯微博" class="bshare-qqmb"></a><a title="分享到i贴吧" class="bshare-itieba" href="javascript:void(0);"></a><a title="分享到Facebook" class="bshare-facebook" href="javascript:void(0);"></a><a title="分享到Twitter" class="bshare-twitter" href="javascript:void(0);"></a><a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a><span class="BSHARE_COUNT bshare-share-count" style="float: none;"></span></div><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=3&amp;lang=zh"></script><script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script></p>
                </td>
          </tr>
          <tr>
            <td colspan="2" align="center" bgcolor="#FFFFFF">
                                      <asp:ImageButton ID="btngood" runat="server" ImageUrl="~/imgs/good.jpg" 
                            OnClick="btngood_Click" title="赞一下？" />
                        <asp:Label ID="Label4" runat="server" ForeColor="#FF7D23" Text=""></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2" align="left" bgcolor="#FFFFFF"><div id="commpo" runat="server">昵称：
<asp:TextBox ID="txtname" runat="server" BackColor="Silver" CssClass="txt3" MaxLength="20"></asp:TextBox>
                <br />
                <br />
                邮箱：
                <asp:TextBox ID="txtmail" runat="server" BackColor="Silver" CssClass="txt3" 
                    MaxLength="30"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtmail" CssClass="aptips" ErrorMessage="邮箱格式不正确！" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <br />
                <div id="aptips" runat="server" class="aptips" ></div>
                <br />
                评论内容：<br />
&nbsp;<br />
<br />
                <br />
                &nbsp;<asp:TextBox ID="txtcomment" runat="server" BackColor="Silver" CssClass="txt3" 
                    Height="239px" TextMode="MultiLine" Width="603px">请不要输入包含个人隐私（账号密码等）的内容，谢谢！</asp:TextBox>
                <br />
                <br />
                            &nbsp;<asp:Button ID="btnPost" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" OnClick="btnPost_Click" Text="评论" Width="60px" />
                &nbsp;&nbsp;
            <asp:Button ID="btnRest" runat="server" BackColor="#FF7D23" 
                    BorderColor="#FF7D23" BorderStyle="Solid" class="txt3" Font-Bold="True" 
                    ForeColor="White" OnClick="btnReset_Click" Text="清除" Width="60px" />
                <br />
                <br />
                <br />
                <br />
                <br />
                                &nbsp;<br />
                <asp:Label ID="Label5" runat="server" Text="评论列表："></asp:Label>
                <br />
                <br />
                <asp:DataList ID="dlcom" runat="server" BackColor="LightGoldenrodYellow" 
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" 
                    ForeColor="Black" Width="896px" GridLines="Both">
                    <FooterStyle BackColor="Tan" />
                    <AlternatingItemStyle BackColor="PaleGoldenrod" />
                    <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <ItemTemplate>
                          <span class="style4">&nbsp;<%# RowsCount -   Container.ItemIndex%>楼</span>&nbsp;<asp:Label 
                              ID="commentLabel" runat="server" Text='<%# Eval("coname") %>' 
                              style="font-size: small; color: #FF7D23"  />
                          <br />
                          <br />
                          &nbsp;<asp:Label ID="Label6" runat="server" Text='<%# Eval("comment") %>' ></asp:Label>
                        <br /><br />
                        &nbsp;<span class="style4">评论时间:</span><asp:Label ID="cposttimeLabel" runat="server" style="font-size: small" 
                            Text='<%# Eval("cposttime","{0:yyyy-M-d HH:mm:ss}") %>'  /> 
                          <br />
                          <br />
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:Label ID="Label8" runat="server" Text="回复：" ForeColor="#FF7D23" 
                              Visible='<%# Eval("state") %>'></asp:Label><asp:Label ID="Label2" runat="server" Text='<%# Eval("reply") %>'></asp:Label>
                          
                          <br /><br />                   
                    </ItemTemplate>
                </asp:DataList>
                <br />
                <br />
                            </div></td>
          </tr>
          <tr>
            <td colspan="2" align="left">
              </td>
          </tr>
      </table></td>
  </tr>
  <tr>
     <td  class="footer" height="40" colspan="9" bgcolor="#A1A1A1"><p>&nbsp;</p>
         <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p>
             <p>&nbsp;&nbsp;<a href="adminlogin.aspx" class="foot">管理员登录</a>&nbsp;&nbsp;<a href="http://jsunplace.tumblr.com/" class="foot">关于本站作者</a></p>
</td>
  </tr>
</table>
    </form>
</body>
</html>
