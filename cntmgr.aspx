<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cntmgr.aspx.cs" Inherits="cntmgr" Debug=true%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="adminsty.css" />
<title>��Ϣ����</title>
</head>
<body>
<script language="JavaScript" type="text/javascript">
var lang = navigator.language || navigator.userLanguage;
if(lang.substr(0, 3) == "zh-"){
document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>"); }
</script>
<form id="form1" runat="server">
  <table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="15" colspan="17" align="left" valign="middle" bgcolor="#ff7d23" class="style1">��������</td>
  <tr>
    <td height="15" colspan="17" bgcolor="#585858"></td>
  <tr>
   <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="Default.aspx" target="_blank"><h2>��վ��ҳ</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="show.aspx" target="_blank"><h2>���չʾ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="error.aspx" target="_blank"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="fix.aspx" target="_blank"><h2>��������</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="bbs.aspx" target="_blank"><h2>ά����̳</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="shop.aspx" target="_blank"><h2>�������</h2></a></td>
   <td  align="center" valign="middle" bgcolor="#ff7d23"> <a href="staff.aspx" target="_blank"><h2>�˲���Ƹ</h2></a></td>
    <td  align="center" valign="middle" bgcolor="#ff7d23"><a href="messages.aspx" target="_blank"><h2>��������</h2></a></td>
    <td   align="center" valign="middle" bgcolor="#ff7d23"><a href="connect.aspx" target="_blank"><h2>��ϵ����</h2></a></td>
  </tr>  <tr>
  <td height="15" colspan="17" align="center" bgcolor="#FFFFFF">
        <p><br />
        </p>
       
        <table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td width="547" align="left"><h1>��̨����</h1>
             </td>
            <td align="right" nowrap="nowrap"><asp:Label ID="Label1" runat="server" Text="Label1"></asp:Label></td>
            <td width="200" align="right">
                &nbsp;&nbsp;<asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" Height="32" Width="32" title="����" OnClick="btnBack_click"/>&nbsp;&nbsp;<asp:ImageButton ID="btnLogout" runat="server" ImageUrl="~/imgs/logout.gif" Height="32" Width="32" title="�ǳ�" OnClick="btnLogout_click"/></td>
          </tr>
          <tr>
            <td height="3" colspan="3" align="left">
                
                          </td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle"><div id="divchgpwd2" class="divcss2" runat="server" align="center">
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td width="42%" align="right" valign="middle"><img src="imgs/content.gif" alt="" width="32" height="32" /></td>
                  <td width="58%" align="left"><strong>�������ԣ� </strong></td>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="middle">
                      <asp:GridView ID="gvmess" runat="server" AllowPaging="True" Pagesize="20"
                          AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                          BorderWidth="1px" CellPadding="2" DataKeyNames="pid"
                          ForeColor="Black" Width="960px" 
                          DataSourceID="SqlDataSource1" onrowdeleting="RowDelete">
                          <PagerSettings FirstPageText="��һҳ&nbsp;" LastPageText="���һҳ" 
                              Mode="NextPreviousFirstLast" NextPageText="��һҳ&nbsp;" PreviousPageText="��һҳ&nbsp;" />
                          <Columns>
                              <asp:TemplateField HeaderText="���">
                              <ItemTemplate>
                              <%#Eval("rowsid")%>
                            </ItemTemplate>
                             <ItemStyle Width="5%" HorizontalAlign="Center" />
                            </asp:TemplateField>
                              <asp:BoundField DataField="pid" HeaderText="���Ա��" InsertVisible="False" 
                                  ReadOnly="True" SortExpression="pid" Visible="False" >
                              </asp:BoundField>
                              <asp:TemplateField HeaderText="������" SortExpression="pname">
                                  <EditItemTemplate>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# SubStr(Eval("pname"),4) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:TemplateField>
                              
                              <asp:TemplateField HeaderText="E-mail" SortExpression="pmail">
                                  <EditItemTemplate>                                    
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# SubStr(Eval("pmail"),16) %>' ToolTip='<%# Eval("pmail") %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="��������" SortExpression="pcontent">
                                  <EditItemTemplate>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# SubStr(Eval("pcontent"),10) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Left" Width="20%" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="pposttime" DataFormatString="{0:yyyy��M��d��}" 
                                  HeaderText="����ʱ��" SortExpression="pposttime" >
                                   <ItemStyle Width="16%" HorizontalAlign="Center" />
                              </asp:BoundField>
                              <asp:BoundField DataField="state" HeaderText="�ظ�״̬" >
                                   <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                                   <asp:TemplateField>
                                       <ItemTemplate>
                                           <asp:HyperLink ID="HyperLink1" runat="server" Enabled='<%# Eval("ispub") %>' 
                                               NavigateUrl='<%# Eval("pid", "reply.aspx?mid={0}") %>' Target="_blank" 
                                               Text="�ظ�"></asp:HyperLink>
                                       </ItemTemplate>
                                       <ItemStyle HorizontalAlign="Center" Width="5%" />
                              </asp:TemplateField>
                                   <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                          CommandName="Delete" Text="ɾ��" OnClientClick="javascript:return confirm('��ȷ��ɾ����������');"/>
                                  </ItemTemplate>
                                  <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                      Font-Bold="True" Font-Names="����" Font-Size="Medium" ForeColor="White" />
                                       <ItemStyle Width="5%" HorizontalAlign="Center" />
                              </asp:TemplateField>
                          </Columns>
                          <FooterStyle BackColor="Tan" />
                          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                              HorizontalAlign="Center" />
                          <EmptyDataTemplate>
                              û�����ԣ�
                          </EmptyDataTemplate>
                          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                          <HeaderStyle BackColor="Tan" Font-Bold="True" />
                          <AlternatingRowStyle BackColor="PaleGoldenrod" />
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"                          
                          SelectCommand="select *,(case when reply is not null then '�ѻظ�' when reply is null then 'δ�ظ�' end) as state,ROW_NUMBER()OVER (order by pid desc) AS rowsid
from Mess order by pid desc" 
                          DeleteCommand="DELETE FROM [Mess] WHERE [pid] = @pid" >
                      </asp:SqlDataSource>
                    </td>
                </tr>
                </table>
            </div></td>
          </tr>
          <tr>
            <td width="500" colspan="3" align="center" valign="middle"><!--����-->
            <div id="divchgpwd" class="divcss2" runat="server" align="center">
              
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td width="50%" align="right" valign="middle"><img src="imgs/content.gif" width="32" height="32" /></td>
                  <td align="left"><strong>�������ۣ�            
                    
                  </strong></td>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="middle">
                      <asp:GridView ID="gvcom" runat="server" AutoGenerateColumns="False" 
                          BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                          CellPadding="2" DataKeyNames="comid,artid"
                          ForeColor="Black" Width="960px" AllowPaging="True" 
                          Pagesize="20" DataSourceID="SqlDataSource2" onrowdeleting="RowDelete">
                          <PagerSettings FirstPageText="��һҳ&nbsp;" LastPageText="���һҳ" 
                              Mode="NextPreviousFirstLast" NextPageText="��һҳ&nbsp;" PreviousPageText="��һҳ&nbsp;" />
                          <Columns>
                              <asp:TemplateField HeaderText="���">
                              <ItemTemplate>
                               <%#Eval("rowsid")%>
                            </ItemTemplate>
                            <ControlStyle Width="30px" />
                                  <ItemStyle HorizontalAlign="Center" Width="5%" />
                            </asp:TemplateField>
                              <asp:BoundField DataField="comid" HeaderText="���۱��" InsertVisible="False" 
                                  ReadOnly="True" SortExpression="comid" Visible="False" />
                              <asp:TemplateField HeaderText="���±���" ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:HyperLink ID="HyperLink2" runat="server" 
                                          NavigateUrl='<%# Eval("artid", "detail.aspx?id={0}") %>' Target="_blank" 
                                          Text='<%# SubStr(Eval("artitle"),5) %>'></asp:HyperLink>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Left" Width="20%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="������" SortExpression="coname">
                                  <EditItemTemplate>                               
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# SubStr(Eval("coname"),4) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="E-mail" SortExpression="comail">
                                  <EditItemTemplate>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# SubStr(Eval("comail"),16) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="15%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="��������" SortExpression="comment">
                                  <EditItemTemplate>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# SubStr(Eval("comment"),10) %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle Width="5%" />
                              </asp:TemplateField>
                              <asp:BoundField DataField="cposttime" DataFormatString="{0:yyyy��M��d��}" 
                                  HeaderText="����ʱ��" SortExpression="cposttime" >
                              <ItemStyle HorizontalAlign="Center" Width="16%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="artid" HeaderText="artid" InsertVisible="False" 
                                  ReadOnly="True" SortExpression="artid" Visible="False" />
                                      <asp:BoundField DataField="state" HeaderText="�ظ�״̬">
                              <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("comid", "reply.aspx?cid={0}") %>' Text="�ظ�"></asp:HyperLink>
                                          </ItemTemplate>
                                          <ItemStyle HorizontalAlign="Center" Width="5%" />
                              </asp:TemplateField>
                                      <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                          CommandName="Delete" Text="ɾ��" OnClientClick="javascript:return confirm('��ȷ��ɾ����������');"/>
                                  </ItemTemplate>
                                  <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                      Font-Bold="True" Font-Names="����" Font-Size="Medium" ForeColor="White" />
                                          <ItemStyle Width="5%" />
                              </asp:TemplateField>
                          </Columns>
                          <FooterStyle BackColor="Tan" />
                          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                              HorizontalAlign="Center" />
                          <EmptyDataTemplate>
                              û�����ۣ�
                          </EmptyDataTemplate>
                          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                          <HeaderStyle BackColor="Tan" Font-Bold="True" />
                          <AlternatingRowStyle BackColor="PaleGoldenrod" />
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"                     
                          SelectCommand="SELECT *,(case when reply is not null then '�ѻظ�' when reply is null then 'δ�ظ�' end) as state,ROW_NUMBER()OVER (order by comid desc) AS rowsid FROM [Comment],[Article]  where [aid]=[artid] ORDER BY [comid] DESC" 
                          DeleteCommand="DELETE FROM [Comment] WHERE [comid] = @comid" >
                      </asp:SqlDataSource>
                    </td>
                </tr>
              </table>
            </div>
</td>
          </tr>
          <tr>
            <td colspan="3" align="center" valign="middle" width="500">
           </td>
          </tr>
        </table>
          <p>
            <br />
            <br />
        </p>
 <br />

            
  </tr>
 
  <tr>
    <td colspan="9" align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<p><br />
             <br />
            <br />
             <br /></p></td>
  </tr>
  <tr>
    <td height="40" colspan="9" bgcolor="#A1A1A1"  class="footer"><p>&nbsp;</p>
      <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></p></td></tr></table>          
    </form>
</body>
</html>
