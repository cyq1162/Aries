
//下载文件
function downloadFile(v, row) {
    var ids = new Array();
    if (v) {
        ids.push("'" + v + "'");
    } else {
        ids = this.DataGrid.getChecked() || ids;
    }
    if (ids.length == 0) {
        return false;
    }
    //to do something
    var div_frame = $("#div_ifrme_template");
    div_frame && div_frame.remove();
    var div = $("<div>").attr("id", "div_ifrme_template");
    var iframeName = "framePost";
    var form_export = $("<form>").attr("action", ui + '/Ajax/FileUpload.ashx').attr("target", iframeName).attr("method", "POST");
    form_export.append($("<input>").attr("name", "method").val("DownLoadFiles"));
    form_export.append($("<input>").attr("name", "objName").val(""));
    form_export.append($("<input>").attr("name", "ids").val(ids.join(',')));
    var ifrme = $("<iframe>").attr("name", iframeName).css({ display: 'none' });
    div.append(ifrme);
    div.append(form_export).css({ display: 'none' });
    $("body").append(div);
    //ifrme[0].contentWindow.onload = function () {
    //    if (ifrme[0].contentWindow.document.body.innerHTML.length > 0) {
    //        AR.Window.showMsg("下载失败，服务器文件已丢失...");
    //    }
    //}
    form_export[0].submit();
    form_export.remove();
    //AR.ajax("DownLoadFiles",null, {ids:ids.join(',')}, false, null, '/Ajax/FileUpload.ashx');
}
//格式化Icon 图标的显示
function fileNameContainer(value, row) {
    var zipc = /\.[^\.]+$/.exec(row.FileName);
    var prefix = value.substring(value.lastIndexOf('.') + 1);
    var iconPath = StringFormat.execute("/Style/Images/file/{0}.gif", prefix);
    if (zipc == '.dwg' || zipc == '.DWG') {
        return '<div style="text-align:left;" >' +
        '<image class="baseBottom" type="image" src="' + iconPath + '" title="' + value + '" onerror="javascript:this.src=ui+\'/Style/Images/file/other.gif\';onerror=null;" />' +
            '<a   onclick="showDIVwindow(\'' + row.FileID + '\')"   class="ckxq">' + row.FileName + '</a>'
        + '</div>';
    } else {

        return '<div style="text-align:left;" >' +
                   '<image class="baseBottom" type="image" src="' + iconPath + '" title="' + value + '" onerror="javascript:this.src=ui+\'/Style/Images/file/other.gif\';onerror=null;" />' +
                   '<span>' + value + '</span>' +
               '</div>';
    }

}

//查看缩略图
function thumbnailsContainer(value, rec) {
    var isImg = _checkImgFile(rec.FileName);
    if (isImg) {
        return '<div class="operation w1">' +
              // '<a class="cktp centerA" title="查看缩略图"  onclick="AR.Window.open(\'/UI/Web/Common/Pages/DisplayImage.html?method=showImg&imgpath=' + encodeURI(rec.FilePath) + '\',\'' + rec.FileName + '\',false,{width:800,height:500,fit:false,maximizable:true})"></a>' +
              '<a class="cktp centerA" title="查看缩略图"  onclick="AR.Utility.Window.open(\'/Ajax/FileUpload.ashx?method=GetImage&mid=' + AR.Global.Variable.mid + '&fileId=' + rec.FileID + '\',\'' + rec.FileName + '\',false,{width:800,height:500,fit:false,maximizable:true})"></a>' +
                '</div>';
    }
    else {
        return '<div class="operation w1">' +
                '</div>';
    }
}
//判断是否是图片
function _checkImgFile(fileName) {
    var ext = _getFileExt(fileName);
    var arr = [".gif", ".jpg", ".jpeg", ".bmp", ".png", ".ico", ".ilbm", ".lbm", ".iff", ".ppm", ".psd", ".tif", ".tiff"];
    for (var i = 0; i < arr.length; i++) {
        if (ext == arr[i])
            return true;
    }
    return false;
}
//获取文件后缀名
function _getFileExt(fileName) {
    return fileName.substring(fileName.lastIndexOf('.')).toLocaleLowerCase();
}

function getNewId() {
    var items = AR.FileUpload.items;
    if (items.length == 0) {
        items[0] = { id: "dg1" };
    } else {
        items[items.length] = { id: "dg" + (items.length + 1) };
    }
    return items[items.length - 1];
}

(function () {
    AR.Utility.loadCss("/Style/JS/UploadPlugin/swfupload/swfUpload.css");
    AR.Utility.loadJs("/Style/JS/UploadPlugin/swfupload/swfupload.js");
    AR.Utility.loadJs("/Style/JS/UploadPlugin/swfupload/swfupload.queue.js");
    AR.Utility.loadJs("/Style/JS/UploadPlugin/swfupload/fileprogress.js");
    AR.Utility.loadJs("/Style/JS/UploadPlugin/swfupload/swfupload.cookies.js");
    AR.Utility.loadJs("/Style/JS/UploadPlugin/swfupload/handlers_v2.0.js", function () {
        AR.FileUpload._isLoad = true;
    });    
    AR.FileUpload = {
        items: [],
        _construct: construct,
        _isLoad:false
    }
    function construct(Obj, displaymodel, relaPath, view_mode, $root) {
        $root.find(".content").children("table").attr("id", Obj.id);
        var $ckbCompressPic = Obj.ckbCompressPic = $root.find(".section_1").find(":checkbox:eq(0)");
        var $selFileType = Obj.selFileType = $root.find(".section_1").find("select:eq(0)");
        //区域二
        var $btnChose = Obj.btnChose = $root.find(".section_2").find(":button:eq(0)");
        var $btnUpload = Obj.btnUpload = $root.find(".section_2").find(":button:eq(1)");
        var $btnCancel = Obj.btnCancel = $root.find(".section_2").find(":button:eq(2)").attr("id", "cancel_" + Obj.id);
        var $btnDownload = Obj.btnDownload = $root.find(".section_2").find(":button:eq(3)");
        var $btnDel = Obj.btnDel = $root.find(".section_2").find(":button:eq(4)");
        var $progress_panal = Obj.progress_panal = Obj.root.find(".progress").attr("id", "div_progress_" + Obj.id);
        var $progress_target = Obj.progress_target = Obj.root.find(".progress").find("div:first").attr("id", "pTarget_" + Obj.id);
        /** 初始化上传控件
        *@param{string} businesskey
        *@param{object} upload_settings SWFUpload的settings配置覆盖
        *@param{object} datagrid_option DataGrid的option配置覆盖
        */
        Obj.init = function (businesskey, upload_settings, datagrid_option) {            
            this.businesskey = businesskey;
            this.settings = upload_settings || {};
            this.option = datagrid_option || {};
            if (this.option.height) {
                $root.find(".content").height(this.option.height);
            }
            //设置延迟，等待脚本加载完成
            var interval = setInterval(function () {
                if (AR.FileUpload._isLoad) {
                    initGrid.call(this);//绑定Datagrid                
                    if (displaymodel == 1) {
                        initUpload.call(this);
                    } else if (displaymodel == 2) {
                        $btnUpload.hide();
                        $btnChose.hide();
                        $btnCancel.hide();
                        $btnDel.hide();
                    } else if (displaymodel == 3) {
                        initUpload.call(this);
                        $btnDel.hide();
                    }
                    registEvents();
                    clearInterval(interval);
                }
            }, 100);            
        }

        function registEvents() {
            //下拉框
            $selFileType.change(function () {
                var opts = Obj.DataGrid.$target.datagrid("options");
                var condition = [];
                if ($(this).val() != "") {
                    condition = condition.concat({ paramName: 'FileTypeID', paramPattern: 'Equal', paramValue: $(this).val() });
                }
                if (opts.defaultWhere) {
                    jsonString = JSON.stringify(condition.concat(opts.defaultWhere));
                }
                var data = { searchList: jsonString };
                if (Obj.DataGrid.$target.datagrid('getRows')) {
                    Obj.DataGrid.$target.datagrid('clearSelections');
                }
                Obj.DataGrid.$target.datagrid('load', data);
            });
            //上传按钮
            Obj.btnUpload.click(function () {
                startUpload();
            });
            //取消
            Obj.btnCancel.click(function () {
                cancelQueue.call(Obj); //此方法冲突
            });
            //下载
            Obj.btnDownload.click(function () {
                downloadFile.call(Obj);
            });
            //删除
            Obj.btnDel.click(function () {
                Obj.DataGrid.PKColumn.onDel(null, null, Obj.id);
            });
        }
        //上传文件，全局变量
        function initUpload() {
            var settings = {
                // Backend Settings
                upload_url: AR.Global.Variable.ui + '/Ajax/FileUpload.ashx?method=UploadFiles',
                // File Upload Settings
                file_size_limit: "204800 MB",	// 100MB
                file_types: "*.*",
                file_types_description: "All Files",
                file_upload_limit: 500,
                file_queue_limit: 0,

                // Event Handler Settings (all my handlers are in the Handler.js file)
                swfupload_preload_handler: preLoad,
                swfupload_load_failed_handler: loadFailed,
                file_dialog_start_handler: fileDialogStart,
                file_queued_handler: fileQueued,
                file_queue_error_handler: fileQueueError,
                file_dialog_complete_handler: fileDialogComplete,
                upload_start_handler: uploadStartOwner,//uploadStart
                upload_progress_handler: uploadProgress,
                upload_error_handler: uploadError,
                upload_success_handler: uploadSuccess,
                upload_complete_handler: uploadCompleteOwner,//uploadComplete

                // Button Settings
                //button_placeholder_id: "spanButtonPlaceholder1",
                button_placeholder: $btnChose[0],
                button_image_url: "/Style/Images/swf_btn.png",
                button_text: "<span class='redText'>选择文件</span>",
                button_text_style: ".redText { color:#FFFFFF;}",
                button_cursor: SWFUpload.CURSOR.HAND,
                button_width: 72,
                button_height: 26,
                button_text_top_padding: 3,
                button_text_left_padding: 10,

                custom_settings: {
                    progressTarget: $progress_target.attr("id"),
                    cancelButtonId: $btnCancel.attr("id")
                },
                debug: false
            };
            settings = $.extend(settings, Obj.settings);
            Obj.upload = new SWFUpload(settings);
            Obj.upload.div_progress = Obj.root.find(".progress");
        }
        function startUpload() {
            if (Obj.selFileType.val() == "") {
                AR.Utility.Window.showMsg("请选择一个文件类型");
                return false
            };
            Obj.upload.addPostParam("ddlSub", Obj.selFileType.val());
            Obj.upload.addPostParam("isCompressPic", Obj.ckbCompressPic[0].checked == true);
            Obj.upload.addPostParam("RelaPath", relaPath + "/" + Obj.selFileType.find("option:selected").text());
            Obj.upload.addPostParam("BusinessKey", Obj.businesskey);
            Obj.upload.addPostParam("DisplayMode", displaymodel);
            Obj.upload.startUpload();
        }
        //每次上传文件
        function uploadStartOwner(file) {
            //alert("uploding..");
        }
        var queue_count = 0;
        //每次上传完文件
        function uploadCompleteOwner(file) {
            queue_count = queue_count + 1;
            Obj.DataGrid.reload();
            if (queue_count === this.queue_count) {
                $progress_panal.slideUp(3000);
            }
        }


        function initGrid() {
            if (Obj.businesskey) {
                var op = 'Equal';
                if (Obj.businesskey.indexOf(',') != -1) {
                    op = 'In';
                }
                var opts = {
                    //onHeaderContextMenu: function () { },
                    pageSize: 5,
                    pageList: [5, 10, 15, 30, 50],
                    defaultWhere: [{ paramName: 'BusinessKey', paramPattern: op, paramValue: Obj.businesskey }]
                    , url: AR.route.fileupload
                };               
                Obj.DataGrid = new AR.DataGrid("PB_File", "PB_File", Obj.id);
                Obj.DataGrid.isShowToolbar = Obj.option.isShowToolbar || false;
                Obj.DataGrid.options = $.extend(opts, Obj.option);                
                if (displaymodel == 3 || displaymodel == 2) {
                    Obj.DataGrid.PKColumn.add("download", "下载文件", "downloadFile");
                }
                else {
                    Obj.DataGrid.PKColumn.add("download", "下载文件", "downloadFile");
                    Obj.DataGrid.PKColumn.add("del");
                }
                Obj.DataGrid.bind();                
                ////此方法提供刷新页面，根据改变businesskey的值刷新查询
                //Obj.DataGrid.reload = function (bk) {
                //    this.DataGrid.self.datagrid("load", { searchList: JSON.stringify([{ paramName: 'BusinessKey', paramPattern: 'Equal', paramValue: bk }]) });
                //}
                var hideFiles = ['FileName', 'FileTypeID', 'FileSize', 'FilePath', 'Creator', 'CreatTime'];
                var hideColumns = [];
                switch (view_mode) {
                    case '1':
                        hideColumns = hideFiles.splice(2, 2);
                        break;
                    case '2':
                        hideColumns = hideFiles.splice(3, 1);
                        break;
                    default:
                        break;
                }
                for (var j = 0, len = hideColumns.length; j < len; j++) {
                    Obj.DataGrid.$target.datagrid("hideColumn", hideColumns[j]);
                }
            } else {
                AR.Utility.Window.showMsg('由于业务主键未设置导致文件上传控件加载失败...');
            }
        }
        
    }

}
)();


