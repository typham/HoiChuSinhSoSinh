﻿<%@ Page MasterPageFile="~/Admin/Default.Master" Language="C#" AutoEventWireup="true" CodeBehind="FunctionView.aspx.cs" Inherits="HCSSS.Framework.Administrator.FunctionView" %>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cplhContainer">
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
    <telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadingPanel1">
    </telerik:RadAjaxLoadingPanel>
    <div class="pd05 pb00">
        <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick" CssClass="panel-search-toolbar">
            <Items>
                <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/newitem.gif" CommandName="AddNew"
                    Text="Tạo mới" AccessKey="N">
                </telerik:RadToolBarButton>
			    <telerik:RadToolBarButton IsSeparator="true" />
			    <telerik:RadToolBarButton Value="searchTextBoxButton" CommandName="searchText">
				    <ItemTemplate>
					    <telerik:RadTextBox
						    runat="server" ID="txtKeyword"
						    EmptyMessage="Tìm kiếm"
						    CssClass="panel-search-textbox" Width="200px"
						    ClientEvents-OnKeyPress="onKeyPress" />
				    </ItemTemplate>
			    </telerik:RadToolBarButton>
			    <telerik:RadToolBarButton ImageUrl="~/Images/search.png" Value="search" CommandName="Search" />
            </Items>
            <CollapseAnimation Duration="200" Type="OutQuint" />
        </telerik:RadToolBar>
    </div>
    <div class="pd05">
        <telerik:RadAjaxPanel ID="radAjaxPanelView" runat="server" LoadingPanelID="radAjaxLoadingPanel1">
            <telerik:RadGrid ID="radGridDefault" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False"
                GridLines="None" OnItemCommand="radGridDefault_ItemCommand"
                OnItemDataBound="radGridDefault_ItemDataBound">
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
                        <telerik:GridBoundColumn DataField="ModuleName" HeaderText="Module" UniqueName="ModuleName" DataFormatString="&#160;">
                            <ItemStyle CssClass="center" Width="100px" />
                            <HeaderStyle Font-Bold="True" Width="100px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Name" HeaderText="Chức năng" UniqueName="Name">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Alias" HeaderText="Alias" UniqueName="Alias">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Detail" HeaderText="M&#244; tả" UniqueName="Detail">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Thứ tự" UniqueName="TemplateColumn">
                            <ItemTemplate>
                                <asp:TextBox ID="txtOrd" runat="server" Width="30px" Height="14px" CssClass="right" Text='<%#DataBinder.Eval(Container.DataItem, "Ord")%>'></asp:TextBox>
                                <asp:ImageButton ID="btnSave" runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                    ImageUrl="~/Images/SmallIcon/45.png" CommandName="Save"
                                    CausesValidation="False" OnCommand="btnSave_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Font-Bold="True" Width="100px" HorizontalAlign="Right" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow"
                            ConfirmText="Bạn c&#243; chắc chắn muốn X&#243;a mục n&#224;y?" ConfirmTitle="X&#243;a"
                            HeaderText="X&#243;a" Text="X&#243;a" UniqueName="Delete">
                            <ItemStyle CssClass="center" Width="32px" />
                            <HeaderStyle HorizontalAlign="Center" Width="32px" Font-Bold="True" />
                        </telerik:GridButtonColumn>
                    </Columns>
                    <GroupByExpressions>
                        <telerik:GridGroupByExpression>
                            <SelectFields>
                                <telerik:GridGroupByField FieldAlias="ModuleName" FieldName="ModuleName" HeaderText=" " />
                            </SelectFields>
                            <GroupByFields>
                                <telerik:GridGroupByField FieldAlias="ModuleName" FieldName="ModuleName" />
                            </GroupByFields>
                        </telerik:GridGroupByExpression>
                    </GroupByExpressions>
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
