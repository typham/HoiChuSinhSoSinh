<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.ascx.cs"
    Inherits="HCSSS.Websites.UserControls.Members.ChangePassword" %>

        <table class="Content" align="center">
           
            <tr>
                <td colspan="4" class="colContent">
                    <asp:Label ID="Label1" runat="server" Text="" class="frm-error"></asp:Label>
                    <asp:Label ID="lblError" runat="server" Text="" class="frm-error"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="tblTitle">
                    <asp:Label ID="Label62" Font-Bold="true" runat="server" Text="Thông tin tài khoản" CssClass="frm-label-title"
                        Width="563px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colTitle" align="right">
                    <asp:Label ID="lblUserLogin" runat="server" Text="Tên đăng nhập:" CssClass="frm-label"
                        Width="100px"></asp:Label>
                </td>
                <td colspan="3" class="colContent">
                    <asp:TextBox ID="txtUserLogin" runat="server" CssClass="frm-input" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="tblTitle">
                    <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Thông tin thay đổi" CssClass="frm-label-title"
                        Width="563px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colTitle" align="right">
                    <asp:Label ID="lblOldPassword" runat="server" Text="Mật khẩu củ:" CssClass="frm-label"
                        Width="100px"></asp:Label>
                </td>
                <td colspan="3" class="colContent">
                    <asp:TextBox ID="txtOldPassword" runat="server" TextMode="Password" CssClass="frm-input" Width="200px"></asp:TextBox>
                    <asp:Label ID="Label7" runat="server" CssClass="red" Text="*"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="colTitle" align="right">
                    <asp:Label ID="lblNewPassword" runat="server" Text="Mật khẩu mới:" CssClass="frm-label"
                        Width="100px"></asp:Label>
                </td>
                <td colspan="3" class="colContent">
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="frm-input" Width="200px"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" CssClass="red" Text="*"></asp:Label>
                </td>
            </tr>
             <tr>
                <td class="colTitle" valign="top" align="right">
                    <asp:Label ID="lblRePass" runat="server" Text="Xác nhận mật khẩu mới:" CssClass="frm-label"
                        ></asp:Label>
                </td>
                <td colspan="3" class="colContent">
                    <asp:TextBox ID="txtRePass" runat="server" TextMode="Password" CssClass="frm-input" Width="200px"></asp:TextBox>
                    <asp:Label ID="Label6" runat="server" CssClass="red" Text="*"></asp:Label><br />
                    <asp:CompareValidator ID="CoptxtRePass" runat="server" 
                    ControlToCompare="txtRePass" ControlToValidate="txtNewPassword"
                    Operator="Equal" Type="String"
                    ErrorMessage="Xác nhận mật khẩu sai"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="4" class="tblTitle">
                </td>
            </tr>
            <tr>
                <td class="colTitle">
                    <asp:Label ID="Label4" runat="server" Text="" CssClass="frm-label" Width="100px"></asp:Label>
                </td>
                <td colspan="3" class="colContent">
                    <asp:Button ID="btnSubmit" runat="server" Text="Thay đổi mật khẩu" ValidationGroup="Login"
                        OnClick="btnSubmit_Click" />
                </td>
            </tr>
        </table>
  

