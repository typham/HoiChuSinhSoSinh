﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="ConferenceEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.ConferenceEdit" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cplhContainer">
    <telerik:RadAjaxLoadingPanel ID="radAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <div class="pd05">
        <telerik:RadAjaxPanel ID="radAjaxPanelView" runat="server" LoadingPanelID="radAjaxLoadingPanel1">
            <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
                <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick">
                    <Items>
                        <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/saveitem.gif" CommandName="Save"
                            Text="Lưu" AccessKey="S">
                        </telerik:RadToolBarButton>
                        <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/goback1.gif" CommandName="GoBacktoView"
                            Text="Quay lại" AccessKey="G">
                        </telerik:RadToolBarButton>
                    </Items>
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadToolBar>
            </asp:Panel>
            <asp:Panel ID="pnlForm" runat="server" CssClass="form-editor-container">
                <uc:ErrorMessage ID="ErrorMessage1" runat="server" />
                <p>
                    <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
                    
                    <br class="clear" />
                </p>
                <p>
                    <asp:Label ID="lblNameLabel" runat="server" CssClass="label w150" Text="Tên hội nghị:"></asp:Label>
                    <telerik:RadTextBox ID="txtName" runat="server" Width="450px" MaxLength="255">
                    </telerik:RadTextBox>
                    <br class="clear" />
                </p>
                <p>
                    <asp:Label ID="lblDetailLabel" runat="server" CssClass="label w150" Text="Mô tả:"></asp:Label>
                    <telerik:RadTextBox ID="txtDetail" runat="server" Width="450px" Height="150px" TextMode="MultiLine"
                        MaxLength="4000">
                    </telerik:RadTextBox>
                    <br class="clear" />
                </p>
            </asp:Panel>
            <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
                <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
            </asp:Panel>
        </telerik:RadAjaxPanel>
    </div>
</asp:Content>
