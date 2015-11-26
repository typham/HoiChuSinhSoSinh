<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="NewsDisplay.aspx.cs" Inherits="HCSSS.CMS.News.NewsDisplay" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            function previewAvatar() {
                var hidden = $get('<%=hidUrl.ClientID %>');
                if (hidden && hidden.value) window.open(hidden.value);
            }

        </script>
        <script type="text/javascript">

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
                <asp:Label ID="lblNameLabel" runat="server" CssClass="label w150" Text="Tiêu đề:"></asp:Label>
                <asp:Label ID="lblName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label1" runat="server" CssClass="label w150" Text="AliasUrl:"></asp:Label>
                <asp:Label ID="lblAlias" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblTitleType" runat="server" CssClass="label w150" Text="Hiển thị tin trên trang chủ:"></asp:Label>
                <asp:CheckBox ID="ckcTitle" runat="server" Enabled="false" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblParentLabel" runat="server" CssClass="label w150" Text="Loại tin tức:"></asp:Label>
                <telerik:RadComboBox ID="cmbParent" runat="server" Height="300px" Text="Loại tin tức:"
                    DataTextField="Name" DataValueField="Id" Width="450px">
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDateCreateLabel" runat="server" CssClass="label w150" Text="Ngày tạo:"></asp:Label>
                <asp:Label ID="lblDateCreate" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblAuthorLabel" runat="server" CssClass="label w150" Text="Nguồn:"></asp:Label>
                <asp:Label ID="lblAuthor" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblUrlLabel" runat="server" CssClass="label w150" Text="Hình ảnh mô tả:"></asp:Label>
                <asp:Label ID="lblUrl" runat="server" CssClass="label w450" Text=""></asp:Label>
                <asp:HiddenField ID="hidUrl" runat="server"></asp:HiddenField>
                <img alt="Xem Hình ảnh đại diện" title="Xem Hình ảnh đại diện" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLeadLabel" runat="server" CssClass="label w150" Text="Trich dẫn:"></asp:Label>
                <br class="clear" />
            </p>
            <asp:Label ID="lblLead" runat="server" CssClass="label w450" Text=""></asp:Label>
            <br class="clear" />
            <p>
                <asp:Label ID="lblDetailLabel" runat="server" Text="Nội dung:"></asp:Label>
                <br class="clear" />
            </p>
            <asp:Label ID="lblDetail" runat="server" Text=""></asp:Label>
            <br class="clear" />
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
