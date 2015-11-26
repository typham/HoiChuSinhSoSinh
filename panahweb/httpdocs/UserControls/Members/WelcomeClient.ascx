<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WelcomeClient.ascx.cs" Inherits="HCSSS.Websites.UserControls.Members.WelcomeClient" %>
<br />
<div>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" CssClass="red"></asp:Label>
</div>
<div>
    <asp:Label ID="lblUserLogin" runat="server" Text="Xin Chào:" 
        CssClass="frm-label" Width="93px"></asp:Label>
    <asp:TextBox ID="txtUserLogin" runat="server" CssClass="frm" Width="100px" 
       ></asp:TextBox>
    <br class="clear" />
</div>
<div>
   <center> <a href="../../Forgotpassword.aspx">Đổi mật khẩu</a> </center>
</div>
<br />
