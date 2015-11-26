<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="HCSSS.Framework.UserControls.LayoutDefault.Header" %>
<div id="HCSSS_header" class="header">
    <div class="logo">
        <a href="#"></a></div>
    <div class="datetime">
        <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label>
    </div>
    <div class="skin-chooser">
        <label for="ctl00_RadMenu1_i3_SkinChooser_Input" class="skinLabel">
            Giao diện:</label>
        <telerik:RadComboBox ID="cmbLayout" runat="server" OnSelectedIndexChanged="cmbLayout_SelectedIndexChanged"
             DataTextField="Name" DataValueField="File" AutoPostBack="True">
        </telerik:RadComboBox>
        <label>Chủ đề:</label>
        <telerik:RadSkinManager runat="server" ID="RadSkinManager1" ShowChooser="true"
            PersistenceKey="Skin" PersistenceMode="Session" OnSkinChanged="RadSkinManager1_SkinChanged" />
    </div>
    <br class="clear" />
</div>
