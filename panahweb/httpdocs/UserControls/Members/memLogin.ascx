<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="memLogin.ascx.cs" Inherits="HCSSS.Websites.UserControls.Members.memRegister" %>
<%@ Import namespace="HCSSS.Framework.Common"%>
<br />
<% if(Session[Constants.SessionClient.USER_FULLNAMEClient]==null){ %>
<div>
    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="" CssClass="red"></asp:Label>
</div>
<div>
    <asp:Label ID="lblUserLogin" runat="server" Text="Tên đăng nhập:" 
        CssClass="frm-label" Width="93px"></asp:Label>
    <asp:TextBox ID="txtUserLogin" runat="server" CssClass="frm" Width="100px" 
       ></asp:TextBox>
    <br class="clear" />
</div>
<div>
    <asp:Label ID="lblPassword" runat="server" Text="Mật khẩu:" 
        CssClass="frm-label" Width="93px"></asp:Label>
    <asp:TextBox ID="txtPasswordLogin" runat="server" TextMode="Password" 
        CssClass="frm" Width="100px"></asp:TextBox>
    <br class="clear" />
</div>
<div style=" text-align:center; margin-top:5px;">
    <asp:Button ID="btnSubmit" runat="server"  OnClick="btnSubmit_Click" Text="Đăng nhập"  Width="105px" />
</div>
<div style=" text-align:center; margin-top:5px;">
   <center> <asp:HyperLink ID="hplForgotPasswork" NavigateUrl="~/hcsss/forgotpass.aspx" runat="server">Quên mật khẩu</asp:HyperLink>&nbsp;<asp:Label ID="lbl1" runat="server" Text="||" 
        CssClass="frm-label" Width="5px"></asp:Label> &nbsp; <asp:HyperLink ID="hplRegister" NavigateUrl="~/hcsss/register.aspx" runat="server">Đăng ký</asp:HyperLink></center>
</div>
<%}else{ %>
<div style=" text-align:left;">
<asp:Label ID="Label1" runat="server" Text="Xin Chào:&amp;nbsp;"></asp:Label>
<asp:Label ID="lblWel" runat="server" ForeColor="Red" Font-Bold="True" 
        Font-Size="12pt"></asp:Label>
</div>
<div style=" text-align:center;">
<br />
    <asp:HyperLink ID="hplChangepass" NavigateUrl="~/hcsss/changepass.aspx" runat="server">Đổi mật khẩu</asp:HyperLink>&nbsp;<asp:Label ID="Label2" runat="server" Text="||" 
        CssClass="frm-label" Width="5px"></asp:Label>&nbsp;<asp:LinkButton 
        ID="lbtnLogout" runat="server" onclick="lbtnLogout_Click">Thoát</asp:LinkButton>
</div>
<%} %>