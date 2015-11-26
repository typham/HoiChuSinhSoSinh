<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileItem.ascx.cs" Inherits="HCSSS.Framework.UserControls.LayoutWebsite.FileItem" %>
<asp:Panel ID="pnlUpdateMaHD" GroupingText="THÔNG TIN VĂN BẢN" runat="server">
    <asp:FormView ID="FormView1" runat="server" CssClass="boxToooltip" DataSourceID="ObjectDataSource1" EnableModelValidation="True">
        <ItemTemplate>
            <b style="text-align:justify;">
                <%#Eval("FileName")%></b><br />
            <asp:Label ID="Label5" runat="server" Text="Nội dung đính kèm"></asp:Label><br />
            <a href='<%#Eval("FileUrl")%>'>Bấm để tải tập tin về máy</a><br />
            <hr />
            <table class="tbl" width="100%">
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label1" runat="server" Text="Số hiệu văn bản : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblNumberDocument" Font-Bold="true" runat="server" Text='<%#Eval("NumberDocument" )%>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label2" runat="server" Text="Trích yếu"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblFileName" Font-Bold="true" runat="server" Text='<%#Eval("FileName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label4" runat="server" Text="Ngày ban hành : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIssueDate" Font-Bold="true" runat="server" Text='<%# string.Format("{0:dd/MM/yyyy}",Eval("IssueDate")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label6" runat="server" Text="Ngày hiệu lực : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblActiveDate" Font-Bold="true" runat="server" Text='<%#string.Format("{0:dd/MM/yyyy}",Eval("ActiveDate")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label8" runat="server" Text="Cơ quan ban hành : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblIssueAgency" Font-Bold="true" runat="server" Text='<%#Eval("IssueAgency") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label10" runat="server" Text="Người ký : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblRegister" Font-Bold="true" runat="server" Text='<%#Eval("Register") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label12" runat="server" Text="Loại văn bản : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblCatName" Font-Bold="true" runat="server" Text='<%#Eval("FolderName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label14" runat="server" Text="Lĩnh vực : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblScope" Font-Bold="true" runat="server" Text='<%#Eval("ScopeName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tbll">
                        <asp:Label ID="Label3" runat="server" Text="Ngôn ngữ : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblLanguage" Font-Bold="true" runat="server" Text='<%#(Eval("Language") == "VN")?"Tiếng Việt":"Tiếng Anh" %>'></asp:Label>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectByID"
        TypeName="HCSSS.Framework.System.DBAccess.FileItemDAO">
        <SelectParameters>
            <asp:Parameter Name="FileItemID" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Panel>
