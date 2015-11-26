<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="ScopeEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.ScopeEdit" %>
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
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <div class="pd05">
        <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
            <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick"
                ValidationGroup="UserEdit">
                <Items>
                    <telerik:RadToolBarButton runat="server" ValidationGroup="UserEdit" ImageUrl="~/Images/saveitem.gif"
                        CommandName="Save" Text="Lưu" AccessKey="S">
                    </telerik:RadToolBarButton>
                    <telerik:RadToolBarButton runat="server" CausesValidation="false" ImageUrl="~/Images/goback1.gif"
                        CommandName="GoBacktoView" Text="Quay lại" AccessKey="G">
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
                    ErrorMessage="Bạn phải nhập <b>Lĩnh vực</b><br />" ControlToValidate="txtName"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblFileNameLabel" runat="server" CssClass="label w150" Text="Lĩnh vực:"></asp:Label>
                <telerik:RadTextBox ID="txtName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label1" runat="server" CssClass="red" Text="*"></asp:Label>
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
