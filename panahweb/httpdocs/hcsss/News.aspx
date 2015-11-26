<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master"
    AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="HCSSS.Framework.hcsss.News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_hot">
        <h1>
            <asp:Label runat="server" ID="lblTitle" Text="Thông tin xúc tiến đầu tư"></asp:Label>
        </h1>
       <%-- <p class="line">
            <span></span>
        </p>--%>
        
        <asp:ListView ID="lstNews" runat="server" DataKeyNames="Id" DataSourceID="ObjectDataSource1"
            EnableModelValidation="True">
            <EmptyDataTemplate>
                 <div class="bogocchitiettren">
                    </div>
                    <div class="chitiettin">
                        <p style="text-align: center;">
                            Không có dữ liệu.</p>
                    </div>
                    <div class="bogocchitietduoi">
                    </div>
            </EmptyDataTemplate>
            <GroupTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div class="tinnoibat"><p style=" margin:0px;width:100%;height:1px;background:url('/Images/WebImage/lineNews.jpg') no-repeat scroll center top transparent; padding-bottom:5px;"></p>
                    <div class="danhsachtintuc">
                        <a href="/<%# Eval("Path") %>/<%# Eval("ID") %>-<%# Eval("AliasUrl") %>.html">
                            <img alt="" src='<%#Eval("Url") %>' align="left" border="0" width="120" width="90" /></a> <span class="tomtat">
                                <a href="/<%# Eval("Path") %>/<%# Eval("ID") %>-<%# Eval("AliasUrl") %>.html">
                                    <%#Eval("Name") %>
                                </a><span class="ngaygio">(
                                    <%#string.Format("{0:dd/MM/yyyy}", Eval("DateCreate"))%>
                                    )</span></span>
                        <p class="soluoc">
                            <%#Eval("Lead") %>
                            <p>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table1" runat="server" width="100%">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <div class="tinnoibat" id="groupPlaceholderContainer" runat="server">
                                <div class="danhsachtintuc" runat="server" id="groupPlaceholder">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td id="Td2" runat="server" style="">
                            <div style="float: right; font-size: 11px; padding-top: 3px; min-width: 140px;" align="right">
                                <asp:DataPager ID="DataPager2" PageSize="15" PagedControlID="lstNews" runat="server">
                                    <Fields>
                                        <asp:TemplatePagerField>
                                            <PagerTemplate>
                                                <div style="float: left; padding-top: 1px">
                                                    <b>
                                                        <asp:Label ID="CurrentPageLabel" runat="server" Text="<%# Container.TotalRowCount > 0 ? Container.StartRowIndex + 1 : 0 %>" />
                                                    </b>- <b>
                                                        <asp:Label ID="TotalPagesLabel" runat="server" Text="<%# Container.StartRowIndex + lstNews.Items.Count %>" /></b>
                                                    <b>&nbsp;trong&nbsp;
                                                        <asp:Label ID="TotalItemsLabel" runat="server" Text="<%# Container.TotalRowCount %>" />
                                                    </b>&nbsp;Tin&nbsp;&nbsp;&nbsp;
                                                </div>
                                            </PagerTemplate>
                                        </asp:TemplatePagerField>
                                        <asp:NextPreviousPagerField ButtonType="Image" FirstPageText="" ShowFirstPageButton="true"
                                            ShowNextPageButton="false" ShowPreviousPageButton="true" PreviousPageText=""
                                            PreviousPageImageUrl="~/Images/prev.gif" RenderDisabledButtonsAsLabels="true"
                                            FirstPageImageUrl="~/Images/first.gif" />
                                        <asp:NumericPagerField ButtonCount="5" />
                                        <asp:NextPreviousPagerField ButtonType="Image" LastPageText="" ShowLastPageButton="true"
                                            ShowNextPageButton="true" ShowPreviousPageButton="false" NextPageText="" NextPageImageUrl="~/Images/next.gif"
                                            RenderDisabledButtonsAsLabels="true" LastPageImageUrl="~/Images/last.gif" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="ListAllByNewsTypeId"
            TypeName="HCSSS.CMS.News.DBAccess.NewsDAO">
            <SelectParameters>
                <asp:QueryStringParameter Name="TypeNewsID" QueryStringField="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <%-- <div class="news_hot">
        <h2>
            Các tin khác
        </h2>
        <p class="line2">
            <span></span>
        </p>
        <div class="tinkhac">
            <ul>
                <li><a href="#">Họp báo công bố chính thức chương trình hoạt động lúa gạo việt nam lần
                    thứ 2 tại tỉnh sóc trăng </a></li>
                <li><a href="#">Cẩm nang Xúc tiến đầu tư - Thương mại và Du lịch Sóc Trăng </a></li>
                <li><a href="#">Họp báo công bố chính thức chương trình hoạt động lúa gạo việt nam lần
                    thứ 2 tại tỉnh sóc trăng </a></li>
                <li><a href="#">Cẩm nang Xúc tiến đầu tư - Thương mại và Du lịch Sóc Trăng </a></li>
                <li><a href="#">Họp báo công bố chính thức chương trình hoạt động lúa gạo việt nam lần
                    thứ 2 tại tỉnh sóc trăng </a></li>
                <li><a href="#">Cẩm nang Xúc tiến đầu tư - Thương mại và Du lịch Sóc Trăng </a></li>
                <li><a href="#">Họp báo công bố chính thức chương trình hoạt động lúa gạo việt nam lần
                    thứ 2 tại tỉnh sóc trăng </a></li>
                <li><a href="#">Cẩm nang Xúc tiến đầu tư - Thương mại và Du lịch Sóc Trăng </a></li>
            </ul>
        </div>
    </div>--%>
</asp:Content>
