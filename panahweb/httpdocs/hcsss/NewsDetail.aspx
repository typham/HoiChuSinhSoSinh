<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="NewsDetail.aspx.cs" Inherits="HCSSS.Framework.hcsss.NewsDetail1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="news_hot">
        <asp:FormView ID="frmViewNew_2" runat="server">
            <ItemTemplate>
                <h1>
                    <%#Eval("CateName")%>
                </h1>
            </ItemTemplate>
        </asp:FormView>
        <p class="line">
            <span></span>
        </p>
        <div class="bogocchitiettren">
        </div>
        <div class="chitiettin">
            <asp:FormView ID="frmViewNew" runat="server">
                <ItemTemplate>
                    <h4>
                        <%#Eval("Name") %>
                    </h4>
                    <div class="noidung_chitiettin">
                        <%#Eval("Lead")%>
                    </div>
                    <div class="noidung_chitiettin">
                        <%#Eval("Detail")%>
                    </div>
                    <div class="noidung_chitiettin_nguon">
                        &nbsp;
                        <%#Eval("Author")%>
                    </div>
                </ItemTemplate>
            </asp:FormView>
        </div>
        <div class="bogocchitietduoi">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
 <div class="news_hot">
        <h2>
            Các tin khác
        </h2>
        <p class="line2">
            <span></span>
        </p>
        <div class="tinkhac">
            <ul>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <li><a href="/<%# Eval("Path") %>/<%# Eval("ID") %>-<%# Eval("AliasUrl") %>.html">
                            <%#Eval("Name") %>
                        </a></li>
                    </ItemTemplate>
                </asp:Repeater>
              
            </ul>
        </div>
    </div>
</asp:Content>
