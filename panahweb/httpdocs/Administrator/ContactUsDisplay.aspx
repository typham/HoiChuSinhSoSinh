<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="ContactUsDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.ContactUsDisplay" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
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
                <asp:Label ID="lblFullNameLabel" runat="server" CssClass="label w150" Text="Họ tên :"></asp:Label>
                <asp:Label ID="lblFullName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblYourCompanyLabel" runat="server" CssClass="label w150" Text="Công ty :"></asp:Label>
                <asp:Label ID="lblYourCompany" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblEmailLabel" runat="server" CssClass="label w150" Text="Email :"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblAddressLabel5" runat="server" CssClass="label w150" Text="Địa chỉ :"></asp:Label>
                <asp:Label ID="lblAddress" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblPhoneLabel13" runat="server" CssClass="label w150" Text="Số điện thoại :"></asp:Label>
                <asp:Label ID="lblPhone" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDetailLabel15" runat="server" CssClass="label w150" Text="Nội dung :"></asp:Label>
                <asp:Label ID="lblDetail" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
