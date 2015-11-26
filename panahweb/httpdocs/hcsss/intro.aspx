<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="intro.aspx.cs" Inherits="HCSSS.Framework.hcsss.intro" %>
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
<%--                    <h4>
                        <%#Eval("Name") %>
                    </h4>--%>
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
</asp:Content>
