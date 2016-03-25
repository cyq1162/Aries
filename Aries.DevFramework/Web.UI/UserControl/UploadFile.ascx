<%@ control language="C#" autoeventwireup="true" codebehind="UploadFile.ascx.cs" inherits="Web.UI.UserControl.UploadFile" %>
<div id="div_control">
    <style type="text/css">
        .baseBottom {
            vertical-align: middle;
        }
    </style>
    <link href='/Style/JS/UploadPlugin/swfupload/swfUpload.css' rel='stylesheet' />
    <script src="/Style/JS/UploadPlugin/swfupload/swfupload.js"></script>
    <script src="/Style/JS/UploadPlugin/swfupload/swfupload.queue.js"></script>
    <script src="/Style/JS/UploadPlugin/swfupload/fileprogress.js"></script>
    <script src="/Style/JS/UploadPlugin/swfupload/handlers.js"></script>
    <script src="/Style/JS/UploadPlugin/swfupload/swfupload.cookies.js"></script>

    <script type="text/javascript">
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
                      // '<a class="cktp centerA" title="查看缩略图"  onclick="TY.Window.open(\'/UI/Web/Common/Pages/DisplayImage.aspx?method=showImg&imgpath=' + encodeURI(rec.FilePath) + '\',\'' + rec.FileName + '\',false,{width:800,height:500,fit:false,maximizable:true})"></a>' +
                      '<a class="cktp centerA" title="查看缩略图"  onclick="TY.Window.open(\'/Ajax/FileUpload.ashx?method=GetImage&mid='+mid+'&fileId=' + rec.FileID + '\',\'' + rec.FileName + '\',false,{width:800,height:500,fit:false,maximizable:true})"></a>' +
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
        //下载文件
        function downloadFile(v, row) {

            var ids = new Array();
            if (v) {
                ids.push("'" + v + "'");
            } else {
                ids = dg_upload.getChecked() || ids;
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
            //        TY.Window.showMsg("下载失败，服务器文件已丢失...");
            //    }
            //}
            form_export[0].submit();
            form_export.remove();
            //TY.ajax("DownLoadFiles",null, {ids:ids.join(',')}, false, null, '/Ajax/FileUpload.ashx');
        }

        //上传文件，全局变量
        var upload1, pageindex, theDataGrid, ifrmDown, closeProc, filesArray = new Array();
        function initUpload() {
            upload1 = new SWFUpload({
                // Backend Settings
                upload_url: ui + '/Ajax/FileUpload.ashx?method=UploadFiles',
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
                button_placeholder_id: "spanButtonPlaceholder1",
                button_image_url: "/Style/Images/swf_btn.png",
                button_text: "<span class='redText'>选择文件</span>",
                button_text_style: ".redText { color:#FFFFFF;}",
                button_cursor: SWFUpload.CURSOR.HAND,
                button_width: 72,
                button_height: 26,
                button_text_top_padding: 3,
                button_text_left_padding: 10,

                custom_settings: {
                    progressTarget: "fsUploadProgress1",
                    cancelButtonId: "btnCancel1"
                },

                // Debug Settings
                debug: false
            });
        }
        function startUpload() {
            if ($('#ddlSub').val() == "") {
                TY.Window.showMsg("请选择一个文件类型");
                return false
            };
            var checkCompress = document.getElementById('chkCompressPic').checked == true ? '1' : '0';
            //var post_params = { "ddlSub": $('#ddlSub').val(), "isCompressPic": checkCompress, "RelaPah": "<%=RelaPath%>", "BusinessKey": "C296F51E-C2EC-45DA-B59F-5B84C94D42F9", "DisplayMode": "<%=DisplayMode %>" };
            //upload1.setPostParams(post_params);            
            upload1.addPostParam("ddlSub", $('#ddlSub').val());
            upload1.addPostParam("isCompressPic", checkCompress);
            upload1.addPostParam("RelaPath", "<%=RelaPath%>" + "/" + $('#ddlSub option:selected').text());
            upload1.addPostParam("BusinessKey", window.businesskey);
            upload1.addPostParam("DisplayMode", "<%=(int)DisplayMode %>");
            upload1.startUpload();
        }
        //每次上传文件
        function uploadStartOwner(file) {
            //alert("uploding..");
        }
        var queue_count = 0;
        //每次上传完文件
        function uploadCompleteOwner(file) {
            queue_count = queue_count + 1;
            dg_upload.self.datagrid("reload");
            if (queue_count === this.queue_count) {
                $('#uploadDiv').hide(5000);
            }
            if (window.onUploadComplete) {
                window.onUploadComplete.call(dg_upload, file);
            }
        }

    </script>
    <div id="divUploadContainer" style="margin-left: 50px; padding: 4px 4px;">
        <div id="divUploadPlace">
            <span id="spanUploadInfo">
                <span>
                    <input type="checkbox" value="1" name="chkCompressPic" id="chkCompressPic" checked="checked" /><label for="chkCompressPic">压缩图片</label>
                </span>
                <span>文件类型：</span>
                <select id="ddlSub" style="width: 200px;">
                    <%=GetFileType() %>
                </select>
            </span>
            <span>
                <input id="spanButtonPlaceholder1" type="button" value="选择文件" />
                <input id="btnUpload" type="button" value="上传" class="btn-small" onclick="startUpload();" />
                <input id="btnCancel1" type="button" value="取消" class="btn-small" onclick="cancelQueue();" />
                <%--<input id="btnReview" type="button" value="审核" onclick="reviewFiles();" />--%>
                <input id="btnDownLoadRar" type="button" value="打包下载" class="btn-small" onclick="downloadFile();" />
                <input id="btnDeleteList" type="button" value="批量删除" class="btn-small" onclick="delRows(null, null, dg_upload.id)" />
            </span>
        </div>
        <div id="uploadDiv" style="display: none;">
            <div class="fieldset flash" id="fsUploadProgress1" style="vertical-align: bottom;">
                <span class="legend">上传信息</span>
            </div>
        </div>
    </div>
    <div style="height: 200px;">
        <table id="dg_upload"></table>
    </div>

    <script type="text/javascript">
        var displaymodel = "<%=(int)DisplayMode %>";

        $(function () {

            $('#spanUploadInfo,#spanButtonPlaceholder1,#btnUpload,#btnCancel1,#btnDeleteList').each(function (i) { $(this).removeAttr('disabled'); })
            if (displaymodel == 1) {
                initUpload();
                initGrid();
            } else if (displaymodel == 2) {
                $('#spanUploadInfo,#spanButtonPlaceholder1,#btnUpload,#btnCancel1,#btnDeleteList').each(function (i) { $(this).attr('disabled', 'disabled'); })
                initGrid();
            } else if (displaymodel == 3) {
                $('#btnDeleteList').each(function (i) { $(this).attr('disabled', 'disabled'); })
                initUpload();
                initGrid();
            } else {
                $('#spanUploadInfo,#spanButtonPlaceholder1,#btnUpload,#btnCancel1').each(function (i) { $(this).attr('disabled', 'disabled'); })
            }


            $("#ddlSub").change(function () {
                var opts = dg_upload.self.datagrid("options");
                var condition = [];
                if ($(this).val() != "") {
                    condition = condition.concat({ paramName: 'FileTypeID', paramPatten: 'Equal', paramValue: $(this).val() });
                }
                if (opts.defaultWhere) {
                    jsonString = JSON.stringify(condition.concat(opts.defaultWhere));
                }
                var data = { searchList: jsonString };
                if (dg_upload.self.datagrid('getRows')) {
                    dg_upload.self.datagrid('clearSelections');
                }
                dg_upload.self.datagrid('load', data);
            });

        });
        var dg_upload, interval;
        function initGrid() {

            var i = 0;
            interval = setInterval(function () {
                i++;
                if (i == 5) {
                    TY.Window.showMsg('由于业务主键未设置导致文件上传控件加载失败...');
                    clearInterval(interval);
                }

                if (window.businesskey) {
                    clearInterval(interval);
                    $("#div_control").show();
                    var op = 'Equal';
                    if (window.businesskey.indexOf(',') != -1) {
                        op = 'In';
                    }
                    var ops = {
                        //onHeaderContextMenu: function () { },
                        pageSize:15,
                        pageList: [1050],
                        defaultWhere: [{ paramName: 'BusinessKey', paramPatten: op, paramValue: businesskey }],
                        url:TY.handler.fileupload
                    };

                    //TY.ajaxOption.url = TY.handler.fileupload; //设定当前处理程序的路劲
                    dg_upload = TY.DataGrid.create("PB_File", null, "dg_upload", true, false, ops);

                    if (displaymodel == 3 || displaymodel == 2) {
                        dg_upload.setButtons([
                                    { btn: 'download', title: '下载文件', click: "downloadFile" }
                        ]);
                    }
                    else {
                        dg_upload.setButtons([
                                    { btn: 'download', title: '下载文件', click: "downloadFile" },
                                    { btn: 'del' }
                        ]);
                    }
                    //此方法提供刷新页面，根据改变businesskey的值刷新查询
                    dg_upload.reload = function (bk) {
                        clearInterval(interval);
                        dg_upload.self.datagrid("load", { searchList: JSON.stringify([{ paramName: 'BusinessKey', paramPatten: 'Equal', paramValue: bk }]) });
                    }
                    var view_mode = "<%=(int)ViewMode%>";
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
                        dg_upload.self.datagrid("hideColumn", hideColumns[j]);
                    }

                }
            }, 1000);
        }

        function delRows(el, id, thatID) {

            var that = TY.Page._Objcets[thatID];
            if (!that.tableName) {
                throw new Error("当前绑定视图没有设定，删除表名对象，请在binview函数设置后，重新操作！")
            }
            var ids = new Array();
            if (id) {
                ids.push("'" + id + "'");
            } else {
                var selRows = that.self.datagrid("getChecked");
                if (selRows.length == 0) {
                    return false;
                }
                for (var i = 0; i < selRows.length; i++) {
                    var id = selRows[i][that._primarykey];
                    ids.push("'" + id + "'");
                }
            }

            TY.Window.confirm('确认删除操作吗？', null, function () {
                TY.Ajax("FileDelete", that.tableName, { "id": ids.join(',') }, false, null, TY.handler.fileupload, function (responseData) {
                    if (responseData.success != undefined && responseData.success) {
                        TY.Window.showMsg("删除成功");
                        that.self.datagrid("reload");
                    } else {
                        TY.Window.showMsg("删除失败！错误信息：" + responseData.errorMsg);
                        that.self.datagrid("reload");
                    }
                });
            });
        }
    </script>
</div>
