<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HitAccount.ascx.cs"
    Inherits="HCSSS.Websites.UserControls.Members.HitAccount" %>
<table class="tblHitAccount">
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblOnline" runat="server" Text="Đang online:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["visitors_online"].ToString()%>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblToday" runat="server" Text="Hôm nay:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["HomNay"].ToString()  %>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblYesterday" runat="server" Text="Hôm qua:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["HomQua"].ToString()  %>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblThisWeek" runat="server" Text="Tuần này:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["TuanNay"].ToString()  %>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblLastWeek" runat="server" Text="Tuần trước:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["TuanTruoc"].ToString()  %>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblThisMonth" runat="server" Text="Tháng này:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["ThangNay"].ToString()  %>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblLastMonth" runat="server" Text="Tháng trước:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["ThangTruoc"].ToString()  %>
        </td>
    </tr>
     <tr>
        <td class="colTitle">
            <asp:Label ID="lblTotal" runat="server" Text="Tất cả:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <% =Application["TatCa"].ToString()%>
        </td>
    </tr>
</table>
