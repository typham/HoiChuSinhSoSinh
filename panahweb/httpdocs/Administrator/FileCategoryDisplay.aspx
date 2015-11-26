<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="FileCategoryDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.FileCategoryDisplay" %>
<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
 <div class="pd05">
        <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
            <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick" OnClientButtonClicking="radToolBarDefault_ClientButtonClicking">
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
                    <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/10.gif" CommandName="Copy"
                        Text="Copy" AccessKey="C">
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
          <%--  <p>
                <asp:Label ID="lblPartitionIdLabel" runat="server" CssClass="label w150" Text="Partition Id:"></asp:Label>
                <asp:Label ID="lblPartitionId" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>--%>
            <p>
                <asp:Label ID="lblParentNameLabel" runat="server" CssClass="label w150" Text="Danh mục cha:"></asp:Label>
                <asp:Label ID="lblParentName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblOrderLabel" runat="server" CssClass="label w150" Text="Thứ tự:"></asp:Label>
                <asp:Label ID="lblOrder" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblNameLabel" runat="server" CssClass="label w150" Text="Tên Danh mục file :"></asp:Label>
                <asp:Label ID="lblName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
          <%--  <p>
                <asp:Label ID="lblAliasLabel" runat="server" CssClass="label w150" Text="Alias:"></asp:Label>
                <asp:Label ID="lblAlias" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDisplayNameLabel" runat="server" CssClass="label w150" Text="Tên hiển thị:"></asp:Label>
                <asp:Label ID="lblDisplayName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblUrlLabel" runat="server" CssClass="label w150" Text="Url:"></asp:Label>
                <asp:Label ID="lblUrl" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>--%>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải Chọn <b>Ngôn ngử</b><br />" ControlToValidate="cmbLanguage"
                    InitialValue="Chọn ngôn ngữ" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
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
                <asp:Label ID="Label2" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblNoteLabel" runat="server" CssClass="label w150" Text="Ghi chú:"></asp:Label>
                <asp:Label ID="lblNote" runat="server" CssClass="label w450"></asp:Label>
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail id="AuditTrail1" runat="server">
            </uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
