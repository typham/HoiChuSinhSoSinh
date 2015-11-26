<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master"
    AutoEventWireup="true" CodeBehind="ImageDetail.aspx.cs" Inherits="HCSSS.Framework.hcsss.ImageDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    $(document).ready(function () {
        $('.phocagallery-box-file A').lightBox({
            slideshow: true, nextSlideDelay: 7000
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_hot" style="text-align: left;">
        <h1>
            <asp:Label runat="server" ID="lblTitle" Text="thu viên ảnh soc trăng"></asp:Label>
        </h1>
        <p class="line">
            <span></span>
        </p>
        <div class="clr">
        </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" EnableModelValidation="True" GroupItemCount="3">
            <EmptyDataTemplate>
                <div class="">
                    <div class="">
                        <p style="text-align: center;">
                            Không có dữ liệu.</p>
                    </div>
                </div>
            </EmptyDataTemplate>
            <GroupTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <div id="itemPlaceholder" runat="server">
                    </div>
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div class="phocagallery-box-file" style="margin: 5px 22px 5px 0pt; height: 163px;
                    width: 145px;">
                    <center>
                        <div class="phocagallery-box-file-first" style="height: 143px; width: 143px;">
                            <div class="phocagallery-box-file-second">
                                <div class="phocagallery-box-file-third">
                                    <center>
                                        <a class="shadowbox-button" title="" href='<%#Eval("gitempath") %>'
                                            rel="prettyPhoto[gallery1]">
                                            <img style="height: 125px; width: 125px;" src='<%#Eval("gitempath") %>'
                                                alt="" class="image" /></a>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </center>
                    <div class="name" style="font-size: 12px;">
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table1" runat="server" width="100%">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <div id="groupPlaceholderContainer" runat="server">
                                <div runat="server" id="groupPlaceholder">
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="Tr2" runat="server">
                        <td id="Td2" runat="server" style="">
                            <div class="pager" align="right">
                                <asp:DataPager ID="DataPager2" PageSize="15" PagedControlID="ListView1" runat="server">
                                    <Fields>
                                        <asp:TemplatePagerField>
                                            <PagerTemplate>
                                                <div style="float: left; padding-top: 1px">
                                                    <b>
                                                        <asp:Label ID="CurrentPageLabel" runat="server" Text="<%# Container.TotalRowCount > 0 ? Container.StartRowIndex + 1 : 0 %>" />
                                                    </b>- <b>
                                                        <asp:Label ID="TotalPagesLabel" runat="server" Text="<%# Container.StartRowIndex + ListView1.Items.Count %>" /></b>
                                                    <b>&nbsp;trong&nbsp;
                                                        <asp:Label ID="TotalItemsLabel" runat="server" Text="<%# Container.TotalRowCount %>" />
                                                    </b>&nbsp;Hình&nbsp;&nbsp;&nbsp;
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
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="SelectByCatID"
            TypeName="HCSSS.Framework.System.DBAccess.GalleryItemDAO">
            <SelectParameters>
                <asp:QueryStringParameter Name="CateID" QueryStringField="DocId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
      
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
