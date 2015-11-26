<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="FileCategoryEdit.aspx.cs" Inherits="HCSSS.Framework.Administrator.FileCategoryEdit" %>
<%@ Register Src="~/UserControls/AuditTrail.ascx" TagName="AuditTrail" TagPrefix="uc" %>
<%@ Register Src="~/UserControls/ErrorMessage.ascx" TagName="ErrorMessage" TagPrefix="uc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
 <telerik:RadScriptBlock ID="RadScriptBlockCategory" runat="server">

        <script type="text/javascript">
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
    <%--<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="radAjaxLoadingPanel1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="radToolBarDefault">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="radToolBarDefault" />
                    <telerik:AjaxUpdatedControl ControlID="pnlForm" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>--%>
    <telerik:RadAjaxLoadingPanel ID="radAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <div class="pd05">
        <asp:Panel ID="pnlToolbar" runat="server" CssClass="radtoolbar">
            <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick">
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
            <uc:ErrorMessage id="ErrorMessage1" runat="server" />
            <p>
                <asp:Label ID="lblPartitionIdLabel" runat="server" CssClass="label w150" Text="Partition Id:"></asp:Label>
                <telerik:RadNumericTextBox ID="txtPartitionId" runat="server" MinValue="1" Value="1" Width="450px" CssClass="right">
                    <NumberFormat DecimalDigits="0" />
                </telerik:RadNumericTextBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblParentLabel" runat="server" CssClass="label w150" Text="Danh mục gốc:"></asp:Label>
                <telerik:RadComboBox ID="cmbParent" runat="server" Height="300px"
                    Width="450px" OnClientLoad="comboLoad" OnClientDropDownOpened="OnClientDropDownOpenedHandler">
                    <ItemTemplate>
                        <div id="div1" onclick="StopPropagation(event)">
                            <telerik:RadTreeView runat="server" ID="radTreeViewFileCategory" OnClientNodeClicking="nodeClicking"
                                DataFieldID="Id" DataFieldParentID="PId" DataTextField="DisplayName">
                            </telerik:RadTreeView>
                        </div>
                    </ItemTemplate>
                    <Items>
                        <telerik:RadComboBoxItem Text="" />
                    </Items>
                    <CollapseAnimation Type="None" />
                    <ExpandAnimation Type="None" />
                </telerik:RadComboBox>
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblOrdLabel" runat="server" CssClass="label w150" Text="Thứ tự:"></asp:Label>
                <telerik:RadNumericTextBox ID="txtOrd" runat="server" MinValue="1" Value="1" Width="450px" CssClass="right">
                    <NumberFormat DecimalDigits="0" />
                </telerik:RadNumericTextBox>
                <asp:HiddenField ID="hidOldOrd" runat="server" />
                <br class="clear" />
            </p>
            <p>
                <asp:Label ID="lblNameLabel" runat="server" CssClass="label w150" Text="Tên Danh mục file :"></asp:Label>
                <telerik:RadTextBox ID="txtName" runat="server" Width="450px" MaxLength="255"></telerik:RadTextBox>
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
                <telerik:RadTextBox ID="txtNote" runat="server" Width="450px" Height="150px" TextMode="MultiLine" MaxLength="4000"></telerik:RadTextBox>
                <br class="clear" />
            </p>
        </asp:Panel>
        <asp:Panel ID="pnlAuditTrail" runat="server" CssClass="form-editor-container">
            <uc:AuditTrail id="AuditTrail1" runat="server">
            </uc:AuditTrail>
        </asp:Panel>
    </div>
</asp:Content>
