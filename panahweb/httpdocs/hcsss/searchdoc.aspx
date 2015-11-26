<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true"
    CodeBehind="searchdoc.aspx.cs" Inherits="HCSSS.Framework.hcsss.searchdoc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../UserControls/LayoutWebsite/FileItem.ascx" TagName="FileItem"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            registerclientscript();
        });
        function registerclientscript() {
            $('.dialog').click(function () {
                show_modal();
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <div class="news_hot">
        <h1>
            Tìm kiếm văn bản
        </h1>
        <p class="line">
            <span></span>
        </p>
        <div class="bogocchitiettren">
        </div>
        <div class="chitiettin">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table width="100%" style="float: left; padding: 0px 10px 0px 10px; clear: both;
                        margin-bottom: 20px;">
                        <tr>
                            <td style="width: 20%;">
                                <asp:Label runat="server" ID="lblLoaihinhdn" Text="Ngày ban hành :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFrom" Width="30%" runat="server">
                                </asp:TextBox>
                                <asp:ImageButton runat="server" ID="ImageButton2" ImageUrl="~/Images/LargeIcon/calendar.png" />
                                <asp:CalendarExtender ID="CalendarExtender1" TargetControlID="txtFrom" Format="dd/MM/yyyy"
                                    runat="server" PopupButtonID="ImageButton2">
                                </asp:CalendarExtender>
                                &nbsp;Đến&nbsp;<asp:TextBox ID="txtTo" Width="30%" runat="server">
                                </asp:TextBox><asp:ImageButton runat="server" ID="btncalenda1" ImageUrl="~/Images/LargeIcon/calendar.png" />
                                <asp:CalendarExtender ID="CalendarExtender2" TargetControlID="txtTo" Format="dd/MM/yyyy"
                                    runat="server" PopupButtonID="btncalenda1">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;">
                                <asp:Label runat="server" ID="Label1" Text="Mã số tài liệu :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumberDocument" Width="80%" runat="server">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;">
                                <asp:Label runat="server" ID="Label2" Text="Tên tài liệu :"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" Width="80%" runat="server">
                                </asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;">
                                <asp:Label runat="server" ID="Label3" Text="Loại văn bản :"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="cmbScope" Width="80%" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Thực hiện" OnClick="btnSearch_Click" />
                                &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Xóa điều kiện" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clr">
            </div>
        </div>
        <div class="bogocchitietduoi">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:ListView ID="lstNews" runat="server" DataKeyNames="Id" EnableModelValidation="True"
                OnPagePropertiesChanging="lstNews_PagePropertiesChanging">
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
                    <li class="tungdong"><span class="masodndk1"><a href="<%# Eval("FileUrl") %>"><%# Eval("FileName")%></a>
                    </span><span class="tendn1">
                        <%#string.Format("{0:dd/MM/yyyy}",Eval("IssueDate"))%></span> <span class="diachidn1">
                        </span></li>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="Table1" runat="server" width="100%">
                        <tr id="Tr1" runat="server">
                            <td id="Td1" runat="server">
                                <div class="ketquasearch">
                                    <ul>
                                        <li class="linesearch"><span class="masodndk">Số hiệu văn bản</span> <span class="tendn">
                                            Ngày ban hành</span> <span class="diachidn">Trích yếu</span> </li>
                                        <div id="groupPlaceholderContainer" runat="server">
                                            <div runat="server" id="groupPlaceholder">
                                            </div>
                                        </div>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td id="Td2" runat="server" style="">
                                <div class="pager" align="right">
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
        </ContentTemplate>
    </asp:UpdatePanel>
    <div id="modal_window">
        <div id="modal_title">
            <img alt="Đóng" title="Đóng lại" class="close_button" src="../Images/LargeIcon/close.png"
                style="float: right; cursor: pointer; padding: 5px; width: 50px; height: 50px" />
        </div>
        <div id="modal_content">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Always" runat="server">
                <Triggers>
                    <asp:PostBackTrigger ControlID="FileItem1" />
                </Triggers>
                <ContentTemplate>
                    <%-- <uc1:ThemHopDong ID="ThemHopDong1" runat="server" Visible="false" />--%>
                    <uc1:FileItem ID="FileItem1" runat="server" Visible="false" />
                    <asp:HiddenField ID="hdnRender" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" DisplayAfter="1" runat="server">
                <ProgressTemplate>
                    <center>
                        <img alt="" src="../Images/WebImage/ajax-loading.gif" style="width: 100px; height: 100px" />
                    </center>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>
