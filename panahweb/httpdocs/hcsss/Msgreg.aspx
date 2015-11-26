<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="Msgreg.aspx.cs" Inherits="HCSSS.Framework.hcsss.Msgreg" %>
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
            Text="Bạn không thể vào được trang Hội Viên." Font-Bold="True" 
            ForeColor="#FF3300"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="Bạn phải đăng nhập vào hệ thống mới vào được trang Hội Viên." Font-Italic="True" 
            ForeColor="#0099FF"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" 
            Text="Nếu Bạn chưa có tài khoản, Bạn có thể đăng ký tài khoản mới " Font-Italic="True" 
            ForeColor="#0099FF"></asp:Label>
            <a href="/hcsss/dang-ky.html">Đăng ký</a>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Xin Cảm Ơn." Font-Bold="True" 
            ForeColor="#3399FF"></asp:Label>
        <br />
        Quay về trang chủ:
        <a href="/hcsss/trang-chu.html">Trang chủ</a>
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
