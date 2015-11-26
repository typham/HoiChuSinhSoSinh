<%@ Page Title="" Language="C#" MasterPageFile="~/hcsss/hcsss.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HCSSS.Framework.hcsss.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!------ begin Tin Mới ----------->
    <div class="news_hot">
        <%for (int i = 0; i < listnew.Count; i++)
          {%>
        <%="<h1> <a href=\"/" + listnew[i].CategoryPath + ".html\">" + listnew[i].TypeNewName + "</a></h1>"%>
        <p class="line">
            <span></span>
        </p>
        <%if (listnew[i].Items != null)
          {%>
        <div class="tinnoibat">
            <div class="tinnoibat_left">                                
                <span class="tomtat">
                    <%="<a href=\"/" + listnew[i].CategoryPath+ "/" + listnew[i].Items[0].NewId +"-"+listnew[i].Items[0].AliasUrl+ ".html\">" + listnew[i].Items[0].NewName + "</a>"%>
                </span>
                <p class="soluoc">
                    <%="<img src=\"" + listnew[i].Items[0].NewImage + "\" align=\"left\" border=\"0\" width=\"120\" width=\"90\" />"%>
                    <%=listnew[i].Items[0].NewDetail %>
                </p>
            </div>
            <div class="tinnoibat_right">
                <p>
                    <img src="/Images/WebImage/hot.gif" />
                    <%if(listnew[i].Items.Count>=2){ %>
                    <%="<a href=\"/" + listnew[i].CategoryPath + "/" + listnew[i].Items[1].NewId + "-" + listnew[i].Items[1].AliasUrl + ".html\">" + listnew[i].Items[1].NewName + "</a>"%>                    
                    <%} %>
                </p>
                <p>
                    <img alt="" src="/Images/WebImage/hot.gif" />
                    <%if(listnew[i].Items.Count>=3){ %>
                    <%="<a href=\"/" + listnew[i].CategoryPath + "/" + listnew[i].Items[2].NewId + "-" + listnew[i].Items[2].AliasUrl + ".html \">" + listnew[i].Items[2].NewName + "</a>"%>
                     <%} %>
                </p>
                 <p>
                    <img alt="" src="/Images/WebImage/hot.gif" />
                    <%if(listnew[i].Items.Count>=4){ %>
                    <%="<a href=\"/" + listnew[i].CategoryPath + "/" + listnew[i].Items[3].NewId + "-" + listnew[i].Items[3].AliasUrl + ".html\">" + listnew[i].Items[3].NewName + "</a>"%>
                     <%} %>
                </p>
                 <p>
                    <img alt="" src="/Images/WebImage/hot.gif" />
                    <%if(listnew[i].Items.Count>=5){ %>
                    <%="<a href=\"/" + listnew[i].CategoryPath + "/" + listnew[i].Items[4].NewId + "-" + listnew[i].Items[4].AliasUrl + ".html\">" + listnew[i].Items[4].NewName + "</a>"%>
                     <%} %>
                </p>
            </div>
        </div>
         <div class="clr">
    </div>
        <%  } %>
        <%else
          {%>
          <p>Đang cập nhật nội dung ...</p>
        <%  } %>
        <%} %>
    </div>
    <div class="clr">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
