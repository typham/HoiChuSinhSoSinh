<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="BusinessDetailEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.BusinessDetailEdit" %>

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
                <asp:Label ID="lblBusinessTypeIdlabel" runat="server" CssClass="label w150" Text="Loại hình doanh nghiệp :"></asp:Label>
                <telerik:RadComboBox ID="cmbBusinessTypeId" runat="server" Height="300px" Text="Loại doanh nghiệp:"
                    DataValueField="Id" DataTextField="BusinessTypeName" Width="450px">
                    <CollapseAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBusinessStatusIDlabel" runat="server" CssClass="label w150" Text="Trạng thái doanh nghiệp :"></asp:Label>
                <telerik:RadComboBox ID="cmbBusinessStatusID" runat="server" Height="300px" Text="Trạng thái doanh nghiệp:"
                    DataValueField="Id" DataTextField="BusinessStatusName" Width="450px">
                    <CollapseAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLogoLabel" runat="server" CssClass="label w150" Text="Logo doanh nghiệp:"></asp:Label>
                <telerik:RadTextBox ID="txtLogo" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <img alt="Chọn Hình ảnh đại diện" title="Chọn Hình ảnh đại diện" class="cpointer"
                    src="/Images/SmallIcon/40.png" onclick="selectAvatar()" />
                <img alt="Xem Hình ảnh đại diện" title="Xem Hình ảnh đại diện" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>tên doanh nghiệp</b><br />" ControlToValidate="txtVietnammeseName"
                    InitialValue="Nhập tên doanh nghiệp" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblVietnammeseNameLabel" runat="server" CssClass="label w150" Text="Tên doanh nghiệp:"></asp:Label>
                <telerik:RadTextBox ID="txtVietnammeseName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblEnglishNameLabel" runat="server" CssClass="label w150" Text="Tên tiếng anh:"></asp:Label>
                <telerik:RadTextBox ID="txtEnglishName" runat="server" Width="450px" MaxLength="255">
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
                <asp:Label ID="lblRegidterNumLabel" runat="server" CssClass="label w150" Text="Mã số đăng ký:"></asp:Label>
                <%--  <telerik:RadNumericTextBox ID="txtRegisterNum" runat="server" MinValue="1" Value="1"
                    Width="450px" CssClass="right">
                </telerik:RadNumericTextBox>--%>
                <telerik:RadTextBox ID="txtRegisterNum" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblRegisterDateLabel" runat="server" CssClass="label w150" Text="Ngày Đăng ký:"></asp:Label>
                <telerik:RadDatePicker ID="radDpkRegisterDate" Width="120px" runat="server" Culture="Vietnamese (Vietnam)"
                    MinDate="1900-01-01">
                    <Calendar ID="Calendar1" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
                <asp:Label ID="Label3" runat="server" CssClass="red" Text="*"></asp:Label>
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
                    Text="Người đại diện PL:"></asp:Label>
                <telerik:RadTextBox ID="txtLegalRepresentation" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblLegalRepAddressLabel7" runat="server" CssClass="label w150" Text="Địa chỉ:"></asp:Label>
                <telerik:RadTextBox ID="txtLegalRepAddress" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblBusinessDescriptionLabel8" runat="server" CssClass="label w150"
                    Text="Ngành nghề KD:"></asp:Label>
                <telerik:RadTextBox ID="txtBusinessDescription" TextMode="MultiLine" Height="200px"
                    runat="server" Width="450px" MaxLength="2000">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblCapitalLabel10" runat="server" CssClass="label w150" Text="Vốn kinh doanh :"></asp:Label>
                <telerik:RadNumericTextBox ID="txtCapital" runat="server" MinValue="1" Value="1"
                    Width="450px" CssClass="right">
                    <NumberFormat DecimalDigits="0" />
                </telerik:RadNumericTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblInsideLabel11" runat="server" CssClass="label w150" Text="DN Ngoài Quốc Doanh:"></asp:Label>
                <asp:CheckBox runat="server" ID="ckbInside" />
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
