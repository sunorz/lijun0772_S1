<%@ Page Language="C#" AutoEventWireup="true" CodeFile="404.aspx.cs" Inherits="_404" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>出错啦！</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
    <form id="form1" runat="server">
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
    <p>
        非常抱歉！您访问的过程中出现错误，可能是由于以下原因：</p>
    <p>
        1.网络连接不稳定</p>
    <p>
        2.您请求的网址不存在</p>
    <p>
        3.应用程序错误</p>
    <p>
        <img alt="" src="imgs/404.jpg" /></p>
    <p>
        请您向我们报告跳转到本页面的网址，以协助管理员解决，谢谢！</p>
    <p>
        您可以：<a href="Default.aspx">返回首页</a>或者<a href="messages.aspx">
        提交错误网址</a></p>
    </form>
</body>