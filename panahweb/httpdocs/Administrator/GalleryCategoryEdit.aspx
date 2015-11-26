<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="GalleryCategoryEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.GalleryCategoryEdit" %>
<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">

<telerik:RadAjaxLoadingPanel ID="radAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxManager ID="radAjaxManager1" runat="server" DefaultLoadingPanelID="radAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="pnlToolbar">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="pnlToolbar" />
                    <telerik:AjaxUpdatedControl ControlID="pnlForm" />
                    <telerik:AjaxUpdatedControl ControlID="pnlAuditTrail" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="radGridGroups">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="radGridGroups" />
                    <telerik:AjaxUpdatedControl ControlID="radGridMemberOf" />
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="radGridMemberOf">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="radGridGroups" />
                    <telerik:AjaxUpdatedControl ControlID="radGridMemberOf" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="pd05">
        <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
            <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick"
                ValidationGroup="UserEdit">
                <Items>
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/saveitem.gif" CommandName="Save"
                        Text="Lưu" AccessKey="S">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CausesValidation="false" ImageUrl="~/Images/goback1.gif" CommandName="GoBacktoView"
                        Text="Quay lại" AccessKey="G">
                    </telerik:RadToolBarButton>
                </Items>
                <CollapseAnimation Duration="200" Type="OutQuint" />
            </telerik:RadToolBar>
        </asp:Panel>
        <asp:Panel ID="pnlForm" runat="server" CssClass="form-editor-container">
            <uc:ErrorMessage ID="ErrorMessage1" runat="server" Visible="false" />
            <br />
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập tên gallery<b>tên album</b><br />" ControlToValidate="txtName"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblLoginNameLabel" runat="server" CssClass="label w150" Text="Tên album:"></asp:Label>
                <telerik:RadTextBox ID="txtName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label1" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
             <p>
                <asp:Label ID="lblgallerytype" runat="server" CssClass="label w150" Text="Loại album:"></asp:Label>
                <telerik:RadComboBox ID="gallerytype" runat="server" Height="300px" EmptyMessage="Chọn Loại album..."
                    Width="454px">
                    <Items>
                        <%--<telerik:RadComboBoxItem runat="server" Text="Chưa kích hoạt" Value="Chưa kích hoạt" />--%>
                        <telerik:RadComboBoxItem runat="server" Text="Album ảnh" Value="0" />
                        <telerik:RadComboBoxItem runat="server" Text="Thư viện Video" Value="1" />
                        <%--<telerik:RadComboBoxItem runat="server" Text="Danh sách đen" Value="Danh sách đen" />
                                <telerik:RadComboBoxItem runat="server" Text="Danh sách trắng" Value="Danh sách trắng" />
                                <telerik:RadComboBoxItem runat="server" Text="Danh sách đỏ" Value="Danh sách đỏ" />--%>
                    </Items>
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblNoteLabel" runat="server" CssClass="label w150" Text="Ghi chú:"></asp:Label>
                <telerik:RadTextBox ID="txtNote" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
        </asp:Panel>
        <div style="clear: both;">
        </div>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
