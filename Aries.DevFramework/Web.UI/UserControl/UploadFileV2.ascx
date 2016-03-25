<%@ control language="C#" autoeventwireup="true" codebehind="UploadFileV2.ascx.cs" inherits="Web.UI.UserControl.UploadFileV2" %>
<div id="div_control">
    <style type="text/css">
        .baseBottom {
            vertical-align: middle;
        }
        .container {
            margin-bottom:10px; border:1px solid #B0E0E6;
            width:100%;
        }
        .toolbar {
            margin-left:50px; padding:4px 4px;
        }
            .toolbar .section_1 {
            }
            .toolbar .section_2 {                
            }
        .content {
            height:200px;
        }
        .progress {
            
        }
    </style>
    <div class="container">
        <div id="divUploadContainer" class="toolbar">
            <div id="divUploadPlace">
                <span id="spanUploadInfo" class="section_1">
                    <span>
                        <input type="checkbox" value="1" name="chkCompressPic" id="chkCompressPic" checked="checked" /><label for="chkCompressPic">压缩图片</label>
                    </span>
                    <span>文件类型：</span>
                    <select id="ddlSub" style="width: 200px;">
                        <%=GetFileType() %>
                    </select>
                </span>
                <span class="section_2">
                    <input type="button" value="选择文件" />
                    <input type="button" value="上传" class="btn-small"/>
                    <input type="button" value="取消" class="btn-small"/>
                    <%--<input id="btnReview" type="button" value="审核" onclick="reviewFiles();" />--%>
                    <input type="button" value="打包下载" class="btn-small"/>
                    <input type="button" value="批量删除" class="btn-small"/>
                </span>
            </div>
            <div class="progress" style="display:none;">
                <div class="fieldset flash" style="vertical-align: bottom;">
                    <span class="legend">上传信息</span>
                </div>
            </div>
        </div>
        <div class="content">
            <table></table>
        </div>
    </div>
    
    <script type="text/javascript">
        (function (Obj) {
            var displaymodel = "<%=(int)DisplayMode %>";
            var relaPath = "<%=RelaPath%>";
            var view_mode = "<%=(int)ViewMode%>";
            var $root = Obj.root = $(".container").last();
            CYQ.FileUpload._construct(Obj, displaymodel, relaPath, view_mode, $root)
        })(getNewId());
    </script>
</div>
