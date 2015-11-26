﻿<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="mem.aspx.cs" Inherits="HCSSS.Framework.hcsss.mem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
		    <Scripts>
			    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
			    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
		    </Scripts>
	    </telerik:RadScriptManager>
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
    <telerik:RadWindowManager ID="radWindowManager" runat="server"
        Behaviors="Maximize,Move,Reload,Resize,Close" VisibleStatusbar="False" DestroyOnClose="True">
    </telerik:RadWindowManager>
	<telerik:RadAjaxManager runat="server" ID="RadAjaxManager1" DefaultLoadingPanelID="radAjaxLoadingPanel1">
	</telerik:RadAjaxManager>
	<telerik:RadAjaxLoadingPanel runat="server" ID="radAjaxLoadingPanel1">
	</telerik:RadAjaxLoadingPanel>
     <div class="pd05 pb00">
        <telerik:RadToolBar ID="radToolBarDefault" runat="server" OnButtonClick="radToolBarDefault_ButtonClick" CssClass="panel-search-toolbar">
            <Items>
                <telerik:RadToolBarButton runat="server" ImageUrl="~/Images/SmallIcon/21.png" CommandName="AddNew"
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
				<telerik:RadToolBarButton ImageUrl="~/Images/SmallIcon/75.png" Value="search" CommandName="Search" />
            </Items>
            <CollapseAnimation Duration="200" Type="OutQuint" />
        </telerik:RadToolBar>
    </div>
      <div class="pd05">
        <telerik:RadAjaxPanel ID="radAjaxPanelView" runat="server" LoadingPanelID="radAjaxLoadingPanel1">
            <telerik:RadGrid ID="radGridDefault" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False"
                GridLines="None" OnItemCommand="radGridDefault_ItemCommand"
                OnItemDataBound="radGridDefault_ItemDataBound">
                <MasterTableView ClientDataKeyNames="Id" DataKeyNames="Id" GroupLoadMode="Client" NoMasterRecordsText="Kh&#244;ng c&#243; bản ghi n&#224;o.">
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
                        <telerik:GridBoundColumn DataField="LoginName" HeaderText="T&#234;n đăng nhập" UniqueName="LoginName">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FullName" HeaderText="T&#234;n đầy đủ" UniqueName="FullName">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Email" HeaderText="Email" UniqueName="Email" Visible="False">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridTemplateColumn HeaderText="Email">
                            <ItemStyle Wrap="False" />
                            <ItemTemplate>
                                <a href='mailto:<%#DataBinder.Eval(Container.DataItem, "Email")%>'>
                                    <%#DataBinder.Eval(Container.DataItem, "Email")%>
                                </a>
                                <a href='mailto:<%#DataBinder.Eval(Container.DataItem, "Email")%>'>
                                    <img alt="gửi email" title="gửi email" width="16" src="/Images/SmallIcon/47.png" />
                                </a>
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridTemplateColumn>
                        <telerik:GridBoundColumn DataField="Sex" HeaderText="Giới tính" UniqueName="Sex">
                            <HeaderStyle Font-Bold="True" Width="65px" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Phone" HeaderText="Điện thoại" UniqueName="Phone">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Mobile" HeaderText="Di động" UniqueName="Mobile">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Yahoo" HeaderText="Yahoo" UniqueName="Yahoo">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Skype" HeaderText="Skype" UniqueName="Skype">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="Status" HeaderText="Trạng thái" UniqueName="Status" Visible="false">
                            <HeaderStyle Font-Bold="True" />
                        </telerik:GridBoundColumn>
                     <%--   <telerik:GridTemplateColumn HeaderText="Trạng thái" UniqueName="TemplateColumn">
                            <ItemTemplate>
                                <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                <asp:ImageButton ID="btnLock" runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                    ImageUrl="~/Images/LargeIcon/lock.png" CommandName="Lock" Visible='<%#Utilities.StringCompare(HttpUtility.HtmlDecode(DataBinder.Eval(Container.DataItem, "Status").ToString()), "Hoạt động") %>'
                                    CausesValidation="False" Width="16px" Height="16px" OnCommand="btnLock_Click" />
                                <asp:ImageButton ID="btnUnLock" runat="server" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "Id")%>'
                                    ImageUrl="~/Images/LargeIcon/unlock.png" CommandName="UnLock" Visible='<%#Utilities.StringCompare(HttpUtility.HtmlDecode(DataBinder.Eval(Container.DataItem, "Status").ToString()), "Khóa") %>'
                                    CausesValidation="False" Width="16px" Height="16px" OnCommand="btnUnLock_Click" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Font-Bold="True" Width="100px" HorizontalAlign="Center" />
                        </telerik:GridTemplateColumn>--%>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
