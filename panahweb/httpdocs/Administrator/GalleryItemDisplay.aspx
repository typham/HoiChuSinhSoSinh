<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="GalleryItemDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.GalleryItemDisplay" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
        <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            function previewAvatar() {
                var hidden = $get('<%=hidgitempath.ClientID %>');
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
                <asp:Label ID="lblgitemnameLabel" runat="server" CssClass="label w150" Text="Tên Gallery:"></asp:Label>
                <asp:Label ID="lblgitemname" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblCatNameLabel" runat="server" CssClass="label w150" Text="Danh mục Gallery:"></asp:Label>
                <asp:Label ID="lblCatName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitemlinkurlLabel" runat="server" CssClass="label w150" Text="Link Gallery:"></asp:Label>
                <asp:Label ID="lblgitemlinkurl" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitemtypeNameLabel" runat="server" CssClass="label w150" Text="Kiểu Gallery:"></asp:Label>
                <asp:Label ID="lblgitemtypeName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitempathLabel" runat="server" CssClass="label w150" Text="File Gallery:"></asp:Label>
                <asp:Label ID="lblgitempath" runat="server" CssClass="label w450" Text=""></asp:Label>
                 <asp:HiddenField ID="hidgitempath" runat="server"></asp:HiddenField>
                <img alt="Xem file" title="Xem file" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
