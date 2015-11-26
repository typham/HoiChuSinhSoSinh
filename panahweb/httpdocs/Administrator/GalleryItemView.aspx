<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="GalleryItemView.aspx.cs" Inherits="HCSSS.Framework.Administrator.GalleryItemView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">
 <telerik:RadScriptBlock runat="server" ID="RadScriptBlock1">
        <script type="text/javascript">

            var toolbar;
            var searchButton;

            function pageLoad() {
                toolbar = $find("<%= radToolBarDefault.ClientID %>");
                searchButton = toolbar.findButtonByCommandName("Search");
            }

            function onKeyPress(sender, args) {
                if (args.get_keyCode() == 13) {
                    args.get_domEvent().stopPropagation();
                    args.get_domEvent().preventDefault();
                    searchButton.click();
                    return;
                }
            }
            
        </script>
    </telerik:RadScriptBlock>
    <telerik:RadWindowManager ID="radWindowManager" runat="server" Behaviors="Maximize,Move,Reload,Resize,Close"
        VisibleStatusbar="False" DestroyOnClose="True">
    </telerik:RadWindowManager>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="radAjaxLoadingPanel1">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadingPanel1">
    </telerik:RadAjaxLoadingPanel>
    <div class="pd05 pb00">
        <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick"
            CssClass="panel-search-toolbar">
            <Items>
                <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/SmallIcon/21.png" CommandName="AddNew"
                    Text="Tạo mới" AccessKey="N">
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton IsSeparator="true" />
                <telerik:RadToolBarButton Value="searchTextBoxButton" CommandName="searchText">
                    <ItemTemplate>
                        <telerik:RadTextBox runat="server" ID="txtKeyword" EmptyMessage="Tìm kiếm" CssClass="panel-search-textbox"
                            Width="200px" ClientEvents-OnKeyPress="onKeyPress" />
                    </ItemTemplate>
                </telerik:RadToolBarButton>
                <telerik:RadToolBarButton ImageUrl="~/Images/SmallIcon/75.png" Value="search" CommandName="Search" />
            </Items>
            <CollapseAnimation Duration="200" Type="OutQuint" />
        </telerik:RadToolBar>
    </div>
    <div class="pd05">
        <telerik:RadAjaxPanel ID="radAjaxPanelView" runat="server" LoadingPanelID="radAjaxLoadingPanel1">
            <telerik:RadGrid ID="radGridDefault" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False"
                GridLines="None" OnItemCommand="radGridDefault_ItemCommand" OnItemDataBound="radGridDefault_ItemDataBound">
                <MasterTableView ClientDataKeyNames="Id" DataKeyNames="Id" GroupLoadMode="Client"
                    NoMasterRecordsText="Kh&#244;ng c&#243; bản ghi n&#224;o.">
                    <RowIndicatorColumn>
                        <HeaderStyle Width="20px" />
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn>
                        <HeaderStyle Width="20px" />
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridTemplateColumn HeaderText="#">
                            <ItemStyle HorizontalAlign="Right" />
                            <ItemTemplate>
                                <%# ItemIndex() + Container.ItemIndex + 1%>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Right" Width="50px" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="CatName" HeaderText="Danh mục Video/Hình ảnh" UniqueName="CatName">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="gitemname" HeaderText="Tên Video/Hình ảnh" UniqueName="gitemname">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="gitemlinkurl" HeaderText="Link Video/Hình ảnh" UniqueName="gitemlinkurl">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="gitempath" HeaderText="Dường dẩn Video/Hình ảnh" UniqueName="gitempath">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                          <telerik:GridBoundColumn DataField="gitemtypeName" HeaderText="Kiểu Video/Hình ảnh" UniqueName="gitemtypeName">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow"
                            ConfirmText="Bạn c&#243; chắc chắn muốn X&#243;a Người d&#249;ng n&#224;y?" ConfirmTitle="X&#243;a"
                            HeaderText="X&#243;a" Text="X&#243;a" UniqueName="Delete">
                            <ItemStyle CssClass="center" Width="32px" />
                            <HeaderStyle HorizontalAlign="Center" Width="32px" Font-Bold="true" />
                        </telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>
                <ClientSettings EnableRowHoverStyle="true">
                    <Resizing AllowColumnResize="True" />
                    <ClientEvents OnRowDblClick="RowDblClick" />
                </ClientSettings>
                <FilterMenu EnableTheming="True">
                    <CollapseAnimation Duration="200" Type="OutQuint" />
                </FilterMenu>
            </telerik:RadGrid>
            <asp:Panel ID="pnlPaging" runat="server" CssClass="paging right">
                <asp:ImageButton ID="ibtnFirst" runat="server" ImageUrl="~/Images/first.gif" OnClick="btnRadFirst_Click" />
                <asp:LinkButton ID="lbtnFirst" runat="server" OnClick="btnRadFirst_Click">Đầu tiên</asp:LinkButton>
                <asp:Label ID="lblSeparatorFirst" runat="server">|</asp:Label>
                <asp:ImageButton ID="ibtnPrev" runat="server" ImageUrl="~/Images/prev.gif" OnClick="btnRadPrev_Click" />
                <asp:LinkButton ID="lbtnPrev" runat="server" OnClick="btnRadPrev_Click">Trước</asp:LinkButton>
                <asp:Label ID="lblSeparatorPrev" runat="server">|</asp:Label>
                <asp:Label ID="Label1" runat="server" Text="Trang"></asp:Label>
                <asp:Label ID="lblCurrentPage" runat="server" Text="1"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="/"></asp:Label>
                <asp:Label ID="lblTotalPage" runat="server" Text="10"></asp:Label>
                <asp:Label ID="lblSeparatorPage" runat="server">|</asp:Label>
                <asp:LinkButton ID="lbtnNext" runat="server" OnClick="btnRadNext_Click">Sau</asp:LinkButton>
                <asp:ImageButton ID="ibtnNext" runat="server" ImageUrl="~/Images/next.gif" OnClick="btnRadNext_Click" />
                <asp:Label ID="lblSeparatorNext" runat="server">|</asp:Label>
                <asp:LinkButton ID="lbtnLast" runat="server" OnClick="btnRadLast_Click">Cuối cùng</asp:LinkButton>
                <asp:ImageButton ID="ibtnLast" runat="server" ImageUrl="~/Images/last.gif" OnClick="btnRadLast_Click" />
                <asp:Label ID="lblSeparatorLast" runat="server">|</asp:Label>
                <asp:LinkButton ID="lbtnGotoPage" runat="server" OnClick="btnRadGotoPage_Click">Chuyển đến: </asp:LinkButton>
                <asp:DropDownList ID="ddlChoiceIndexOfPage" runat="server" CssClass="center w50"
                    OnSelectedIndexChanged="btnRadGotoPage_Click" AutoPostBack="True">
                </asp:DropDownList>
            </asp:Panel>
        </telerik:RadAjaxPanel>
    </div>
</asp:Content>
