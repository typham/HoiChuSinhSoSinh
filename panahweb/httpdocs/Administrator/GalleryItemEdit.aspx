<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="GalleryItemEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.GalleryItemEdit" %>

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
                OpenFileExplorerDialog('<%=txtgitempath.ClientID %>');
            }

            function previewAvatar() {
                var textbox = $find('<%=txtgitempath.ClientID %>');
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
                    ErrorMessage="Bạn phải nhập tên gallery<b>Loại tin tức</b><br />" ControlToValidate="txtgitemname"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblgitemnameLabel" runat="server" CssClass="label w150" Text="Tên gallery:"></asp:Label>
                <telerik:RadTextBox ID="txtgitemname" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label1" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblGalleryCatLabel" runat="server" CssClass="label w150" Text="Danh mục Gallery:"></asp:Label>
                <telerik:RadComboBox ID="cmbGalleryCat" runat="server" Height="300px" DataTextField="albumname"
                    DataValueField="Id" EmptyMessage="Chọn danh mục Gallery..." Width="454px">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitemlinkurlLabel" runat="server" CssClass="label w150" Text="Link:"></asp:Label>
                <telerik:RadTextBox ID="txtgitemlinkurl" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitemtype" runat="server" CssClass="label w150" Text="Loại Gallery:"></asp:Label>
                <telerik:RadComboBox ID="cmbgitemtype" runat="server" Height="300px" EmptyMessage="Chọn Loại Gallery..."
                    Width="454px">
                    <Items>
                        <%--<telerik:RadComboBoxItem runat="server" Text="Chưa kích hoạt" Value="Chưa kích hoạt" />--%>
                        <telerik:RadComboBoxItem runat="server" Text="Hình ảnh" Value="1" />
                        <telerik:RadComboBoxItem runat="server" Text="Video" Value="2" />
                        <%--<telerik:RadComboBoxItem runat="server" Text="Danh sách đen" Value="Danh sách đen" />
                                <telerik:RadComboBoxItem runat="server" Text="Danh sách trắng" Value="Danh sách trắng" />
                                <telerik:RadComboBoxItem runat="server" Text="Danh sách đỏ" Value="Danh sách đỏ" />--%>
                    </Items>
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblgitempathLabel" runat="server" CssClass="label w150" Text="File :"></asp:Label>
                <telerik:RadTextBox ID="txtgitempath" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <img alt="Chọn file" title="Chọn file" class="cpointer" src="/Images/SmallIcon/40.png"
                    onclick="selectAvatar()" />
                <img alt="Xem file" title="Xem file" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
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
