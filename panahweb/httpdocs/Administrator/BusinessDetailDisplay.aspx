<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="BusinessDetailDisplay.aspx.cs" Inherits="HCSSS.Framework.Administrator.BusinessDetailDisplay" %>

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
                <asp:Label ID="lblBusinessTypeNameLabel" runat="server" CssClass="label w150" Text="Loại doanh nghiệp :"></asp:Label>
                <asp:Label ID="lblBusinessTypeName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBusinessStatusNameLabel" runat="server" CssClass="label w150" Text="Trang thái doanh nghiệp :"></asp:Label>
                <asp:Label ID="lblBusinessStatusName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLogoLabel" runat="server" CssClass="label w150" Text="Logo doanh nghiệp:"></asp:Label>
                <asp:Label ID="lblLogo" runat="server" CssClass="label w450" Text=""></asp:Label>
                <asp:HiddenField ID="hidLogo" runat="server"></asp:HiddenField>
                <img alt="Xem Logo doanh nghiệp" title="Xem Logo doanh nghiệp" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblVietNameseNameLabel" runat="server" CssClass="label w150" Text="Tên doanh nghiệp :"></asp:Label>
                <asp:Label ID="lblVietNameseName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblEnglishNameLabel1" runat="server" CssClass="label w150" Text="Tên tiếng anh :"></asp:Label>
                <asp:Label ID="lblenglishName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblshortNameLabel3" runat="server" CssClass="label w150" Text="Tên viết tắt :"></asp:Label>
                <asp:Label ID="lblshortName" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblRegisterNumberLabel5" runat="server" CssClass="label w150" Text="Mã số đăng ký :"></asp:Label>
                <asp:Label ID="lblRegisterNumber" runat="server" CssClass="label w450" Text=""></asp:Label>
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
                <asp:Label ID="lblLegalRepresentationLabel21" runat="server" CssClass="label w150"
                    Text="Pháp lý :"></asp:Label>
                <asp:Label ID="lblLegalRepresentation" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBusinessDescriptionLabel23" runat="server" CssClass="label w150"
                    Text="Giới thiệu :"></asp:Label>
                <asp:Label ID="lblBusinessDescription" runat="server" CssClass="label w450" Text=""></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblCapitalLabel25" runat="server" CssClass="label w150" Text="Vốn :"></asp:Label>
                <asp:Label ID="lblCapital" runat="server" CssClass="label" Text=""></asp:Label>
                &nbsp;VNĐ
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblInsideLabel27" runat="server" CssClass="label w150" Text="Inside :"></asp:Label>
                <asp:CheckBox runat="server" ID="ckdInsite" Enabled="false" />
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
