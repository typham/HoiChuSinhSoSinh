<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="Msg.aspx.cs" Inherits="HCSSS.Framework.hcsss.Msg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="dvlogin" class="module form-login-container form-container">
    <div class="module-border module-top">
        <div class="b1 m-border">
        </div>
        <div class="b2 m-border">
        </div>
        <div class="b3 m-border">
        </div>
        <div class="b4 m-border">
        </div>
    </div>
    <div class="module-header m-border">
        Thông Báo
    </div>
    <div class="module-content m-border" style="color: #008080">
        <asp:Label ID="Label1" runat="server" 
            Text="Chúc mừng Bạn đã đăng ký Thành Công!" Font-Bold="True" 
            ForeColor="#FF3300"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="Vui lòng liên hệ trực tiếp với Ban Quản Lý Website," Font-Italic="True" 
            ForeColor="#0099FF"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" 
            Text="để được kích hoạt tài khoản của Bạn." Font-Italic="True" 
            ForeColor="#0099FF"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Xin Cảm Ơn." Font-Bold="True" 
            ForeColor="#3399FF"></asp:Label>
        <br />
        Quay về trang chủ:
        <asp:LinkButton ID="LinkButton1" PostBackUrl="~/Default.aspx" runat="server">Trang chủ</asp:LinkButton>
    </div>
    <div class="module-border module-bottom">
        <div class="b4 m-border">
        </div>
        <div class="b3 m-border">
        </div>
        <div class="b2 m-border">
        </div>
        <div class="b1 m-border">
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
