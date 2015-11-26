<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BankDetailUC.ascx.cs"
    Inherits="HCSSS.Framework.UserControls.LayoutWebsite.BankDetailUC" %>
<asp:Panel ID="pnlUpdateMaHD" GroupingText="THÔNG TIN CHI TIẾT NGÂN HÀNG" runat="server">
    <asp:FormView ID="FormView1" runat="server" CssClass="boxToooltip" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
        <ItemTemplate>
            <b style="text-align: center; color: Red;">
                <%#Eval("BankName")%></b><br />
            <hr />
            <table class="tbl" width="100%">
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label1" runat="server" Text="Tên viết tắt : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblNumberDocument" Font-Bold="true" runat="server" Text='<%#Eval("ShortName" )%>'></asp:Label>
                    </td>
                </tr>
                
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label6" runat="server" Text="Địa chỉ : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblActiveDate" Font-Bold="true" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label8" runat="server" Text="Điện thoại : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIssueAgency" Font-Bold="true" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label10" runat="server" Text="Email : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblRegister" Font-Bold="true" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label12" runat="server" Text="WebSite : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCatName" Font-Bold="true" runat="server" Text='<%#Eval("Website") %>'></asp:Label>
                    </td>
                </tr>
                
               
               
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label9" runat="server" Text="Người đại diện PL : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label11" Font-Bold="true" runat="server" Text='<%#Eval("LegalRepresentation") %>'></asp:Label>
                    </td>
                </tr>
               
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label16" runat="server" Text="Ngành nghề KD : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label17" Font-Bold="true" runat="server" Text='<%# Eval("BanksDescription") %>'></asp:Label>
                    </td>
                </tr>
                
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectOne"
        TypeName="HCSSS.Framework.System.DBAccess.BanksDAO">
        <SelectParameters>
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Panel>
