<%@ Control Language="C#" AutoEventWireup="true" CodeFile="articlelist.ascx.cs" Inherits="articlelist" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:lijunConnectionString %>"
                    
    SelectCommand="SELECT top 10 [artid], [artitle] FROM [Article] ORDER BY [artid] DESC" 
    ProviderName="System.Data.SqlClient">
                </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataKeyNames="artid" DataSourceID="SqlDataSource1" 
    ForeColor="#333333" GridLines="None" Width="100%" 
    style="text-align: center" Font-Size="14pt">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Left" />
        <EmptyDataRowStyle HorizontalAlign="Center" />
    <Columns>
        <asp:BoundField DataField="artid" HeaderText="artid" InsertVisible="False" 
            ReadOnly="True" SortExpression="artid" Visible="False">
        <HeaderStyle Height="0px" />
        </asp:BoundField>
        <asp:TemplateField>
            <ItemTemplate>
                &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl='<%# Eval("artid", "detail.aspx?id={0}") %>' 
                     Text='<%# SubStr(Eval("artitle"),20) %>' ToolTip='<%# Eval("artitle") %>' 
                    CssClass="newl" ForeColor="Black"></asp:HyperLink>
            </ItemTemplate>          
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>
        没有文章
    </EmptyDataTemplate>
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" ForeColor="#284775" 
            CssClass="newl" />
</asp:GridView>

