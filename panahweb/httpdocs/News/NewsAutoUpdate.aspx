<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true"
    CodeBehind="NewsAutoUpdate.aspx.cs" Inherits="HCSSS.CMS.News.NewsAutoUpdate" %>

<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
    <telerik:RadScriptBlock ID="RadScriptBlockMenu" runat="server">
        <script type="text/javascript">
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

            function selectAllCheckbox(chk) {
                $telerik.$(':input[type=checkbox]', $telerik.$('#<%=radGridCategories.ClientID %> *[class=flagDeleteCheckBox]'))
            .each(function () {
                this.checked = chk;
            });
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
            <telerik:AjaxSetting AjaxControlID="pnlForm">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="cmbWebAddress" />
                    <telerik:AjaxUpdatedControl ControlID="pnlForm" />
                    <telerik:AjaxUpdatedControl ControlID="cmbCategory" />
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
            <p style="display:none;">
                <asp:Label ID="lblNewsType" runat="server" CssClass="label w150" Text="Loại tin tức:"></asp:Label>
                <telerik:RadComboBox ID="cmbNewsTypes" Visible="false" runat="server" Height="300px" DataTextField="Name"
                    DataValueField="Id" EmptyMessage="Chọn Loại tin..." Width="454px">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </telerik:RadComboBox>
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
                        <telerik:RadComboBoxItem Text="Chọn loại tin" />
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic"
                    ErrorMessage="Bạn phải nhập <b>nguồn trích dẫn</b><br />" ControlToValidate="txtAuthor"
                    ValidationGroup="UserEdit"></asp:RequiredFieldValidator>
                <asp:Label ID="lblAuthorLabel" runat="server" CssClass="label w150" Text="Nguồn:"></asp:Label>
                <telerik:RadTextBox ID="txtAuthor" runat="server" Width="450px" MaxLength="255" Text="http://www.ipc.HCSSS.gov.vn">
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
                <asp:Label ID="lblLeadLabel" runat="server" CssClass="label w150" Text="Website:"></asp:Label>
                <telerik:RadComboBox ID="cmbWebAddress" Visible="false" runat="server" Height="300px"
                    OnSelectedIndexChanged="cmbWebAddress_SelectedIndexChanged" EmptyMessage="Chọn website lấy tin..."
                    Width="454px" AutoPostBack="true">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn website lấy tin..." Value="0" runat="server" />
                        <telerik:RadComboBoxItem Text="Muabannhadat.com.vn" Value="Muabannhadat.com.vn" runat="server" />
                        <telerik:RadComboBoxItem Text="Diaoconline.vn" Value="Diaoconline.vn" runat="server" />
                        <telerik:RadComboBoxItem Text="Vnexpress.net" Value="Vnexpress.net" runat="server" />
                    </Items>
                </telerik:RadComboBox>
                <asp:Label ID="lblWebsiteAddress" runat="server" Text="http://www.ipc.HCSSS.gov.vn"></asp:Label>
                <asp:Label ID="lblLeadError" runat="server" Text="*" CssClass="red" Visible="false"></asp:Label>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblDetailLabel" runat="server" CssClass="label w150" Text="Mục lấy tin:"></asp:Label>
                <telerik:RadComboBox ID="cmbCategory" runat="server" Height="300px" DataTextField="Name"
                    CausesValidation="true" ValidationGroup="UserEdit" OnSelectedIndexChanged="cmbCategory_SelectedIndexChanged"
                    AutoPostBack="true" DataValueField="Id" EmptyMessage="Chọn mục lấy tin..." Width="454px">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                    <Items>
                        <telerik:RadComboBoxItem Text="Chọn Mục cần lấy tin" Value="" />
                        <telerik:RadComboBoxItem Text="Hợp tác đầu tư" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA8X_2w3My8zNzMqtQU_Qj9KDNc2gwsDfXDQRYhq3A3AKrwNDb0MDd1NvYOMoHIG-AAjgb6fh75uan6BTlZlcEB6YoAP67oWQ!!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/hoptacdautu/"
                            runat="server" />
                        <telerik:RadComboBoxItem Text="Thông tin dự án" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA8X_2w3My8zNzMqtQU_Qj9KDNc2gwsDfXDQRYhq3A3AKrwNDb0MDd1NvYOMoHIG-AAjgb6fh75uan6BTlZlcEB6YoAP67oWQ!!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/thongtinduan/"
                            runat="server" />
                        <telerik:RadComboBoxItem Text="Thông tin doanh nghiệp" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA8X_2w3My8zNzMqtQU_Qj9KDNc2gwsDfXDQRYhq3A3AKrwNDb0MDd1NvYOMoHIG-AAjgb6fh75uan6BTlZlcEB6YoAP67oWQ!!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/thongtindoanhnghiep/"
                            runat="server" />
                        <telerik:RadComboBoxItem Text="Kinh tế xã hội" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA8X_2w3My8zNzMqtQU_Qj9KDNc2gwsDfXDQRYhq3A3AKrwNDb0MDd1NvYOMoHIG-AAjgb6fh75uan6BTlZlcEB6YoAP67oWQ!!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/kinhtexahoi/"
                            runat="server" />
                        <telerik:RadComboBoxItem Text="Pháp luật" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA8X_2w3My8zNzMqtQU_Qj9KDNc2gwsDfXDQRYhq3A3AKrwNDb0MDd1NvYOMoHIG-AAjgb6fh75uan6BTlZlcEB6YoAP67oWQ!!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/phapluat/"
                            runat="server" />
                        <telerik:RadComboBoxItem Text="Xúc tiến đầu tư" Value="http://www.ipc.HCSSS.gov.vn/wps/portal/!ut/p/c5/04_SB8K8xLLM9MSSzPy8xBz9SP0o83gLR1dvZ09LYwMDJ18DA09Hd_NQU3NvY-dAQ_3InNT0xORK_dA831z9sNzEiszczKrUFP0I_SgzXPoMLA31w0E2IatwNwCq8DQ29DA3dTb2DjKByBvgAI4G-n4e-bmp-gU5WZXBAemKAG9SwA8!/dl3/d3/L2dJQSEvUUt3SS9ZQnZ3LzZfOEFFS0NJOTMwMEJNMDBJQUc3VTU3SzNHUTM!/?WCM_GLOBAL_CONTEXT=/wps/wcm/connect/trungtamxtdt/trungtamxtdt/trangchu/tintucsukien/thongtinxuctien/"
                            runat="server" />
                    </Items>
                </telerik:RadComboBox>
                <asp:Label ID="lblDetailError" runat="server" Text="*" CssClass="red" Visible="false"></asp:Label>
                <br class="clear" />
            </p>
            <br />
            <br />
            <asp:Button ID="btnSave" runat="server" Text="Lưu các tin đã chọn" OnClick="btnSave_Click" />
            <br />
            <br />
            <telerik:RadGrid ID="radGridCategories" runat="server" AllowCustomPaging="False"
                AutoGenerateColumns="False" GridLines="None" OnNeedDataSource="radGridCategories_NeedDataSource">
                <MasterTableView ClientDataKeyNames="Id" DataKeyNames="Id" GroupLoadMode="Client"
                    NoMasterRecordsText="Kh&#244;ng c&#243; danh mục n&#224;o.">
                    <RowIndicatorColumn>
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn>
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="<input type='checkbox' onclick='selectAllCheckbox(this.checked)' />">
                            <HeaderStyle HorizontalAlign="Center" Width="40px" Font-Bold="True" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelected" runat="server" CssClass="flagDeleteCheckBox" />
                            </ItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="STT">
                            <HeaderStyle HorizontalAlign="Right" Width="40px" Font-Bold="True" />
                            <ItemTemplate>
                                <%#Container.ItemIndex + 1%>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Id" HeaderText="Id" UniqueName="Id" Visible="False">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Tiêu đề" UniqueName="Name">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Author" HeaderText="Nguồn" UniqueName="Author">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="DateCreate" HeaderText="Ngày tạo" UniqueName="DateCreate">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Lead" HeaderText="Mô tả" UniqueName="Lead">
                            <HeaderStyle Font-Bold="True" Width="300" />
                        </telerik:GridBoundColumn>
                        <%-- <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow"
                            ConfirmText="Bạn c&#243; chắc chắn muốn Xóa Danh mục n&#224;y?" ConfirmTitle="Xóa"
                            HeaderText="Xóa" Text="Xóa" UniqueName="Delete">
                            <HeaderStyle HorizontalAlign="Center" Width="32px" Font-Bold="True" />
                            <ItemStyle HorizontalAlign="Center" Width="32px" />
                        </telerik:GridButtonColumn>--%>
                    </Columns>
                    <%--<SortExpressions>
                <telerik:GridSortExpression FieldName="CategoryName"></telerik:GridSortExpression>
            </SortExpressions>--%>
                </MasterTableView>
                <ClientSettings EnableRowHoverStyle="true">
                    <Resizing AllowColumnResize="True" />
                </ClientSettings>
                <FilterMenu EnableTheming="True">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </FilterMenu>
            </telerik:RadGrid>
        </asp:Panel>
        <div style="clear: both;">
        </div>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail ID="AuditTrail1" runat="server"></uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
