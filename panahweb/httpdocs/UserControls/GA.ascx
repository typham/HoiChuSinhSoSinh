<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GA.ascx.cs" Inherits="HCSSS.Framework.UserControls.GA" %>

<script type="text/javascript">
//jquery cookie
jQuery = $telerik.$;
$telerik.$.cookie=function(a,b,c){if(typeof b!='undefined'){c=c||{};if(b===null){b='';c=$.extend({},c);c.expires=-1}var d='';if(c.expires&&(typeof c.expires=='number'||c.expires.toUTCString)){var e;if(typeof c.expires=='number'){e=new Date();e.setTime(e.getTime()+(c.expires*24*60*60*1000))}else{e=c.expires}d='; expires='+e.toUTCString()}var f=c.path?'; path='+(c.path):'';var g=c.domain?'; domain='+(c.domain):'';var h=c.secure?'; secure':'';document.cookie=[a,'=',encodeURIComponent(b),d,f,g,h].join('')}else{var j=null;if(document.cookie&&document.cookie!=''){var k=document.cookie.split(';');for(var i=0;i<k.length;i++){var l=jQuery.trim(k[i]);if(l.substring(0,a.length+1)==(a+'=')){j=decodeURIComponent(l.substring(a.length+1));break}}}return j}};
$telerik.$(function(){
    var help = $telerik.$.cookie('help-desk');
    if (help == 'true') {
        $telerik.$('#help-desk .module-content').addClass('none');
        $telerik.$('#help-desk .module-header .btn-down').addClass('none');
    }else{
        $telerik.$('#help-desk .module-header .btn-up').addClass('none');
    }
});
function helpdesk(obj){
    $telerik.$('#help-desk .module-content').toggleClass('none');
    $telerik.$('#help-desk .module-header .btn-up').toggleClass('none');
    $telerik.$('#help-desk .module-header .btn-down').toggleClass('none');
    $telerik.$.cookie('help-desk', $telerik.$('#help-desk .module-content').hasClass('none'), { expires: 7 });
}
</script>

<div id="help-desk" style="position:fixed;right:10px;bottom:10px;width:240px;">
    <div class="module">
        <div class="module-border module-top">
            <div class="b1 m-border bgcolor">
            </div>
            <div class="b2 m-border bgcolor">
            </div>
            <div class="b3 m-border bgcolor">
            </div>
            <div class="b4 m-border bgcolor">
            </div>
        </div>
        <div class="module-header m-border bgcolor">
            <a href="javascript:void(0)" onclick="helpdesk(this)">
                Hỗ trợ trực tuyến 
                <img alt="" title="" class="btn-up" src="/Images/LargeIcon/up.png" />
                <img alt="" title="" class="btn-down" src="/Images/LargeIcon/down.png" />
            </a>
        </div>
        <div class="module-content m-border bgcolor">
    &nbsp; &nbsp; Kỹ thuật:<br />
    &nbsp; &nbsp; &nbsp; &nbsp; Y!M: <a href="ymsgr:sendim?do_xari">
	        <img border="0" src="http://opi.yahoo.com/online?u=do_xari&amp;m=g&amp;t=2" alt="" />
	    </a><br />
    &nbsp; &nbsp; &nbsp; &nbsp; Điện thoại: (08) 3500 4267<br />
    &nbsp; &nbsp; <a href="#">Hướng dẫn sử dụng CMS</a>
        </div>
        <div class="module-border module-bottom">
            <div class="b4 m-border bgcolor">
            </div>
            <div class="b3 m-border bgcolor">
            </div>
            <div class="b2 m-border bgcolor">
            </div>
            <div class="b1 m-border bgcolor">
            </div>
        </div>
    </div>
</div>