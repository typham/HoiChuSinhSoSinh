<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="BanksEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.BanksEdit" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            var controlId = '';

            function OpenFileExplorerDialog(ctrlId, text) {
                controlId = ctrlId;
                var wnd = $find('<%= FileExplorerWindow.ClientID %>');
                //add the name of the function to be executed when RadWindow is closed
                wnd.add_close(OnFileSelected);
                wnd.show();
            }

            //This function is called from the FileExplorer.aspx page
            function OnFileSelected(wnd, args) {
                var textbox = $find(controlId);
                //if (textbox && textbox.set_value) textbox.set_value(args.get_argument().fileSelected);
                if (textbox && textbox.set_value) {
                    var files = args.get_argument();
                    if (!files || !files.length) return;
                    var v = '';
                    for (i = 0; i < files.length; i++) {
                        if (v) v += ',';
                        v += files[i].file;
                    }
                    textbox.set_value(v);
                }
            }

            function selectAvatar() {
                OpenFileExplorerDialog('<%=txtLogo.ClientID %>');
            }

            function previewAvatar() {
                var textbox = $find('<%=txtLogo.ClientID %>');
                if (textbox && textbox.get_value) window.open(textbox.get_value());
            }

        </script>
    </telerik:RadScriptBlock>
    <telerik:RadWindow runat="server" Width="680px" Height="550px" VisibleStatusbar="false"
        Behaviors="Close,Move" NavigateUrl="/Admin/FileManager.aspx" ID="FileExplorerWindow"
        Modal="True">
    </telerik:RadWindow>
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
                <asp:Label ID="lblLogoLabel" runat="server" CssClass="label w150" Text="Logo ngân hàng:"></asp:Label>
                <telerik:RadTextBox ID="txtLogo" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <img alt="Chọn Logo ngân hàng" title="Chọn Logo ngân hàng" class="cpointer" src="/Images/SmallIcon/40.png"
                    onclick="selectAvatar()" />
                <img alt="Xem Logo ngân hàng" title="Xem Logo ngân hàng" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>tên Ngân hàng</b><br />" ControlToValidate="txtBanksName"
                    InitialValue="Nhập tên doanh nghiệp" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblBanksNameLabel" runat="server" CssClass="label w150" Text="Tên ngân hàng:"></asp:Label>
                <telerik:RadTextBox ID="txtBanksName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblShortNameLabel" runat="server" CssClass="label w150" Text="Tên viết tắt:"></asp:Label>
                <telerik:RadTextBox ID="txtShortName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblAddressLabel2" runat="server" CssClass="label w150" Text="Địa chỉ:"></asp:Label>
                <telerik:RadTextBox ID="txtAddress" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDistrictIdLabel1" runat="server" CssClass="label w150" Text="TP, TX, Huyện :"></asp:Label>
                <telerik:RadComboBox ID="cmbDistrictId" runat="server" Height="300px" Text="Quận/Huyện"
                    AutoPostBack="true" DataValueField="Id" DataTextField="Name" Width="450px">
                    <CollapseAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblWardIdLabel2" runat="server" CssClass="label w150" Text="Phường/Xã :"></asp:Label>
                <telerik:RadComboBox ID="cmbWardId" runat="server" Height="300px" Text="Phường/Xã :"
                    DataValueField="Id" DataTextField="Name" Width="450px">
                    <CollapseAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblStreetLabel3" runat="server" CssClass="label w150" Text="Đường:"></asp:Label>
                <telerik:RadComboBox ID="cmbStreet" runat="server" Height="300px" Text="Đường:" DataValueField="Id"
                    DataTextField="Name" Width="450px">
                    <CollapseAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblPhoneLabel3" runat="server" CssClass="label w150" Text="Số điện thoại:"></asp:Label>
                <telerik:RadTextBox ID="txtPhone" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblFaxLabel4" runat="server" CssClass="label w150" Text="Số Fax:"></asp:Label>
                <telerik:RadTextBox ID="txtFax" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:RegularExpressionValidator ID="ragEmail" runat="server" Display="Dynamic" ControlToValidate="txtEmail"
                    ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"
                    ValidationGroup="UserEdit" ErrorMessage="Nhập email không đúng "></asp:RegularExpressionValidator>
                <asp:Label ID="lblEmaillabel" runat="server" CssClass="label w150" Text="Email:"></asp:Label>
                <telerik:RadTextBox ID="txtEmail" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblWebsiteLabel6" runat="server" CssClass="label w150" Text="Website:"></asp:Label>
                <telerik:RadTextBox ID="txtWebsite" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLegalRepresentationLabel7" runat="server" CssClass="label w150"
                    Text="Pháp lý:"></asp:Label>
                <telerik:RadTextBox ID="txtLegalRepresentation" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBanksDescriptionLabel8" runat="server" CssClass="label w150" Text="Thông tin giới thiệu:"></asp:Label>
                <telerik:RadTextBox ID="txtBanksDescription" TextMode="MultiLine" Height="200px"
                    runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải Chọn <b>Ngôn ngử</b><br />" ControlToValidate="cmbLanguage"
                    InitialValue="Chọn ngôn ngữ" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblLanguage" runat="server" CssClass="label w150" Text="Ngôn ngữ:"></asp:Label>
                <telerik:RadComboBox ID="cmbLanguage" runat="server" Height="300px" Text="Ngôn ngữ:"
                    Width="450px">
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn ngôn ngữ" Value="0" />
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
        <div style="clear: both;">
        </div>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
