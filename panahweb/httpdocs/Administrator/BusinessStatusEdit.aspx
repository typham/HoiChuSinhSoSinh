<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="BusinessStatusEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.BusinessStatusEdit" %>
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
                    ErrorMessage="Bạn phải nhập <b>Trạng thái doanh nghiệp</b><br />" ControlToValidate="txtBusinessStatusName"
                    InitialValue="Nhập Trạng thái doanh nghiệp" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="txtBusinessStatusNameLabel" runat="server" CssClass="label w150" Text="Trạng thái doanh nghiệp:"></asp:Label>
                <telerik:RadTextBox ID="txtBusinessStatusName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblOrdLabel" runat="server" CssClass="label w150" Text="Thứ tự:"></asp:Label>
                <telerik:RadNumericTextBox ID="txtOrd" runat="server" MinValue="1" Value="1" Width="450px"
                    CssClass="right">
                    <NumberFormat DecimalDigits="0" />
                </telerik:RadNumericTextBox>
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
