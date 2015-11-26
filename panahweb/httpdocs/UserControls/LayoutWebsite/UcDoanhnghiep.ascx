<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UcDoanhnghiep.ascx.cs" Inherits="HCSSS.Framework.UserControls.LayoutWebsite.UcDoanhnghiep" %>
<asp:Panel ID="pnlUpdateMaHD" GroupingText="THÔNG TIN CHI TIẾT DOANH NGHIỆP" runat="server">
     <asp:FormView ID="FormView1" runat="server" CssClass="boxToooltip" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
        <ItemTemplate>
            <b style="text-align: center; color: Red;">
                <%#Eval("VietnameseName")%></b><br />
            <hr />
            <table class="tbl" >
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
                        <asp:Label ID="Label2" runat="server" Text="Tên đối ngoại : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblFileName" Font-Bold="true" runat="server" Text='<%#Eval("EnglishName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label4" runat="server" Text="Loại hình DN : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIssueDate" Font-Bold="true" runat="server" Text='<%# Eval("BusinessTypeName") %>'></asp:Label>
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
                        <asp:Label ID="Label14" runat="server" Text="Tình trạng hiện tại : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblScope" Font-Bold="true" runat="server" Text='<%#Eval("BusinessStatusName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label3" runat="server" Text="Mã số doanh nghiệp : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblLanguage" Font-Bold="true" runat="server" Text='<%#Eval("RegisterNumber")  %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label5" runat="server" Text="Ngày cấp GPKD : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label7" Font-Bold="true" runat="server" Text='<%#string.Format("{0:dd/MM/yyyy}",Eval("RegisterDate") ) %>'></asp:Label>
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
                        <asp:Label ID="Label13" runat="server" Text="Nơi thường trú : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label15" Font-Bold="true" runat="server" Text='<%#Eval("LegalRepAddress")%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label16" runat="server" Text="Ngành nghề KD : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label17" Font-Bold="true" runat="server" Text='<%# Eval("BusinessDescription") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label18" runat="server" Text="Vốn kinh doanh : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label19" Font-Bold="true" runat="server" Text='<%#string.Format("{0:0,0}",Eval("Capital")) %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectOne"
        TypeName="HCSSS.Framework.System.DBAccess.BusinessDetailDAO">
        <SelectParameters>
            <asp:Parameter Name="Id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Panel>