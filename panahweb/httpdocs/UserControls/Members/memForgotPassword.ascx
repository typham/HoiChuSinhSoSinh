<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="memForgotPassword.ascx.cs"
    Inherits="HCSSS.Websites.UserControls.Members.memForgotPassword" %>
<div class="box_login">
    <div class="ndT">
        KHÔI PHỤC MẬT KHẨU
    </div>
    <div class="ndC">
        <table width="400px" align="center" style="font-size: 14px;">
            <tr>
                <td colspan="3">
                    <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red" CssClass="red"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="fogotpass"
                     DisplayMode="List" ForeColor="Red" ShowSummary="true" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblUserLogin" runat="server" Text="Tên đăng nhập:" CssClass="frm-label"
                        Width="100px"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtUserLogin" runat="server" CssClass="frm-input" Width="280px"></asp:TextBox>
                   
                </td>
                <td>
                 <asp:RequiredFieldValidator ID="rvltxtUserLogin" ControlToValidate="txtUserLogin" ValidationGroup="fogotpass" Display="Dynamic" runat="server" ErrorMessage="Nhập tên đăng nhập">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="frm-label" Width="100px"></asp:Label>
                </td>
                <td >
                    <asp:TextBox ID="txtEmail"  runat="server" CssClass="frm-input" Width="280px"></asp:TextBox>
                   </td>
                <td>
                  <asp:RequiredFieldValidator ID="rvlEmail" ControlToValidate="txtEmail" ValidationGroup="fogotpass" runat="server" Display="Dynamic" ErrorMessage="Nhập địa chỉ email">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rvl_txtEmail" runat="server" ValidationGroup="fogotpass" ControlToValidate="txtEmail"  ValidationExpression="^[\w-]+(\.[\w-]+)*@([a-z0-9-]+(\.[a-z0-9-]+)*?\.[a-z]{2,6}|(\d{1,3}\.){3}\d{1,3})(:\d{4})?$" ErrorMessage="Nhập email chưa đúng" Display="Dynamic">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" ValidationGroup="fogotpass" 
                        Text="Gửi thông tin" onclick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
    </div>
</div> 