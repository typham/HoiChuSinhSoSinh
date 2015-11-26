<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="BanksDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.BanksDisplay" %>
<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
<telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            function previewAvatar() {
                var hidden = $get('<%=hidLogo.ClientID %>');
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
                <asp:Label ID="lblLogoLabel" runat="server" CssClass="label w150" Text="Logo ngân hàng:"></asp:Label>
                <asp:Label ID="lblLogo" runat="server" CssClass="label w450" Text=""></asp:Label>
                <asp:HiddenField ID="hidLogo" runat="server"></asp:HiddenField>
                <img alt="Xem Logo ngân hàng" title="Xem Logo ngân hàng" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBanksNameLabel" runat="server" CssClass="label w150" Text="Tên ngân hàng :"></asp:Label>
                <asp:Label ID="lblBanksName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
           
            <p>
                <asp:Label ID="lblshortNameLabel3" runat="server" CssClass="label w150" Text="Tên viết tắt :"></asp:Label>
                <asp:Label ID="lblshortName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblAddressLabel5" runat="server" CssClass="label w150" Text="Địa chỉ :"></asp:Label>
                <asp:Label ID="lblAddress" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDistrictLabel7" runat="server" CssClass="label w150" Text="Quận/Huyện :"></asp:Label>
                <asp:Label ID="lblDistrict" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblWardLabel9" runat="server" CssClass="label w150" Text="Phường/Xã :"></asp:Label>
                <asp:Label ID="lblWard" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblStreetLabel11" runat="server" CssClass="label w150" Text="Đường :"></asp:Label>
                <asp:Label ID="lblStreet" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblPhoneLabel13" runat="server" CssClass="label w150" Text="Số điện thoại :"></asp:Label>
                <asp:Label ID="lblPhone" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblFaxLabel15" runat="server" CssClass="label w150" Text="Số Fax :"></asp:Label>
                <asp:Label ID="lblFax" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblEmaillabel" runat="server" CssClass="label w150" Text="Email :"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblWebsitelabel" runat="server" CssClass="label w150" Text="Website :"></asp:Label>
                <asp:Label ID="lblWebsite" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLegalRepresentationLabel21" runat="server" CssClass="label w150" Text="Pháp lý :"></asp:Label>
                <asp:Label ID="lblLegalRepresentation" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBusinessDescriptionLabel23" runat="server" CssClass="label w150" Text="Giới thiệu :"></asp:Label>
                <asp:Label ID="lblBusinessDescription" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            
            <p>
                <asp:Label ID="lblLanguage" runat="server" CssClass="label w150" Text="Ngôn ngữ:"></asp:Label>
                <telerik:RadComboBox ID="cmbLanguage" Enabled="false" runat="server" Height="300px" Text="Ngôn ngữ:"
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
            
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
