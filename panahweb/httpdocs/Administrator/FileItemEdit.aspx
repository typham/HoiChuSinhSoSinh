<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="FileItemEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.FileItemEdit" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            var controlId = '';

            function comboLoad(sender, eventArgs) {
                var tree = sender.get_items().getItem(0).findControl("radTreeViewFileCategory");
                if (tree) {
                    var selectedNode = tree.get_selectedNode();
                    if (selectedNode) {
                        sender.set_text(selectedNode.get_text());
                        sender.get_items().getItem(0).set_value(selectedNode.get_value());
                    }
                }
            }
            function OpenFileExplorerDialog(ctrlId, text) {
                controlId = ctrlId;
                var wnd = $find('<%= FileItemExplorerWindow.ClientID %>');
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
                OpenFileExplorerDialog('<%=txtFileUrl.ClientID %>');
            }

            function previewAvatar() {
                var textbox = $find('<%=txtFileUrl.ClientID %>');
                if (textbox && textbox.get_value) window.open(textbox.get_value());
            }

            function nodeClicking(sender, args) {
                var comboBox = $find("<%= cmbParent.ClientID %>");

                var node = args.get_node()

                comboBox.set_text(node.get_text());

                comboBox.trackChanges();
                comboBox.get_items().getItem(0).set_value(node.get_value());
                comboBox.commitChanges();

                comboBox.hideDropDown();
            }

            function StopPropagation(e) {
                if (!e) {
                    e = window.event;
                }

                e.cancelBubble = true;
            }
            function OnClientDropDownOpenedHandler(sender, eventArgs) {
                var tree = sender.get_items().getItem(0).findControl("radTreeViewFileCategory");
                if (tree) {
                    var selectedNode = tree.get_selectedNode();
                    if (selectedNode) {
                        selectedNode.scrollIntoView();
                    }
                }
            }

        </script>
    </telerik:RadScriptBlock>
    <telerik:RadWindow runat="server" Width="680px" Height="550px" VisibleStatusbar="false"
        Behaviors="Close,Move" NavigateUrl="~/Admin/FileManager.aspx" ID="FileItemExplorerWindow"
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Tên file</b><br />" ControlToValidate="txtFileName"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblFileNameLabel" runat="server" CssClass="label w150" Text="Tiêu đề:"></asp:Label>
                <telerik:RadTextBox ID="txtFileName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label1" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Số hiệu văn bản</b><br />" ControlToValidate="txtNumberDocument"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="Label3" runat="server" CssClass="label w150" Text="Số hiệu văn bản:"></asp:Label>
                <telerik:RadTextBox ID="txtNumberDocument" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label4" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Cơ quan ban hành</b><br />" ControlToValidate="txtIssueAgency"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="Label5" runat="server" CssClass="label w150" Text="Cơ quan ban hành:"></asp:Label>
                <telerik:RadTextBox ID="txtIssueAgency" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label6" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Người ký</b><br />" ControlToValidate="txtRegister"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="Label7" runat="server" CssClass="label w150" Text="Người ký:"></asp:Label>
                <telerik:RadTextBox ID="txtRegister" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label8" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
           
            <p>
                <asp:Label ID="lblDateCreateLabel" runat="server" CssClass="label w150" Text="Ngày ban hành:"></asp:Label>
                <telerik:RadDatePicker ID="radIssueDate" runat="server" Culture="Vietnamese (Vietnam)"
                    Width="150px" MinDate="1900-01-01">
                    <Calendar ID="Calendar1" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
                <asp:Label ID="Label10" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>

            <p>
                <asp:Label ID="Label11" runat="server" CssClass="label w150" Text="Ngày hiệu lực:"></asp:Label>
                <telerik:RadDatePicker ID="RadActiveDate"  runat="server" Culture="Vietnamese (Vietnam)"
                    Width="150px" MinDate="1900-01-01">
                    <Calendar ID="Calendar2" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
                <asp:Label ID="Label12" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
              <p>
                <asp:Label ID="Label9" runat="server" CssClass="label w150" Text="Lĩnh vực:"></asp:Label>
                <telerik:RadComboBox ID="cmbScope" runat="server" Height="300px" DataTextField="Name"
                    DataValueField="Id" EmptyMessage="Chọn Lĩnh vực..." Width="454px"> 
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải Chọn <b>danh mục văn bản</b><br />" ControlToValidate="cmbParent"
                    InitialValue="Chọn danh mục file" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblParentLabel" runat="server" CssClass="label w150" Text="Danh mục văn bản :"></asp:Label>
                <telerik:RadComboBox ID="cmbParent" runat="server" Height="300px" Text="Loại tin tức:"
                    Width="450px" OnClientLoad="comboLoad" OnClientDropDownOpened="OnClientDropDownOpenedHandler">
                    <ItemTemplate>
                        <div id="div1" onclick="StopPropagation(event)">
                            <telerik:RadTreeView runat="server" ID="radTreeViewFileCategory" OnClientNodeClicking="nodeClicking"
                                DataFieldID="Id" DataFieldParentID="PId" DataTextField="DisplayName">
                            </telerik:RadTreeView>
                        </div>
                    </ItemTemplate>
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn danh mục file" Value="0" />
                    </Items>
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
             <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải Chọn <b>Loại  văn bản</b><br />" ControlToValidate="cmbFileType"
                    InitialValue="Chọn loại văn bản" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblFileType" runat="server" CssClass="label w150" Text="Loại văn bản :"></asp:Label>
                <telerik:RadComboBox ID="cmbFileType" runat="server" Height="300px" Text="Loại văn bản :"
                    Width="450px">
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn loại file" Value="0" />
                        <telerik:RadComboBoxItem Text="Word" Value="W" />
                        <telerik:RadComboBoxItem Text="Excel" Value="E" />
                        <telerik:RadComboBoxItem Text="PDF" Value="P" />
                        <telerik:RadComboBoxItem Text="Rar" Value="R" />
                        <telerik:RadComboBoxItem Text="Zip" Value="Z" />
                    </Items>
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <asp:Label ID="Label2" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblUrlLabel" runat="server" CssClass="label w150" Text="File :"></asp:Label>
                <telerik:RadTextBox ID="txtFileUrl" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <img alt="Chọn file" title="Chọn file" class="cpointer" src="/Images/SmallIcon/40.png"
                    onclick="selectAvatar()" />
                <img alt="Xem file" title="Xem file" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblKeywordsLabel" runat="server" CssClass="label w150" Text="Từ khóa:"></asp:Label>
                <telerik:RadTextBox ID="txtKeywords" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
           
             <p>
                <asp:Label ID="lblNewsType" runat="server" CssClass="label w150" Text="Ngôn ngữ:"></asp:Label>
                <telerik:RadComboBox ID="cmbLanguage" runat="server" Height="300px" DataTextField="Name"
                    DataValueField="Id" EmptyMessage="Chọn ngôn ngữ..." Width="454px">
                    <Items>
                        <telerik:RadComboBoxItem Text="Tiếng việt" Value="VN" />
                        <telerik:RadComboBoxItem Text="Tiếng Anh" Value="EN" />
                    </Items>
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
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
