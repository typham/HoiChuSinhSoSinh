<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master"
    AutoEventWireup="true" CodeBehind="ImageLibrary.aspx.cs" Inherits="HCSSS.Framework.hcsss.ImageLibrary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="news_hot" style="text-align: left;">
        <h1>
            <asp:Label runat="server" ID="lblTitle" Text="Album ảnh"></asp:Label>
        </h1>
        <p class="line">
            <span></span>
        </p>
        <div class="clr">
        </div>
        <asp:Repeater ID="repGalleryAlbum" runat="server">
            <ItemTemplate>
                <div class="thmb album">
                    <p class="albumtitle">
                        <b>Album:</b> <%#Eval("GalleryName")%></p>
                    <div style="width: 140px; height: 125px;" class="op0">
                        <div class="op1">
                            <div class="op2">
                                <div class="sb">
                                    <div class="ib">
                                        <a title='<%#Eval("ShowImage") %>' href='ImageDetail.aspx?DocId=<%#Eval("Id") %>'>
                                            <img style="width: 125px; height: 125px;" alt="<%#Eval("ShowImage") %>" src='<%#Eval("ShowImage") %>' />
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
      
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
