function Advertisement() {
    this.zones = [];
}
Advertisement.prototype.Add = function (zone) {
    this.zones[this.zones.length] = zone;

}
Advertisement.prototype.Draw = function () {
    for (var i = 0; i < this.zones.length; i++) {
        this.zones[i].Draw();
    }
}
function Adv_Zone(id, holderid, mode, direction, width, height) {
    this.Id = id;
    this.HolderId = holderid;
    this.Mode = mode;
    this.Direction = direction;
    this.Width = width;
    this.Height = height;
    this.blocks = [];
}
Adv_Zone.prototype.Add = function (block) {
    this.blocks[this.blocks.length] = block;
    this.blocks[this.blocks.length - 1].index = this.blocks.length - 1;
}
Adv_Zone.prototype.Draw = function () {
    for (var i = 0; i < this.blocks.length; i++) {
        $(this.HolderId).append(this.blocks[i].Draw());
        this.blocks[i].Play();
    }
}
function Adv_Block(id, mode, timeDelay, width, height) {
    this.Id = id;
    this.Mode = mode;
    this.TimeDelay = timeDelay;
    this.Width = width;
    this.Height = height;
    this.items = [];
    this.HTML = '';
    this.container = '';
    this.cycle = null;
    this.index = 0;
}
Adv_Block.prototype.Add = function (item) {
    this.items[this.items.length] = item;
}
Adv_Block.prototype.Play = function () {
    if (this.items.length > 1) {
        this.cycle = $(this.container).cycle({
            fx: 'fade',
            speed: this.TimeDelay,
            random: this.Mode
        });
    }
}
Adv_Block.prototype.Draw = function () {
    this.container = '#block'.concat(this.Id);
    var divBlock = '<div class="block item-'.concat(this.index) + '" id="block'.concat(this.Id) + '" style="width:'.concat(this.Width) + 'px;height='.concat(this.Height) + 'px" >';
    for (var i = 0; i < this.items.length; i++) {
        this.items[i].ExWidth = this.Width;
        this.items[i].ExHeight = this.Height;
        divBlock += this.DrawItem(this.items[i]);
    }
    divBlock += '</div>';
    this.HTML = divBlock;
    return this.HTML;
}
Adv_Block.prototype.DrawItem = function (item) {
    switch (item.TypeId) {
        case 1: //Hình ảnh
            item.DrawImage();
            break;
        case 2: //Flash
            item.DrawFlash();
            break;
        case 3: //Add-code
            item.DrawAddCode();
            break;
        case 4: //Rich media - Expanding
            item.DrawRichMedia();
            break;
        case 5: //IFrame
            item.DrawIFrame();
            break;
        case 6: //Plugin
            item.DrawPlugin();
            break;
    }
    return item.HTML;
}
function Adv_Item(id, typeid, link, filelink1, filelink2, fileJS, codeJS, exWidth, exHeight, exMode,exPluginCode) {
    this.Id = id;
    this.TypeId = typeid;
    this.Link = link;
    this.FileLink1 = filelink1;
    this.FileLink2 = filelink2;
    this.FileJS = fileJS;
    this.CodeJS = codeJS;
    this.ExWidth = exWidth;
    this.ExHeight = exHeight;
    this.ExMode = exMode;
    this.HTML = null;
    this.PluginCode = exPluginCode;
}
Adv_Item.prototype.DrawImage = function () {
    var html = '<a target="_blank" style="display:" href="'.concat(this.Link) + '"><img src="'.concat(this.FileLink1) + '" width="'.concat(this.ExWidth) + 'px" height="'.concat(this.ExHeight) + 'px"></a>';
    this.HTML = html;
}
Adv_Item.prototype.DrawFlash = function () {
    this.HTML = '<embed width="'.concat(this.ExWidth) + '" height="'.concat(this.ExHeight) + '" wmode="opaque" type="application/x-shockwave-flash" src="'.concat(this.FileLink1) + '" pluginspage="http://www.adobe.com/go/getflashplayer" flashvars="">';
}
Adv_Item.prototype.DrawAddCode = function () {

}
Adv_Item.prototype.DrawRichMedia = function () {

}
Adv_Item.prototype.DrawIFrame = function () {

}
Adv_Item.prototype.DrawPlugin = function () {
    this.HTML = this.PluginCode;
    
}

function Run_Advertising() {
    $.post('/hcsss/Ajax/AdvsAjax.ashx?id='.concat(CategoryID) + '&layoutName='.concat(layoutName) + '&time=' + new Date().getTime(), function (data) {
        eval(data);
        LoadAjax();
    })
}
$(document).ready(function () {
    Run_Advertising();
});