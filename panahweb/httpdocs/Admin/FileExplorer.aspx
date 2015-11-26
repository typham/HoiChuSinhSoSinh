﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Default.Master" AutoEventWireup="true" CodeBehind="FileExplorer.aspx.cs" Inherits="HCSSS.Framework.Admin.FileExplorer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cplhContainer" runat="server">

   <telerik:RadCodeBlock runat="server" ID="radCodeBlock">

        <script type="text/javascript">
        
        function pageLoad()
        {
            $telerik.$('body').css({overflow:'hidden'});
        }
        
        //A function that will return a reference to the parent radWindow in case the page is loaded in a RadWindow object
        function getRadWindow()
        {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement && window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }
        
        function OnClientGridDblClick(sender, args)
        {
            var item = args.get_item();

            //If file (and not a folder) is selected - call the OnFileSelected method on the parent page
            if (item.get_type() == Telerik.Web.UI.FileExplorerItemType.File)
            {
                args.set_cancel(true);
                //Get a reference to the opener parent page using rad window
                var wnd = getRadWindow();
                //Close window
                if (wnd)
                {
                    wnd.close(arg);
                }
                else
                {
                    window.open(item.get_path());
                }
            }
        }
        
        function OnGridContextItemClicked(oGridMenu, args)
        {
            var oExplorer = $find('<%= FileExplorer1.ClientID %>');
            var oAjaxPanel = $find('<%= RadAjaxPanel1.ClientID %>');
            
            var selectedItem = oExplorer.get_selectedItem();

            var menuItemText = args.get_item().get_text();
            if (menuItemText.indexOf("Unzip") > -1) // UnZip command
            {
                if (selectedItem.get_extension() == 'zip')
                {
                    var itemPath = selectedItem.get_path(); // get the path of the current item
                    var ajaxArg = 'unzip?' + itemPath;
                    oAjaxPanel.ajaxRequest(ajaxArg); // Call the RadAjaxPanel1_AjaxRequest function on the server ;
                }
                else
                {
                    alert('Hãy chọn file ZIP!!!');
                }
            }
            else if (menuItemText.indexOf("Resize") > -1) // Resize command
            {
                if (selectedItem.get_extension() == 'jpg' 
                    || selectedItem.get_extension() == 'jpeg'
                    || selectedItem.get_extension() == 'gif'
                    || selectedItem.get_extension() == 'png')
                {
                    var width = prompt('Nhập chiều rộng của thumbnail?', <%=imageWidth %>);
                    var height = prompt('Nhập chiều cao của thumbnail?', <%=imageHeight %>);
                    var itemPath = selectedItem.get_path(); // get the path of the current item
                    var ajaxArg = (width && height) 
                                ? 'resize?' + width + '?' + height + '?' + itemPath
                                : 'resize?' + itemPath;
                    oAjaxPanel.ajaxRequest(ajaxArg); // Call the RadAjaxPanel1_AjaxRequest function on the server ;
                }
                else
                {
                    alert('Hãy chọn file Image!!!');
                }
            }
            else if (menuItemText.indexOf("Preview") > -1) // Preview command
            {
                window.open(selectedItem.get_path());
            }
        }

        function refreshExplorer()
        {// TELERIK : Refresh here 
            var oExplorer = $find('<%= FileExplorer1.ClientID %>');
            oExplorer.refresh();
        }
        
        </script>

    </telerik:RadCodeBlock>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" OnAjaxRequest="RadAjaxPanel1_AjaxRequest">
    </telerik:RadAjaxPanel>
    <telerik:RadFileExplorer runat="server" ID="FileExplorer1" Width="100%" Height="500px"
        OnClientFileOpen="OnClientGridDblClick" EnableCopy="True" DisplayUpFolderItem="True">
        <Configuration ViewPaths="~/Resources/" DeletePaths="~/Resources/" UploadPaths="~/Resources/"
            SearchPatterns="*.jpg,*.jpeg,*.gif,*.png,*.mp3,*.mp4,*.mid,*.amr,*.wav,*.wma,*.flv,*.wmv,*.swf,*.txt,*.doc,*.docx,*.xls,*.xlsx,*.pdf,*.zip,*.rar"
            MaxUploadFileSize="10487650" ContentProviderTypeName="HCSSS.Framework.System.APCutomFileSystemContentProvider, HCSSS.Framework.System" />
    </telerik:RadFileExplorer>

</asp:Content>
