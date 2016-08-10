(function ($, $Core) {
    var ui = $Core.Global.Variable.ui;
    //模块路劲设置
    $.extend($Core.route, {
        sys: ui + '/ajax.html',
        menu: '/SysAdmin/ajax.html',
        gridconfig: ui + '/Web/SysAdmin/Config.xxxl'
    });

    //格式主键模板
    $Core.PKTemplate = {
        edit: '<a  class="bj"  title="编辑" op="1"></a>',
        del: '<a  class="sc"   title="删除"></a>',
        detail: '<a class="ckxq" title="查看详情" op="0"></a>',
        picture: '<a  class="cktp" title="查看图片" op="0"></a>',
        download: '<a  class="xz" title="下载" op="0"></a>',
        ckjd: '<a  class="ckjd" title="查看进度"  op="0" ></a>',
        shtg: '<a class="shtg" title="审核通过"   op="0" ></a>',
        dsh: '<a class="dsh"  title="待审核"   op="0" ></a>',
        save: '<a class="bc" title="保存"   op="0"></a>',
        zh: '<a class="zh" title="替换"   op="0"></a>',
        xf: '<a class="xf" title="邮件"   op="0"></a>',
        lc: '<a class="lc" title="流程"   op="0"></a>',
        file: '<a class="wj" title="文件"   op="0"></a>',
        save: '<a class="bc" title="保存"   op="0"></a>',
        upload: '<a class="bc" title="上传"   op="0"></a>',
        remove: '<a class="sc" title="移除"   op="0"></a>',
        cexiao: '<a class="cz" title="撤销"   op="0"></a>'
    };
    //$Core.themes = [
    //    'default', 'black', 'gray', 'metro', 'metro-blue', 'metro-gray', 'metro-green', 'metro-orange', 'metro-red'
    //                    , 'ui-cupertino', 'ui-dark-hive', 'ui-pepper-grinder', 'ui-sunny'
    //];
    $Core.themes = [
        'default', 'black', 'gray', 'metro'
    ];
})(jQuery, AR)


