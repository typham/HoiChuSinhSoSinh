<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="FileItemDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.FileItemDisplay" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            function previewAvatar() {
                var hidden = $get('<%=hidFile.ClientID %>');
                if (hidden && hidden.value) window.open(hidden.value);
            }

        </script>
    </telerik:RadScriptBlock>
    <div class="pd05">
        <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
            <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick"
                OnClientButtonClicking="radToolBarDefault_ClientButtonClicking">
                <Items>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/newitem.gif" CommandName="AddNew"
                        Text="Tạo mới" AccessKey="N">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/edititem.gif" CommandName="Edit"
                        Text="Sửa" AccessKey="E">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/delete.gif" CommandName="Delete"
                        Text="Xóa" AccessKey="D">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/goback1.gif" CommandName="GoBacktoView"
                        Text="Quay lại" AccessKey="G">
                    </telerik:RadToolBarButton>
                </Items>
                <CollapseAnimation Duration="200" Type="OutQuint" />
            </telerik:RadToolBar>
        </asp:Panel>
        <asp:Panel ID="pnlForm" runat="server" CssClass="form-editor-container">
            <asp:Label ID="lblMessage" runat="server" CssClass="blue" Text="" Visible="false"></asp:Label>
            <br />
            <p>
                <asp:Label ID="lblParentLabel" runat="server" CssClass="label w150" Text="Danh mục file :"></asp:Label>
                <asp:Label ID="lblParent" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" CssClass="label w150" Text="Số hiệu văn bản :"></asp:Label>
                <asp:Label ID="lblNumberDocument" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label3" runat="server" CssClass="label w150" Text="Cơ quan ban hành :"></asp:Label>
                <asp:Label ID="lblIssueAgency" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label5" runat="server" CssClass="label w150" Text="Người ký :"></asp:Label>
                <asp:Label ID="lblRegister" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label7" runat="server" CssClass="label w150" Text="Ngày ban hành :"></asp:Label>
                <asp:Label ID="lblIssueDate" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label9" runat="server" CssClass="label w150" Text="Ngày hiệu lực :"></asp:Label>
                <asp:Label ID="lblActiveDate" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
             <p>
                <asp:Label ID="Label2" runat="server" CssClass="label w150" Text="Lĩnh vực :"></asp:Label>
                <asp:Label ID="lblScope" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label11" runat="server" CssClass="label w150" Text="Danh mục file :"></asp:Label>
                <asp:Label ID="Label12" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblFileNameLabel" runat="server" CssClass="label w150" Text="Tên văn bản :"></asp:Label>
                <asp:Label ID="lblFileName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblFileTypeLabel" runat="server" CssClass="label w150" Text="Loại văn bản :"></asp:Label>
                <asp:Label ID="lblFileType" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblFileLabel" runat="server" CssClass="label w150" Text="Văn bản :"></asp:Label>
                <asp:Label ID="lblFile" runat="server" CssClass="label w450" Text=""></asp:Label>
                <asp:HiddenField ID="hidFile" runat="server"></asp:HiddenField>
                <img alt="Xem File" title="Xem File" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
           <p>
                <asp:Label ID="lblLanguage" runat="server" CssClass="label w150" Text="Ngôn ngữ:"></asp:Label>
                <telerik:RadComboBox ID="cmbLanguage" runat="server" Enabled="false" Height="300px" Text="Ngôn ngữ:"
                    Width="450px">
                    <Items>
                        <telerik:RadComboBoxItem Text="Tiếng Việt" Value="VN" />
                        <telerik:RadComboBoxItem Text="Tiếng Anh" Value="EN" />
                    </Items>
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <asp:Label ID="Label4" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
