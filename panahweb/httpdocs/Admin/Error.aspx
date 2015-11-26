<%@ Page MasterPageFile="~/Admin/Default.Master" Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="HCSSS.Framework.Error" Title="HCSSS Framework - Lỗi hệ thống" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="cplhContainer">
<div class="module form-error-container">
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
        HCSSS - Có lỗi xảy ra
    </div>
    <div class="module-content m-border">
        <p>
            <asp:Label ID="lblLabel" runat="server" Text="">Mô tả lỗi:</asp:Label>
        </p>
        <br />
        <p>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </p>
        <br />
        <br />
        <br />
        <br />
        <br />
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
<br class="clear" />
</asp:Content>
