$(function () {
    var themeName = AR.Utility.Cookie.get('sys_theme') || 'default';
    $('#lk_theme').attr('href', '/Style/JS/EasyUI-1.3.4/themes/' + themeName + '/easyui.css');
});

function setThemeName(themeName) {
    $('#lk_theme').attr('href', '/Style/JS/EasyUI-1.3.4/themes/' + themeName + '/easyui.css');
    $.each($("#tabs").tabs('tabs'), function () {
        var iframe = this.find('iframe')[0];
        if (iframe) {
            var document = iframe.contentWindow;
            if (document.$) {
                document.$('#lk_theme').attr('href', '/Style/JS/EasyUI-1.3.4/themes/' + themeName + '/easyui.css');
            }
            
        }
    });
}