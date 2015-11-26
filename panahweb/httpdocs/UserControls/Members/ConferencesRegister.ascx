<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConferencesRegister.ascx.cs"
    Inherits="HCSSS.Websites.UserControls.Members.ConferencesRegister" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
<table class="Content">
    <tr>
        <td colspan="4" class="colContent">
            <asp:Label ID="lblMsg" runat="server" Text="" class="frm-error"></asp:Label>
            <asp:Label ID="lblError" runat="server" Text="" class="frm-error"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="Label1" class="frm-label" runat="server" Text="Tên hội nghị:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="tblTitle">
            <%--<asp:Label ID="lblTenHoiNghi" runat="server" Text="" CssClass="frm-label-title" Width="563px"
                Font-Bold="True" ForeColor="#FF3300"></asp:Label>--%>
            <asp:DropDownList ID="ddltenHoiNghi" runat="server" Width="300px" 
                DataSourceID="SqlDataSource1" DataTextField="ConferenceName" 
                DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="Data Source=27.0.14.44;Initial Catalog=panah;User ID=panahvn;Password=hoicsss@2012" 
                ProviderName="System.Data.SqlClient" 
                SelectCommand="SELECT [ConferenceName], [Id] FROM [Conferences] WHERE ([Status] = @Status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Hoạt động" Name="Status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="4" class="tblTitle">
            <asp:Label ID="Label62" runat="server" Text="Thông tin cá nhân" CssClass="frm-label-title"
                Width="563px" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblFullName" class="frm-label" runat="server" Text="Họ và tên:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtFullName" runat="server" CssClass="frm-input" Width="200px"></asp:TextBox>
            <asp:Label ID="Label4" runat="server" CssClass="red" Text="*" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblGender" runat="server" Text="Giới tính:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:DropDownList ID="cmbSex" runat="server" Width="120px">
                <asp:ListItem Value="9999">Chọn giới tính</asp:ListItem>
                <asp:ListItem Value="Nam">Nam</asp:ListItem>
                <asp:ListItem Value="Nữ">Nữ</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label2" runat="server" CssClass="red" Text="*"></asp:Label>
        </td>
    </tr>
    <tr>
        <td valign="top" class="colTitle">
            <asp:Label ID="lblBirthday" runat="server" CssClass="frm-label" Width="100px" Text="Ngày sinh:"></asp:Label>
        </td>
        <td class="colContent">
            <asp:DropDownList ID="cmdDate" runat="server" Width="70px">
                <asp:ListItem Value="9999">Ngày</asp:ListItem>
                <asp:ListItem Value="01">01</asp:ListItem>
                <asp:ListItem Value="02">02</asp:ListItem>
                <asp:ListItem Value="03">03</asp:ListItem>
                <asp:ListItem Value="04">04</asp:ListItem>
                <asp:ListItem Value="05">05</asp:ListItem>
                <asp:ListItem Value="06">06</asp:ListItem>
                <asp:ListItem Value="07">07</asp:ListItem>
                <asp:ListItem Value="08">08</asp:ListItem>
                <asp:ListItem Value="09">09</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
                <asp:ListItem Value="13">13</asp:ListItem>
                <asp:ListItem Value="14">14</asp:ListItem>
                <asp:ListItem Value="15">15</asp:ListItem>
                <asp:ListItem Value="16">16</asp:ListItem>
                <asp:ListItem Value="17">17</asp:ListItem>
                <asp:ListItem Value="18">18</asp:ListItem>
                <asp:ListItem Value="19">19</asp:ListItem>
                <asp:ListItem Value="20">20</asp:ListItem>
                <asp:ListItem Value="21">21</asp:ListItem>
                <asp:ListItem Value="22">22</asp:ListItem>
                <asp:ListItem Value="23">23</asp:ListItem>
                <asp:ListItem Value="24">24</asp:ListItem>
                <asp:ListItem Value="25">25</asp:ListItem>
                <asp:ListItem Value="26">26</asp:ListItem>
                <asp:ListItem Value="27">27</asp:ListItem>
                <asp:ListItem Value="28">28</asp:ListItem>
                <asp:ListItem Value="29">29</asp:ListItem>
                <asp:ListItem Value="30">30</asp:ListItem>
                <asp:ListItem Value="31">31</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="cmdMonth" runat="server" Width="70px">
                <asp:ListItem Value="9999">Tháng</asp:ListItem>
                <asp:ListItem Value="01">01</asp:ListItem>
                <asp:ListItem Value="02">02</asp:ListItem>
                <asp:ListItem Value="03">03</asp:ListItem>
                <asp:ListItem Value="04">04</asp:ListItem>
                <asp:ListItem Value="05">05</asp:ListItem>
                <asp:ListItem Value="06">06</asp:ListItem>
                <asp:ListItem Value="07">07</asp:ListItem>
                <asp:ListItem Value="08">08</asp:ListItem>
                <asp:ListItem Value="09">09</asp:ListItem>
                <asp:ListItem Value="10">10</asp:ListItem>
                <asp:ListItem Value="11">11</asp:ListItem>
                <asp:ListItem Value="12">12</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="cmdYear" runat="server" Width="70px">
                <asp:ListItem Value="9999">Năm</asp:ListItem>
                <asp:ListItem Value="1911">1911</asp:ListItem>
                <asp:ListItem Value="1912">1912</asp:ListItem>
                <asp:ListItem Value="1913">1913</asp:ListItem>
                <asp:ListItem Value="1914">1914</asp:ListItem>
                <asp:ListItem Value="1915">1915</asp:ListItem>
                <asp:ListItem Value="1916">1916</asp:ListItem>
                <asp:ListItem Value="1917">1917</asp:ListItem>
                <asp:ListItem Value="1918">1918</asp:ListItem>
                <asp:ListItem Value="1919">1919</asp:ListItem>
                <asp:ListItem Value="1920">1920</asp:ListItem>
                <asp:ListItem Value="1921">1921</asp:ListItem>
                <asp:ListItem Value="1922">1922</asp:ListItem>
                <asp:ListItem Value="1922">1922</asp:ListItem>
                <asp:ListItem Value="1923">1923</asp:ListItem>
                <asp:ListItem Value="1924">1924</asp:ListItem>
                <asp:ListItem Value="1925">1925</asp:ListItem>
                <asp:ListItem Value="1926">1926</asp:ListItem>
                <asp:ListItem Value="1927">1927</asp:ListItem>
                <asp:ListItem Value="1928">1928</asp:ListItem>
                <asp:ListItem Value="1929">1929</asp:ListItem>
                <asp:ListItem Value="1930">1930</asp:ListItem>
                <asp:ListItem Value="1931">1931</asp:ListItem>
                <asp:ListItem Value="1932">1932</asp:ListItem>
                <asp:ListItem Value="1933">1933</asp:ListItem>
                <asp:ListItem Value="1934">1934</asp:ListItem>
                <asp:ListItem Value="1935">1935</asp:ListItem>
                <asp:ListItem Value="1936">1936</asp:ListItem>
                <asp:ListItem Value="1937">1937</asp:ListItem>
                <asp:ListItem Value="1938">1938</asp:ListItem>
                <asp:ListItem Value="1939">1939</asp:ListItem>
                <asp:ListItem Value="1940">1940</asp:ListItem>
                <asp:ListItem Value="1941">1941</asp:ListItem>
                <asp:ListItem Value="1942">1942</asp:ListItem>
                <asp:ListItem Value="1943">1943</asp:ListItem>
                <asp:ListItem Value="1944">1944</asp:ListItem>
                <asp:ListItem Value="1945">1945</asp:ListItem>
                <asp:ListItem Value="1946">1946</asp:ListItem>
                <asp:ListItem Value="1947">1947</asp:ListItem>
                <asp:ListItem Value="1948">1948</asp:ListItem>
                <asp:ListItem Value="1949">1949</asp:ListItem>
                <asp:ListItem Value="1950">1950</asp:ListItem>
                <asp:ListItem Value="1951">1951</asp:ListItem>
                <asp:ListItem Value="1952">1952</asp:ListItem>
                <asp:ListItem Value="1953">1953</asp:ListItem>
                <asp:ListItem Value="1954">1954</asp:ListItem>
                <asp:ListItem Value="1955">1955</asp:ListItem>
                <asp:ListItem Value="1956">1956</asp:ListItem>
                <asp:ListItem Value="1957">1957</asp:ListItem>
                <asp:ListItem Value="1958">1958</asp:ListItem>
                <asp:ListItem Value="1959">1959</asp:ListItem>
                <asp:ListItem Value="1960">1960</asp:ListItem>
                <asp:ListItem Value="1961">1961</asp:ListItem>
                <asp:ListItem Value="1962">1962</asp:ListItem>
                <asp:ListItem Value="1963">1963</asp:ListItem>
                <asp:ListItem Value="1964">1964</asp:ListItem>
                <asp:ListItem Value="1965">1965</asp:ListItem>
                <asp:ListItem Value="1966">1966</asp:ListItem>
                <asp:ListItem Value="1967">1967</asp:ListItem>
                <asp:ListItem Value="1968">1968</asp:ListItem>
                <asp:ListItem Value="1969">1969</asp:ListItem>
                <asp:ListItem Value="1970">1970</asp:ListItem>
                <asp:ListItem Value="1971">1971</asp:ListItem>
                <asp:ListItem Value="1972">1972</asp:ListItem>
                <asp:ListItem Value="1973">1973</asp:ListItem>
                <asp:ListItem Value="1974">1974</asp:ListItem>
                <asp:ListItem Value="1975">1975</asp:ListItem>
                <asp:ListItem Value="1976">1976</asp:ListItem>
                <asp:ListItem Value="1977">1977</asp:ListItem>
                <asp:ListItem Value="1978">1978</asp:ListItem>
                <asp:ListItem Value="1979">1979</asp:ListItem>
                <asp:ListItem Value="1980">1980</asp:ListItem>
                <asp:ListItem Value="1981">1981</asp:ListItem>
                <asp:ListItem Value="1982">1982</asp:ListItem>
                <asp:ListItem Value="1983">1983</asp:ListItem>
                <asp:ListItem Value="1984">1984</asp:ListItem>
                <asp:ListItem Value="1985">1985</asp:ListItem>
                <asp:ListItem Value="1986">1986</asp:ListItem>
                <asp:ListItem Value="1987">1987</asp:ListItem>
                <asp:ListItem Value="1988">1988</asp:ListItem>
                <asp:ListItem Value="1989">1989</asp:ListItem>
                <asp:ListItem Value="1990">1990</asp:ListItem>
                <asp:ListItem Value="1991">1991</asp:ListItem>
                <asp:ListItem Value="1992">1992</asp:ListItem>
                <asp:ListItem Value="1993">1993</asp:ListItem>
                <asp:ListItem Value="1994">1994</asp:ListItem>
                <asp:ListItem Value="1995">1995</asp:ListItem>
                <asp:ListItem Value="1996">1996</asp:ListItem>
                <asp:ListItem Value="1997">1997</asp:ListItem>
                <asp:ListItem Value="1998">1998</asp:ListItem>
                <asp:ListItem Value="1999">1999</asp:ListItem>
                <asp:ListItem Value="2000">2000</asp:ListItem>
                <asp:ListItem Value="2001">2001</asp:ListItem>
                <asp:ListItem Value="2002">2002</asp:ListItem>
                <asp:ListItem Value="2003">2003</asp:ListItem>
                <asp:ListItem Value="2004">2004</asp:ListItem>
                <asp:ListItem Value="2005">2005</asp:ListItem>
                <asp:ListItem Value="2006">2006</asp:ListItem>
                <asp:ListItem Value="2007">2007</asp:ListItem>
                <asp:ListItem Value="2008">2008</asp:ListItem>
                <asp:ListItem Value="2009">2009</asp:ListItem>
                <asp:ListItem Value="2010">2010</asp:ListItem>
                <asp:ListItem Value="2012">2012</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label3" runat="server" CssClass="red" Text="*" ForeColor="#FF3300"></asp:Label>
        </td>
        <td>
            &nbsp;
        </td>
        <td>
            &nbsp;
        </td>
    </tr>
    <tr>
        <td colspan="4" class="tblTitle">
            <asp:Label ID="Label9" runat="server" Text="Thông tin liên hệ" CssClass="frm-label-title"
                Width="300px" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblAddress" runat="server" Text="Địa chỉ:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtAddress" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblEmail" runat="server" Text="Email:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtEmail" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblHomephone" runat="server" Text="Điện thoại nhà:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtHomephone" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblCellphone" runat="server" Text="ĐTDĐ:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtCellphone" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <!-- -->
    <tr>
        <td colspan="4" class="tblTitle">
            <asp:Label ID="Label5" runat="server" Text="Thông tin khác" CssClass="frm-label-title"
                Width="300px" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="Label6" runat="server" Text="Tên cơ quan:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="Label7" runat="server" Text="Địa chỉ cơ quan:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="Label8" runat="server" Text="Học vị/ Học hàm:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:DropDownList ID="ddlLevel" runat="server" Width="305px" 
                DataSourceID="XmlDataSource1" DataTextField="text" DataValueField="value">
            </asp:DropDownList>
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
                DataFile="~/App_Data/xml/level.xml"></asp:XmlDataSource>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="Label10" runat="server" Text="Chức danh:" CssClass="frm-label" Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtLevelName" runat="server" CssClass="frm-input" Width="300px"></asp:TextBox>
        </td>
    </tr>
    <!-- -->
    <tr>
        <td colspan="4" class="tblTitle">
            <asp:Label ID="lblSecurity" runat="server" Text="Mã bảo vệ" CssClass="frm-label-title"
                Width="300px" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
        </td>
        <td colspan="3" class="colContent">
            <cc1:CaptchaControl ID="CaptchaControl1" runat="server" CaptchaBackgroundNoise="Medium"
                CaptchaLineNoise="Low" Width="100px" />
        </td>
    </tr>
    <tr>
        <td class="colTitle">
            <asp:Label ID="lblSecuritylbb" runat="server" Text="Nhập mã bảo vệ:" CssClass="frm-label"
                Width="100px"></asp:Label>
        </td>
        <td colspan="3" class="colContent">
            <asp:TextBox ID="txtSecurity" runat="server" CssClass="frm-input" Width="200px"></asp:TextBox>
            <asp:Label ID="Label11" runat="server" CssClass="red" Text="*" ForeColor="#FF3300"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="colTitle">
        </td>
        <td colspan="3" class="colContent">
            <asp:Button ID="btnSave" runat="server" Text="Lưu" ValidationGroup="Login" OnClick="btnSave_Click"
                Style="height: 26px" />
            <asp:Button ID="btnCancel" runat="server" Text="Bỏ qua" OnClick="btnCancel_Click" />
        </td>
    </tr>
</table>
