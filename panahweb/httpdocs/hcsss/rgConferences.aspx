<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master" AutoEventWireup="true" CodeBehind="rgConferences.aspx.cs" Inherits="HCSSS.Framework.hcsss.rgConferences" %>
<%@ Register src="../UserControls/Members/ConferencesRegister.ascx" tagname="ConferencesRegister" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="dvregister" class="module form-register-container form-container">
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
        Đăng ký tham gia hội nghị
    </div>
    <div class="module-content m-border-register">
        <uc1:ConferencesRegister ID="ConferencesRegister1" runat="server" />
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
