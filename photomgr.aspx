<%@ Page Language="C#" AutoEventWireup="true" CodeFile="photomgr.aspx.cs" Inherits="photomgr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html" />
<link rel="stylesheet" type="text/css" href="adminsty.css" />
<title>������</title></head>
<body>
<script language="JavaScript" type="text/javascript">
    var lang = navigator.language || navigator.userLanguage;
    if (lang.substr(0, 3) == "zh-") {
        document.write("<style type=\"text/css\" media=\"screen\">center{display:none;}</style>");
    }
</script>
<form id="form1" runat="server">
  <table width="1038" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="9"  align="left" valign="middle" bgcolor="#ff7d23" class="style1">��������</td>
  </tr>
  <tr>
    <td colspan="9"  align="center" valign="middle" bgcolor="#585858">&nbsp;</td>
    </tr>
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
  </tr>  
  <tr>
    <td height="15" colspan="17" align="center" bgcolor="#FFFFFF"><table width="90%" border="0" cellspacing="0" cellpadding="12">
          <tr>
            <td width="547" align="left"><h1>��̨����</h1>
             </td>
            <td align="right" nowrap="nowrap"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
            <td width="200" align="right">
                &nbsp;&nbsp;&nbsp;<asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/imgs/back.gif" 
                    Height="32" Width="32" title="����" OnClick="btnBack_click"/>&nbsp;<asp:ImageButton ID="btnLogout" runat="server" ImageUrl="~/imgs/logout.gif" Height="32" Width="32" title="�ǳ�" OnClick="btnLogout_click"/></td>
          </tr>
          <tr>
            <td height="3" colspan="3" align="center">
                
                          <div id="divpopo" class="divcss" runat="server" align="center">
              
              <table width="100%" border="0" cellspacing="0" cellpadding="12">
                <tr>
                  <td align="right" valign="middle"><img src="imgs/photo.gif" alt="" width="32" height="32" /></td>
                  <td align="left"><strong>������
           
                    
                  </strong></td>
                </tr>
                <tr>
                  <td colspan="2" align="center" valign="top">
                      <br />
                      <asp:GridView ID="gvalb" runat="server" AutoGenerateColumns="False" 
                          BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                          CellPadding="2" DataKeyNames="alid"
                          ForeColor="Black" Width="700px" 
                          onrowdeleting="gvalb_RowDele" onrowediting="gvalb_RowEdt" 
                          onrowupdating="gvalb_RowUpd">
                          <Columns>
                              <asp:BoundField DataField="rowsid" HeaderText="���" ReadOnly="True">
                              <ItemStyle HorizontalAlign="Center" Width="7%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="alid" HeaderText="�����" InsertVisible="False" 
                                  ReadOnly="True" SortExpression="alid" Visible="False" >
                              <ItemStyle HorizontalAlign="Center" Width="10%" />
                              </asp:BoundField>
                              <asp:BoundField DataField="alname" HeaderText="�����" >
                              <ItemStyle HorizontalAlign="Center" Width="40%" />
                              </asp:BoundField>
                              <asp:TemplateField HeaderText="����">
                                  <ItemTemplate>
                                      <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("islock") %>' 
                                          Enabled="true" />
                                  </ItemTemplate>
                                  <EditItemTemplate>
                                      <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("islock") %>' />
                                  </EditItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" Width="7%" />
                              </asp:TemplateField>
                              <asp:HyperLinkField DataNavigateUrlFields="alid" 
                                  DataNavigateUrlFormatString="photo.aspx?id={0}" Text="��ϸ" Target= "_blank">
                              <ItemStyle HorizontalAlign="Center" Width="7%" />
                              </asp:HyperLinkField>
                              <asp:CommandField ButtonType="Button" EditText="�޸�" ShowEditButton="True" 
                                  ShowCancelButton="False" >
                                  <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                      Font-Bold="True" Font-Names="����" Font-Size="Medium" ForeColor="White" />
                              <ItemStyle HorizontalAlign="Center" />
                              </asp:CommandField>
                              <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="ɾ��" 
                                            OnClientClick="javascript:return confirm('��ɾ���������ܰ�����Ƭ����ȷ��ɾ���������');" />
                                  </ItemTemplate>
                                  <ControlStyle BackColor="#FF7D23" BorderColor="#FF7D23" BorderStyle="Solid" 
                                      Font-Bold="True" Font-Names="����" Font-Size="Medium" ForeColor="White" />
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                          </Columns>
                          <FooterStyle BackColor="Tan" />
                          <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                              HorizontalAlign="Center" />
                          <EmptyDataTemplate>
                              û����ᣡ
                          </EmptyDataTemplate>
                          <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                          <HeaderStyle BackColor="Tan" Font-Bold="True" />
                          <AlternatingRowStyle BackColor="PaleGoldenrod" />
                      </asp:GridView>
                      <br />
                      <asp:TextBox ID="txtnew" runat="server" BackColor="Silver" CssClass="txt3"></asp:TextBox>
                      &nbsp;&nbsp;
                      <asp:Button ID="btnnew" runat="server" class="txt3" Text="���������" 
                    BackColor="#FF7D23" BorderStyle="Solid" Font-Bold="True" 
                    ForeColor="White" BorderColor="#FF7D23" OnClick="btnnew_Click" />
                      <br />
                      <br />
                      <br />
                      <div id="aptips" class="aptips" runat="server">ɾ�����ǰ���������ڵ�ͼƬ��</div>
                      <br />
                                          </td>
                </tr>
                </table>
            </div></td>
          </tr>
          

          <p>
            <br />

            

        </p>


            
  </tr>
 
  <tr>
    <td colspan="3" align="center" valign="middle" bgcolor="#FFFFFF" cellpadding="0">
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
        </table></td>
  </tr>
  <tr>
  <td height="15" colspan="17" align="left" bgcolor="#A1A1A1" class="footer">
        <p>&nbsp;</p>
    <p>&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text=""></asp:Label></p></td>
        </tr>
        </table>
       
        </form>
</body>
</html>
