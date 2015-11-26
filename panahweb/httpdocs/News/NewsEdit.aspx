<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="NewsEdit.aspx.cs" Inherits="HCSSS.CMS.News.NewsEdit" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock runat="server" ID="scriptBlock">
        <script type="text/javascript">

            var controlId = '';

            function comboLoad(sender, eventArgs) {
                var tree = sender.get_items().getItem(0).findControl("radTreeViewCategory");
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
                OpenFileExplorerDialog('<%=txtUrl.ClientID %>');
            }

            function previewAvatar() {
                var textbox = $find('<%=txtUrl.ClientID %>');
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
                var tree = sender.get_items().getItem(0).findControl("radTreeViewCategory");
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
                    ErrorMessage="Bạn phải nhập Tiêu đề<b>Tiêu đề</b><br />" ControlToValidate="txtName"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblLoginNameLabel" runat="server" CssClass="label w150" Text="Tiêu đề:"></asp:Label>
                <telerik:RadTextBox ID="txtName" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <asp:Label ID="Label1" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="Label4" runat="server" CssClass="label w150" Text="Alias Url:"></asp:Label>
                     <telerik:RadTextBox ID="txtAliasUrl" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblTitleType" runat="server" CssClass="label w150" Text="Hiển thị tin trên trang chủ:"></asp:Label>
                <asp:CheckBox ID="ckcTitle" runat="server" />
                <br class="clear" />
            </p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải Chọn <b>Loại tin</b><br />" ControlToValidate="cmbParent"
                    InitialValue="Chọn loại tin" ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblParentLabel" runat="server" CssClass="label w150" Text="Loại tin tức:"></asp:Label>
                <telerik:RadComboBox ID="cmbParent" runat="server" Height="300px" Text="Loại tin tức:"
                    Width="450px" OnClientLoad="comboLoad" OnClientDropDownOpened="OnClientDropDownOpenedHandler">
                    <ItemTemplate>
                        <div id="div1" onclick="StopPropagation(event)">
                            <telerik:RadTreeView runat="server" ID="radTreeViewCategory" OnClientNodeClicking="nodeClicking"
                                DataFieldID="Id" DataFieldParentID="PId" DataTextField="DisplayName">
                            </telerik:RadTreeView>
                        </div>
                    </ItemTemplate>
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn loại tin" Value="0" />
                    </Items>
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDateCreateLabel" runat="server" CssClass="label w150" Text="Ngày tạo:"></asp:Label>
                <telerik:RadDatePicker ID="radDpkDateCreate" runat="server" Culture="Vietnamese (Vietnam)"
                    Width="90px" MinDate="1900-01-01">
                    <Calendar ID="Calendar1" runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                        ViewSelectorText="x">
                    </Calendar>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
                <asp:Label ID="Label3" runat="server" CssClass="red" Text="*"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblUrlLabel" runat="server" CssClass="label w150" Text="Hình ảnh mô tả:"></asp:Label>
                <telerik:RadTextBox ID="txtUrl" runat="server" Width="450px" MaxLength="255">
                </telerik:RadTextBox>
                <img alt="Chọn Hình ảnh đại diện" title="Chọn Hình ảnh đại diện" class="cpointer"
                    src="/Images/SmallIcon/40.png" onclick="selectAvatar()" />
                <img alt="Xem Hình ảnh đại diện" title="Xem Hình ảnh đại diện" class="cpointer" src="/Images/SmallIcon/75.png"
                    onclick="previewAvatar()" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblAuthorLabel" runat="server" CssClass="label w150" Text="Nguồn:"></asp:Label>
                <telerik:RadTextBox ID="txtAuthor" runat="server" Width="450px" MaxLength="255">
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
            <p>
                <asp:Label ID="lblLeadLabel" runat="server" CssClass="label w150" Text="Trích dẫn:"></asp:Label>
                <asp:Label ID="lblLeadError" runat="server" Text="*" CssClass="red" Visible="false"></asp:Label>
                <br class="clear" />
                <span id="counter" class="red" style="display: none;">Trích dẫn không được vượt quá
                    50 từ hoặc 250 ký tự!</span>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Trích dẩn</b><br />" ControlToValidate="radEditorLead"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>--%>
            </p>
            <telerik:RadEditor ID="radEditorLead" runat="server" EditModes="All" Height="250px"
                Width="725px" Font-Names="Arial" Font-Size="12px">
                <Modules>
                    <telerik:EditorModule Name="RadEditorStatistics" ScriptFile="" />
                    <telerik:EditorModule Name="RadEditorDomInspector" ScriptFile="" />
                </Modules>
                <Tools>
                    <telerik:EditorToolGroup>
                        <%--<telerik:EditorTool Name="InsertNews" Text="Ch&#232;n tin b&#224;i li&#234;n quan" />
                        <telerik:EditorTool Name="InsertLogo" Text="Ch&#232;n logo" />
                        <telerik:EditorTool Name="Rolo" Text="Tin Rolo" />--%>
                        <telerik:EditorTool Name="Print" />
                        <telerik:EditorTool Name="FindAndReplace" />
                        <telerik:EditorTool Name="Cut" />
                        <telerik:EditorTool Name="Copy" />
                        <telerik:EditorTool Name="Paste" />
                        <telerik:EditorTool Name="PastePlainText" />
                        <telerik:EditorTool Name="FormatStripper" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="Undo" ShortCut="CTRL+Z" />
                        <telerik:EditorTool Name="Redo" ShortCut="CTRL+Y" />
                    </telerik:EditorToolGroup>
                    <telerik:EditorToolGroup>
                        <telerik:EditorTool Name="ImageManager" ShortCut="CTRL+M" Text="ImageManager with ImageEditor" />
                        <telerik:EditorTool Name="LinkManager" />
                        <telerik:EditorTool Name="Unlink" Text="Remove link" />
                    </telerik:EditorToolGroup>
                    <telerik:EditorToolGroup>
                        <telerik:EditorTool Name="Bold" />
                        <telerik:EditorTool Name="Italic" />
                        <telerik:EditorTool Name="Underline" />
                        <telerik:EditorTool Name="JustifyCenter" />
                        <telerik:EditorTool Name="JustifyFull" />
                        <telerik:EditorTool Name="JustifyLeft" />
                        <telerik:EditorTool Name="JustifyNone" />
                        <telerik:EditorTool Name="JustifyRight" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="Indent" />
                        <telerik:EditorTool Name="Outdent" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="InsertOrderedList" />
                        <telerik:EditorTool Name="InsertUnorderedList" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="ConvertToLower" ShortCut="CTRL+SHIFT+L" />
                        <telerik:EditorTool Name="ConvertToUpper" ShortCut="CTRL+SHIFT+U" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="InsertSymbol" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="ForeColor" />
                        <telerik:EditorTool Name="BackColor" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="FontName" />
                        <telerik:EditorTool Name="RealFontSize" />
                    </telerik:EditorToolGroup>
                </Tools>
                <ImageManager ViewPaths="~/Images/News/" DeletePaths="~/Images/News/" UploadPaths="~/Images/News/"
                    MaxUploadFileSize="1024000000" SearchPatterns="*.gif,*.jpg,*.jpeg,*.jpe,*.tiff,*.tif,*.bmp,*.png,*.zip" />
                <DocumentManager ViewPaths="~/Documents/" MaxUploadFileSize="1024000000" SearchPatterns="*.*" />
                <ContextMenus>
                    <telerik:EditorContextMenu TagName="IMG">
                        <telerik:EditorTool Name="Cut" />
                        <telerik:EditorTool Name="Copy" />
                        <telerik:EditorTool Name="Paste" />
                    </telerik:EditorContextMenu>
                    <telerik:EditorContextMenu TagName="P">
                        <telerik:EditorTool Name="JustifyLeft" />
                        <telerik:EditorTool Name="JustifyCenter" />
                        <telerik:EditorTool Name="JustifyRight" />
                        <telerik:EditorTool Name="JustifyFull" />
                    </telerik:EditorContextMenu>
                </ContextMenus>
                <Content>
                </Content>
            </telerik:RadEditor>
            <%--<telerik:RadEditor ID="radEditorLead" runat="server">
            </telerik:RadEditor>--%>
            <p>
                <asp:Label ID="lblDetailLabel" runat="server" Text="Nội dung:"></asp:Label>
                <asp:Label ID="lblDetailError" runat="server" Text="*" CssClass="red" Visible="false"></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>Nội dung</b><br />" ControlToValidate="radEditorMsgContent"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <br class="clear" />
            </p>
            <telerik:RadEditor ID="radEditorMsgContent" runat="server" EditModes="All" Height="500px"
                Width="725px" Font-Names="Arial" Font-Size="11px">
                <Modules>
                    <telerik:EditorModule Name="RadEditorStatistics" ScriptFile="" />
                    <telerik:EditorModule Name="RadEditorDomInspector" ScriptFile="" />
                    <telerik:EditorModule Name="RadEditorNodeInspector" ScriptFile="" />
                </Modules>
                <Tools>
                    <telerik:EditorToolGroup>
                        <%--<telerik:EditorTool Name="InsertNews" Text="Ch&#232;n tin b&#224;i li&#234;n quan" />
                        <telerik:EditorTool Name="InsertLogo" Text="Ch&#232;n logo" />
                        <telerik:EditorTool Name="InsertSurvey" Text="Ch&#232;n thăm d&#242;" />
                        <telerik:EditorTool Name="Rolo" Text="Tin Rolo" />--%>
                        <telerik:EditorTool Name="Print" />
                        <telerik:EditorTool Name="FindAndReplace" />
                        <telerik:EditorTool Name="Cut" />
                        <telerik:EditorTool Name="Copy" />
                        <telerik:EditorTool Name="Paste" />
                        <telerik:EditorTool Name="PastePlainText" />
                        <telerik:EditorTool Name="PasteFromWord" />
                        <telerik:EditorTool Name="PasteAsHtml" />
                        <telerik:EditorTool Name="FormatStripper" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="Undo" ShortCut="CTRL+Z" />
                        <telerik:EditorTool Name="Redo" ShortCut="CTRL+Y" />
                    </telerik:EditorToolGroup>
                    <telerik:EditorToolGroup>
                        <telerik:EditorTool Name="ImageManager" ShortCut="CTRL+M" Text="ImageManager with ImageEditor" />
                        <telerik:EditorTool Name="FlashManager" />
                        <telerik:EditorTool Name="MediaManager" />
                        <telerik:EditorTool Name="DocumentManager" />
                        <telerik:EditorTool Name="TemplateManager" />
                        <telerik:EditorTool Name="LinkManager" />
                        <telerik:EditorTool Name="Unlink" Text="Remove link" />
                    </telerik:EditorToolGroup>
                    <telerik:EditorToolGroup>
                        <telerik:EditorTool Name="Bold" />
                        <telerik:EditorTool Name="Italic" />
                        <telerik:EditorTool Name="Underline" />
                        <telerik:EditorTool Name="JustifyCenter" />
                        <telerik:EditorTool Name="JustifyFull" />
                        <telerik:EditorTool Name="JustifyLeft" />
                        <telerik:EditorTool Name="JustifyNone" />
                        <telerik:EditorTool Name="JustifyRight" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="Indent" />
                        <telerik:EditorTool Name="Outdent" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="InsertOrderedList" />
                        <telerik:EditorTool Name="InsertUnorderedList" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="ConvertToLower" ShortCut="CTRL+SHIFT+L" />
                        <telerik:EditorTool Name="ConvertToUpper" ShortCut="CTRL+SHIFT+U" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="ForeColor" />
                        <telerik:EditorTool Name="BackColor" />
                        <telerik:EditorTool Name="ApplyClass" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="FontName" />
                        <telerik:EditorTool Name="RealFontSize" />
                    </telerik:EditorToolGroup>
                    <telerik:EditorToolGroup>
                        <telerik:EditorTool Name="InsertTable" />
                        <telerik:EditorTool Name="InsertSymbol" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="Subscript" Text="Subscript" />
                        <telerik:EditorTool Name="Superscript" Text="Superscript" />
                        <telerik:EditorTool Name="InsertParagraph" Text="InsertParagraph" />
                        <telerik:EditorTool Name="InsertGroupbox" Text="InsertGroupbox" />
                        <telerik:EditorTool Name="InsertHorizontalRule" Text="InsertHorizontalRule" />
                        <telerik:EditorTool Name="InsertDate" Text="InsertDate" />
                        <telerik:EditorTool Name="InsertTime" Text="InsertTime" />
                        <telerik:EditorTool Name="SetImageProperties" />
                        <telerik:EditorTool Name="ImageMapDialog" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="FindAndReplace" />
                        <telerik:EditorTool Name="TableWizard" />
                        <telerik:EditorTool Name="LinkManager" />
                        <telerik:EditorTool Name="PageProperties" />
                        <telerik:EditorSeparator />
                        <telerik:EditorTool Name="RepeatLastCommand" />
                        <telerik:EditorTool Name="Zoom" />
                        <telerik:EditorTool Name="ToggleScreenMode" />
                    </telerik:EditorToolGroup>
                </Tools>
                <%-- <ImageManager ViewPaths="~/Images/News/" UploadPaths="~/Images/News/" MaxUploadFileSize="102400"
                    SearchPatterns="*.gif,*.jpg,*.jpeg,*.jpe,*.tiff,*.tif,*.bmp,*.png,*.zip" />--%>
                <ImageManager ViewPaths="~/Images/News/" DeletePaths="~/Images/News/" UploadPaths="~/Images/News/"
                    MaxUploadFileSize="1024000000" SearchPatterns="*.gif,*.jpg,*.jpeg,*.jpe,*.tiff,*.tif,*.bmp,*.png,*.zip" />
                <FlashManager ViewPaths="~/Images/Flash/" UploadPaths="~/Images/Flash/" MaxUploadFileSize="1024000000" />
                <MediaManager ViewPaths="~/Images/Media/" UploadPaths="~/Images/Media/" MaxUploadFileSize="1024000000" />
                <DocumentManager ViewPaths="~/Documents/" UploadPaths="~/Documents/" MaxUploadFileSize="1024000000"
                    SearchPatterns="*.*" />
                <TemplateManager MaxUploadFileSize="1024000000" ViewPaths="~/Documents/Templates/" UploadPaths="~/Resources/Templates/" />
                <ContextMenus>
                    <telerik:EditorContextMenu TagName="IMG">
                        <telerik:EditorTool Name="Cut" />
                        <telerik:EditorTool Name="Copy" />
                        <telerik:EditorTool Name="Paste" />
                    </telerik:EditorContextMenu>
                    <telerik:EditorContextMenu TagName="P">
                        <telerik:EditorTool Name="JustifyLeft" />
                        <telerik:EditorTool Name="JustifyCenter" />
                        <telerik:EditorTool Name="JustifyRight" />
                        <telerik:EditorTool Name="JustifyFull" />
                    </telerik:EditorContextMenu>
                </ContextMenus>
                <CssFiles>
                    <telerik:EditorCssFile Value="Styles/article.css" />
                </CssFiles>
                <Content>
                </Content>
            </telerik:RadEditor>
        </asp:Panel>
        <div style="clear: both;">
        </div>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
