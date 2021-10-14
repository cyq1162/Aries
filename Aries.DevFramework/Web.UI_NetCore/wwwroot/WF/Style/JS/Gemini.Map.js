/// <reference path="/Style/JS/Aries.Loader.js" />
(function (Designer) {
    Designer.Common = {
        isHiddenName: function (name, type, activityType) {
            switch (name) {
                case "ActivityList":
                case "TransitionList":
                case "IsDeleted":
                case "AreaMap":
                case "Version":
                    return true;
            }
            if (type == "node") {
                switch (activityType.toLowerCase()) {
                    case "start":
                        if (this.isActorAttribute(name)) {
                            return false;
                        }
                        break;
                    case "end":
                        if (name == "SplitType") {
                            return true;
                        }
                        break;
                    case "normal":
                    case "loopself":
                        return this.isSubWorkflowAttribute(name);
                    case "outersubworkflow":
                    case "innersubworkflow":
                        //switch (name) {
                        //    case "SplitType":
                        //    case "OutType":
                        //        return true;
                        //}
                        if (activityType.toLowerCase() == "innersubworkflow" && name == "SubAssembly") {
                            return true;
                        }
                        if (activityType.toLowerCase() == "outersubworkflow" && name == "SubAppID") {
                            return true;

                        }
                        if (this.isCirculateAttribute(name)) {
                            return true;
                        }
                        return false;
                        break;


                }
                return this.isBoolean(name) || this.isActorAttribute(name) || this.isCirculateAttribute(name) || this.isReturnAttribute(name) || this.isSubWorkflowAttribute(name);
            }
            return false;

        },
        isBoolean: function (name) {
            return name.startWith("Is");
        },
        //是否工作流设计器名称
        isGridAttrName: function (name) {
            switch (name) {
                case "PositionX":
                case "PositionY":
                case "Width":
                case "Height":
                case "ActivityType":
                case "LineType":
                case "PostionM":
                case "FromActivityID":
                case "ToActivityID":
                case "ActivityName":
                case "WorkflowName":
                case "ActivityID":
                case "TransitionID":
                case "WorkflowID":
                case "StepID":
                case "CreateTime":
                case "Creator":
                case "UpdateTime":
                case "Updator":
                case "Remark":
                    return true;
            }
            return false;
        },
        //是否参与者属生
        isActorAttribute: function (name) {
            switch (name) {
                case "ActorParser":
                case "ActorParamter":
                case "RespondType":
                    return true;
            }
            return false;
        },
        //消息提醒传阅转交
        isCirculateAttribute: function (name) {
            switch (name) {
                case "CirculateType":
                case "CirculateActor":
                    return true;
            }
            return false;
        },

        //是否退回属生
        isReturnAttribute: function (name) {
            switch (name) {
                case "RejectActivity":
                case "RejectType":
                    return true;
            }
            return false;
        },
        //是否路由属生
        isRouteAttribute: function (name) {
            switch (name) {
                case "JoinType":
                case "SplitType":
                    return true;
            }
            return false;
        },
        //是否迁移条件
        isLineAttribute: function (name) {
            switch (name) {
                case "GroupName":
                case "GroupNum":
                case "IsJoinRequire":
                    return true;
            }
            return false;
        },
        //是否外嵌子流程属性
        isSubWorkflowAttribute: function (name) {
            switch (name) {
                case "SubAppID":
                case "SubAssembly":
                    return true;
            }
            return false;
        },
        //找到节点Json数据并根据action（"exists","get","delete") 做不同的动作。
        findwfData: function (id, type, action) {
            var wf = Designer.Data.workflow;
            var nodeList = wf.Definition.ActivityList;
            for (var i = 0; i < nodeList.length; i++) {
                if (type == "node") {
                    if (nodeList[i].ActivityID == id) {
                        switch (action) {
                            case "exists":
                                return true;
                            case "delete":
                                nodeList.splice(i, 1);
                                return undefined;
                            default:
                                return nodeList[i];
                        }
                    }
                }
                else {
                    //处理线
                    if (nodeList[i].TransitionList && nodeList[i].TransitionList) {
                        var setList = nodeList[i].TransitionList;
                        if (setList instanceof Array) {
                            //for (var k = 0; k < setList.length; k++) {
                            for (var k in setList) {



                                if (setList[k].TransitionID == id) {
                                    switch (action) {
                                        case "exists":
                                            return true;
                                        case "delete":
                                            //var len=setList.length-1
                                            setList.splice(k, 1);
                                            //delete setList[k];
                                            return undefined;
                                        default:
                                            return setList[k];
                                    }
                                }
                            }
                        }
                        else if (setList.TransitionID && setList.TransitionID == id) {
                            switch (action) {
                                case "exists":
                                    return true;
                                case "delete":
                                    delete nodeList[i].TransitionList;
                                    //delete setList;
                                    return undefined;
                                default:
                                    return setList;
                            }
                        }
                    }
                }
            }

            return undefined;
        },
        //点击节点时，获取相应的行数据
        getRows: function (type, id) {
            var wf = Designer.Data.workflow;
            switch (type) {
                case "title":
                    return this.jsonToRows(wf.Definition, type);
                    break;
                case "node":
                    var nodeList = wf.Definition.ActivityList;
                    for (var i in nodeList) {
                        if (nodeList[i].ActivityID == id) {
                            return this.jsonToRows(nodeList[i], type);
                        }
                    }
                    break;
                case "line":
                    var nodeList = wf.Definition.ActivityList;
                    for (var i in nodeList) {
                        if (nodeList[i].TransitionList && nodeList[i].TransitionList) {
                            var setList = nodeList[i].TransitionList;
                            if (setList instanceof Array) {
                                for (var j = 0; j < setList.length; j++) {
                                    if (setList[j].TransitionID == id) {
                                        return this.jsonToRows(setList[j], type);
                                    }
                                }
                            }
                            else if (setList.TransitionID == id) {
                                return this.jsonToRows(setList, type);
                            }
                        }
                    }
                    break;
            }
            return [];
        },
        getNodeTemplate: function (type, nodeTemplate) {

            var values = {};
            values.Width = 116;
            values.Height = 44;
            switch (type) {
                case "normal":
                case "start":
                case "end":
                    values.SplitType = "SplitOne";
                    values.JoinType = "JoinOne";
                    break;
                case "split":
                    values.SplitType = "SplitAny";
                    values.JoinType = "JoinOne";
                    break;
                case "join":
                case "outersubworkflow":
                case "innersubworkflow":
                case "loopself":
                    values.SplitType = "SplitOne";
                    values.JoinType = "JoinOne";
                    break;
            }
            return $.extend(true, nodeTemplate, values);
        },


        getMapAttrName: function (gridAttrName, type) {
            switch (gridAttrName) {
                case "PositionX":
                    return "left";
                case "PositionY":
                    return "top";
                case "Width":
                    return "width";
                case "Height":
                    return "height";
                case "ActivityType":
                case "LineType":
                    return "type";
                case "PostionM":
                    return "M";
                case "FromActivityID":
                    return "from";
                case "ToActivityID":
                    return "to";
                case "Remark":
                    if (type == "line") {
                        return "name";
                    }
                    break;
                case "ActivityName":
                case "WorkflowName":
                    return "name";
                case "ActivityID":
                case "TransitionID":
                case "WorkflowID":
                    return "id";
            }
            return "";
        },
        jsonToRows: function (json, type) {
            var rs = [];
            var groupName = "";
            for (var i in json) {
                if (!this.isHiddenName(i, type, json.ActivityType)) {
                    if (this.isGridAttrName(i)) groupName = "流程图属性";
                    else if (this.isLineAttribute(i)) groupName = "迁移条件";
                    else if (this.isBoolean(i)) groupName = "开关属性";
                    else if (this.isActorAttribute(i)) groupName = "参与者属性";
                    else if (this.isRouteAttribute(i)) groupName = "路由属性";
                    else if (this.isReturnAttribute(i)) groupName = "退回方式";
                    else if (this.isCirculateAttribute(i)) groupName = "传阅方式";
                    else if (this.isSubWorkflowAttribute(i)) groupName = "子流程属性";
                    else
                        groupName = "其它属性";
                    rs.push({ "name": i, "value": json[i], "editor": Designer.Grid.getEditor(i, json), "group": groupName });
                }
            }
            return rs;
        },
        //最终提交所调用的方法
        wfDataToJson: function () {
            var wfData = Designer.Data.postData;
            var wf = Designer.Data.workflow;
            var rowsToJson = Designer.Common.rowsToJson;
            //处理标题
            if (wfData.title) {
                rowsToJson(wfData.title, wf.Definition);
            }
            //处理节点
            var nodeList = wf.Definition.ActivityList;
            for (var i = 0; i < nodeList.length; i++) {
                var nodeID = nodeList[i].ActivityID;
                if (wfData[nodeID] != undefined) {
                    rowsToJson(wfData[nodeID], nodeList[i]);
                }
                //处理线 线和节点 都要处理。
                if (nodeList[i].TransitionList) {
                    var setList = nodeList[i].TransitionList;
                    for (var k = 0; k < setList.length; k++) {

                        var lineID = setList[k].TransitionID;
                        if (wfData[lineID] != undefined) {
                            rowsToJson(wfData[lineID], setList[k]);
                        }
                    }
                }

            }
        },
        rowsToJson: function (rows, json) {
            for (var i = 0; i < rows.length; i++) {
                var name = rows[i].name;
                var value = rows[i].value;
                if (json[name] != undefined) {
                    json[name] = value;
                }
            }
        },
        //从流程图操作映射回属性表。
        mapToGrid: function (id, type, left, top, width, height, name, M) {
            var demo = Designer.Map.map;
            var wfData = Designer.Data.postData;
            var json = demo.getItemInfo(id, type);
            var rows = wfData[id];
            for (var i in rows) {
                switch (rows[i].name) {
                    case "PositionX":
                        rows[i].value = left || (json && json.left) || rows[i];
                        break;
                    case "PositionY":
                        rows[i].value = top || (json && json.top) || rows[i];
                        break;
                        //case "ActivityType":
                        //    rows[i].value=left || json.left;
                        //    break;
                    case "LineType":
                        rows[i].value = (type == "line" ? undefined : type) || (json && json.type) || rows[i].value;

                        break;
                    case "PostionM":

                        rows[i].value = M || (json && json.M) || rows[i].value;

                        break;
                    case "FromActivityID":

                        rows[i].value = (json && json.from) || rows[i].value;

                        break;
                    case "ToActivityID":
                        // 切换线类型的时候，type 是新类型，json没有。

                        rows[i].value = (json && json.to) || rows[i].value;

                        break;
                    case "Remark"://GroupName
                        if (type == "line") {
                            rows[i].value = name || rows[i].value;
                        }
                        break;
                    case "ActivityName":
                    case "WorkflowName":
                        rows[i].value = name || (json && json.title) || rows[i].value;
                        break;
                        //case "ActivityID":
                        //case "TransitionID":
                        //case "WorkflowID":

                    case "Width":
                        rows[i].value = width || (json && json.width) || rows[i].value;
                        break;
                    case "Height":
                        rows[i].value = height || (json && json.height) || rows[i].value;
                        break;

                }
            }
            Designer.Grid.refleshGrid(rows);//右边重新显示。
            if (Designer.Data.saveOp == 0) {
                Designer.Common.wfDataToJson();
            }
        },
        //从属性编辑映射回流程图显示
        gridToMap: function (rowData, value) {
            var demo = Designer.Map.map;
            var focusid = Designer.Map.focusid;
            var focusType = Designer.Map.focusType;
            if (focusType == "title") {
                if (rowData.name == "WorkflowName") {
                    demo.setTitle(value);
                }
            }
            else {
                var json = demo.getItemInfo(focusid, focusType);
                if (json) {
                    var name = this.getMapAttrName(rowData.name, focusType);
                    switch (name) {
                        case "top":
                        case "left":
                            json[name] = parseInt(value);
                            demo.moveNode(focusid, json.left, json.top);
                            demo.resetLines(focusid, json);
                            break;
                        case "width":
                        case "height":
                            json[name] = parseInt(value);
                            demo.resizeNode(focusid, json.width, json.height);
                            break;
                        case "name":
                            demo.setName(focusid, value, focusType);
                            break;
                        case "M":
                            demo.setLineM(focusid, value);
                            break;
                        case "type":
                            demo.setLineType(focusid, value);
                            break;
                    }
                }
            }
            if (Designer.Data.saveOp == 0) {
                Designer.Common.wfDataToJson();
            }
        }


    };
    Designer.Data = {
        //用于保存的操作:0 add,1 update,2Upgrade。
        saveOp: 1,
        //存档工作流所有被转换Rows后的数据。
        postData: {},
        //模板数据
        template: undefined,
        nodeTemplate: {},
        lineTemplate: {},
        //流程数据
        workflow: undefined,
        //克隆流程数据，用于还原状态
        workflowClone: undefined,
        //存档流程图任务节点的Json数据。
        taskInfo: undefined,
        //地图数据
        mapData: undefined,
        //克隆地图数据，用于还原状态
        mapDataClone: undefined,
        onInit: function (callBack) {
            var that = this;
            AR.Ajax.get("GetDesignerConfig", null, { dm: AR.Utility.queryString("dm"), wid: AR.Utility.queryString("wid"), wiid: AR.Utility.queryString("wiid") }, function (result) {
                that = $.extend(that, result);//赋值
                if (result.workflow) { that.workflowClone = $.extend(true, {}, result.workflow); }
                if (result.mapData) { that.mapDataClone = $.extend(true, {}, result.mapData); }
                if (result.template) {
                    var alist = that.template.Definition.ActivityList;
                    that.nodeTemplate = alist[0];
                    that.lineTemplate = alist[0].TransitionList[0];
                    //移掉节点。
                    that.template.Definition.ActivityList = [];
                    //移掉线。
                    that.nodeTemplate.TransitionList = [];
                }
                callBack && callBack();
            });
        }
    };
    Designer.Map = {
        //鼠标点击的节点id
        focusid: null,
        focusType: null,
        //是否进行任务中
        isSysWorking: false,

        //是否设计模式
        isDesignMode: true,
        map: null,
        mapProperty: {
            width: 900,
            height: 700,
            toolBtns: ["start", "end", "normal", "split", "join", "innersubworkflow", "outersubworkflow", "loopself"],
            haveHead: true,
            headBtns: ["save","reload"],//如果haveHead=true，则定义HEAD区的按钮 "open","new", 
            haveTool: true,
            haveGroup: true,
            //是否开启动撤消操作
            useOperStack: false
        },
        mapRemark: {
            cursor: "选择指针",
            direct: "转换连线",
            start: "提单",
            end: "结束",
            normal: "普通步骤",
            outersubworkflow: "外嵌子流程",
            innersubworkflow: "内嵌子流程",
            join: "聚合结束",
            split: "发散开始",
            loopself: "自循环步骤",
            group: "分组"

        },
        onInit: function () {
            this.isDesignMode = AR.Utility.queryString("dm") != "0";
            this.mapProperty.haveHead = this.mapProperty.haveTool = this.isDesignMode;
            this.mapProperty.width = $(window).width() - (this.isDesignMode ? 320 : 0);
            this.map = new GeFlow($("#map"), this.mapProperty);
            this.regEvent();

        },
        onLoad: function () {
            this.isSysWorking = true;
            this.map.setNodeRemarks(this.mapRemark);
            if (!Designer.Data.workflow) {
                //默认无工具流，创建新工作流。
                this.map.onBtnNewClick();
            }
            else {

                this.map.loadData(Designer.Data.mapData);
            }
            this.isSysWorking = false;
            this.onClickTitle();
        },
        onClickTitle: function () {
            this.focusid = "title";
            this.focusType = "title";
            var wfData = Designer.Data.postData;
            if (wfData.title == undefined) {
                wfData.title = Designer.Common.getRows("title");
            }
            Designer.Grid.refleshGrid(wfData.title);
            document.title = Designer.Data.workflow.Definition.WorkflowName;
        },
        regEvent: function () {
            var that = this;
            var demo = this.map;
            demo.onBtnSaveClick = function () {
                Designer.Common.wfDataToJson();
                var wf = Designer.Data.workflow;
                //加上分组
                var objectJson = demo.exportData();
                if (objectJson.areas != undefined && JSON.stringify(objectJson.areas) != "{}") {
                    wf.Definition.AreaMap = "#" + JSON.stringify(objectJson.areas) + "#";
                }
                else {
                    wf.Definition.AreaMap = "";
                }
                var jsonData = JSON.stringify(wf);
                if (demo.validate()) {
                    //method, objName, data, callback, isShowProgress, dataType
                    AR.Ajax.post("SaveWorkflow", null, { fn: "save", saveOp: Designer.Data.saveOp, json: jsonData }, function (result) {
                        AR.Window.alert(result.msg, null, function () {
                            if (!AR.Utility.queryString("wid") && result.success) {
                                location.href = location.href + "?wid=" + wf.Definition.WorkflowID;
                            }
                        });
                    }, true);
                }

            }
            demo.validate = function () {
                //检测流程的完整性
                var count = 0;

                var toActivityIDs = {};
                var aList = Designer.Data.workflow.Definition.ActivityList;
                for (var i = 0; i < aList.length ; i++) {

                    if (aList[i].ActivityType.toLowerCase() == "end") {
                        count++;
                    }
                    else {
                        if (aList[i].ActivityType.toLowerCase() == "start") {
                            count++;
                        }
                    }
                    var tList = aList[i].TransitionList;
                    if (tList && tList.length > 0) {
                        for (var j = 0; j < tList.length; j++) {
                            var aid = tList[j].ToActivityID;
                            if (!aList.contains(aid, "ActivityID")) {
                                //移除多余的线（节点被删除后留下来的，却看不到）
                                tList.splice(j, 1);
                                j--;
                            }
                            else {
                                toActivityIDs[aid] = 1;
                            }
                        }
                    }
                }
                if (count != 2 || aList.length < 3) {
                    AR.Window.alert("流程必须包含：【提单】和【结束】及其它节点及迁移线。");
                    return false;
                }
                for (var i = 0; i < aList.length; i++) {
                    var aName = aList[i].ActivityName;
                    var aType = aList[i].ActivityType.toLowerCase();
                    if (aType != "start") {
                        if (toActivityIDs[aList[i].ActivityID] != 1) {
                            AR.Window.alert("请确保流程的完整性：【" + aName + "节点】不能单独存在。");
                            return false;
                        }
                        if (aType == "end" && aList[i].TransitionList.length > 0) {
                            AR.Window.alert("请确保流程的完整性：【" + aName + "节点】不能有指向节点。");
                            return false;
                        }
                        if (aList[i].TransitionList.length == 0) {
                            switch (aType) {
                                case "end":
                                case "outersubworkflow":
                                case "innersubworkflow":
                                    break;
                                default:
                                    AR.Window.alert("请确保流程的完整性：【" + aName + "节点】必须有指向节点。");
                                    return false;
                            }
                        }
                    }
                }


                return true;
            }
            demo.onBtnNewClick = function () {
                that.isSysWorking = true;
                demo.clearData();
                Designer.Data.postData = {};
                if (Designer.Data.template) {
                    Designer.Data.workflow = $.extend(true, {}, Designer.Data.template)
                    Designer.Data.workflow.Definition.WorkflowID = demo.guid();
                    demo.setTitle(Designer.Data.workflow.Definition.WorkflowName);
                    that.onClickTitle();
                }
                Designer.Data.saveOp = 0;
                that.isSysWorking = false;
            }
            demo.onFreshClick = function () {
                that.isSysWorking = true;
                demo.clearData();
                Designer.Data.postData = {};
                if (Designer.Data.workflowClone) {
                    Designer.Data.workflow = $.extend(true, {}, Designer.Data.workflowClone);
                    Designer.Data.mapData = $.extend(true, {}, Designer.Data.mapDataClone);
                }
                demo.loadData(Designer.Data.mapData);

                that.onClickTitle();
                that.isSysWorking = false;
            }
            demo.onItemAdd = function (id, type, json) {
                var findwfData = Designer.Common.findwfData;
                var mapToGrid = Designer.Common.mapToGrid;
                var wf = Designer.Data.workflow;
                if (that.isSysWorking) {
                    return true;
                }
                if (type == "node") {
                    if (json.type == "start" || json.type == "end") {
                        for (var i in this.$nodeData) {
                            if (this.$nodeData[i].type == json.type) {
                                AR.Window.alert("该节点只能存在一个！");
                                return false;
                            }
                        }
                    }
                    if (findwfData(id, type, "exists") == undefined) {
                        json.width = 116;
                        json.height = 44;
                        //  node = $.extend(true, {}, wfNodeTemp);
                        var node = $.extend(true, {}, Designer.Common.getNodeTemplate(json.type, Designer.Data.nodeTemplate));
                        node.ActivityID = id;
                        node.StepID = wf.Definition.ActivityList.length + 1;
                        node.WorkflowID = wf.Definition.WorkflowID;
                        node.ActivityType = json.type;
                        wf.Definition.ActivityList.push(node);
                        demo.onItemFocus(id, type);
                        if (json.type == "start") {
                            //json.width=32;
                            //json.height=32;
                            json.name = "提单";
                        }

                        if (json.type == "end") {
                            //json.width=32;
                            //json.height=32;
                            json.name = "结束";
                        }

                        mapToGrid(id, type, json.left, json.top, json.width, json.height, json.name);
                    }
                }
                else if (type == "line") {

                    if (findwfData(id, type, "exists") == undefined) {
                        var wfLineTemp = Designer.Data.lineTemplate;
                        var line = $.extend(true, {}, wfLineTemp);
                        line.TransitionID = id;
                        line.LineType = "sl";
                        line.GroupNum = 1;
                        line.GroupName = "";
                        line.Remark = "";
                        line.FromActivityID = json.from;
                        line.ToActivityID = json.to;
                        //找到节点
                        var nodeSetList = findwfData(json.from, "node").TransitionList;
                        if (nodeSetList == undefined) {
                            nodeSetList = [];
                            nodeSetList.push(line);
                        }
                        else {
                            nodeSetList.push(line);
                        }

                        demo.onItemFocus(id, type);
                        mapToGrid(id, type, json.left, json.top, json.width, json.height, json.name, json.M);

                    }
                }
                return true;
            }
            demo.onItemDel = function (id, type) {
                if (that.isSysWorking) {
                    return true;
                }
                if (!confirm("确认删除?")) { return false; }
                var findwfData = Designer.Common.findwfData;
                var wfData = Designer.Data.postData;
                if (type == "node") {
                    for (var name in demo.$lineData) {
                        if (demo.$lineData[name].to == id) {
                            if (wfData[name]) {
                                delete wfData[name];//删除右侧行数据
                            }
                            findwfData(name, "line", "delete");//删除行数据
                        }
                    }
                }
                if (wfData[id]) {
                    delete wfData[id];//删除右侧行数据
                }
                findwfData(id, type, "delete");//删除行数据
                return true;
            }
            demo.onLineMove = function (id, M) {
                Designer.Common.mapToGrid(id, "line", null, null, null, null, null, M);
                return true;
            }
            demo.onLineSetType = function (id, type) {
                Designer.Common.mapToGrid(id, type, null, null, null, null, null, null);
                return true;
            }
            demo.onItemMove = function (id, type, left, top) {
                Designer.Common.mapToGrid(id, type, left, top, null, null, null, null);
                return true;
            }
            demo.onItemRename = function (id, name, type) {
                Designer.Common.mapToGrid(id, type, null, null, null, null, name, null);
                return true;
            }
            demo.onItemResize = function (id, type, width, height) {
                Designer.Common.mapToGrid(id, type, null, null, width, height, null, null);
                return true;
            }
            demo.onItemFocus = function (id, type) {
                that.focusid = id;
                that.focusType = type;
                var wfData = Designer.Data.postData;
                if (wfData[id] == undefined) {
                    wfData[id] = Designer.Common.getRows(type, id);
                }
                Designer.Grid.refleshGrid(wfData[id]);

                return true;
            }
            demo.onTitleClick = function () {

                that.onClickTitle();
            }
        }

    };
    Designer.Grid = {
        //表格对象
        grid: undefined,
        editIndex: 0,
        editValueIsJson: false,
        editValue: null,
        getRows: function () {
            return this.grid.propertygrid("getData").rows;
        },
        getRow: function (name) {
            return this.getRows().get("name", name);
        },

        formatName: function (value, row, index) {
            switch (value) {
                case "WorkflowID":
                    return "工作流ID";
                case "WorkflowName":
                    return "工作流名称";
                case "ActivityID":
                    return "步骤ID";
                case "ActivityName":
                    return "步骤名称";
                case "TransitionID":
                    return "迁移ID";
                case "FromActivityID":
                    return "出发步骤ID";
                case "ToActivityID":
                    return "到达步骤ID";
                case "ActivityType":
                    return "步骤类型";
                case "PositionX":
                    return "X座标";
                case "PositionY":
                    return "Y座标";
                case "Width":
                    return "宽度";
                case "Height":
                    return "高度";

                case "Version":
                    return "版本号";
                case "Creator":
                    return "创建者";
                case "Creator":
                    return "创建者";
                case "IsDeleted":
                    return "是否已删除";
                case "Updator":
                    return "最近修改者";
                case "CreateTime":
                    return "创建时间";
                case "UpdateTime":
                    return "最近修改时间";
                case "IsShowFlowMap":
                    return "是否显示流程图";
                case "IsHistoryActorPriority":
                    return "历史参与者优先";

                case "IsEnableWithdraw":
                    return "是否允许撤回";
                case "IsEnableInvalid":
                    return "是否允许作废";
                case "IsEnableTransmit":
                    return "是否允许转交";
                case "IsEnableReject":
                    return "是否允许退回";
                case "IsEnableCirculate":
                    return "是否允许传阅";
                case "IsShowOpinion":
                    return "开启表单审核意见";
                case "RejectActivity":
                    return "任意历史可退步骤";
                case "IsActorSpread":
                    return "处理人是否默认展开";
                case "StepID":
                    return "步骤顺序";
                case "IsEditForm":
                    return "表单是否可编辑";
                case "IsOpinionRequire":
                    return "审核意见是否必填";
                case "ActorParser":
                    return "参与者类型";
                case "SubAppID":
                    return "子流程AppID";
                case "SubAssembly":
                    return "子流程实现类";
                case "RespondType":
                    return "参与人数";
                case "CirculateType":
                    return "传阅方式";
                case "Updator":
                    return "最近修改者";
                case "RejectType":
                    return "退回方式";

                    ;
                case "ActorParamter":
                    return "参与者设置";
                case "CirculateActor":
                    return "自动传阅用户";
                case "IsDeleted":
                    return "是否被删除";
                case "JoinType":
                    return "聚合类型";
                case "SplitType":
                    return "发散类型";
                case "LineType":
                    return "线类型";
                case "PostionM":
                    return "拆线位置";
                case "IsJoinRequire":
                    return "是否必参与迁移";
                case "Remark":
                    return "备注";
                case "Description":
                    return "描述";
                case "GroupName":
                    return "聚合分组名";
                case "GroupNum":
                    return "该组最少到达分支数";


            }
            return value;
        },
        formatValue: function (value, row, index) {
            if (value && typeof value == 'object') {
                if (row.name == "ActorParamter") {
                    if (row.value.ActorParserType == "OrgActor") {
                        return row.value.NameForBaseOn;
                    }
                    return row.value.NameForActorParser;
                }
                return row.value[row.name];
            }
            else {
                if (row.value != undefined && row.value != null) {
                    switch (row.value.toString()) {
                        case "true":
                            return "是";
                        case "false":
                            return "否";
                    }


                }
                if (row.name == "LineType") {
                    switch (row.value) {
                        case "sl": return "直线";
                        case "lr": return "折线[左右移动]";
                        case "tb": return "折线[上下移动]";
                    }
                }
                else if (row.name == "ActivityType") {

                    switch (row.value.toLowerCase()) {
                        //步骤类型
                        case "start": return "开始步骤";
                        case "end": return "结束步骤";
                        case "normal": return "普通审批步骤";
                        case "split": return "发散步骤";
                        case "join": return "聚合步骤";
                        case "outersubworkflow": return "外嵌子流程";
                        case "innersubworkflow": return "内嵌子流程";
                        case "loopself": return "自循环";

                    }
                }
                else if (row.name == "JoinType") {
                    switch (row.value) {
                        case "JoinAll": return "全到聚合";
                        case "JoinOne": return "单到聚合";
                        case "JoinAny": return "条件聚合";
                    }
                }
                else if (row.name == "SplitType") {
                    switch (row.value) {
                        case "SplitAll": return "全选";
                        case "SplitOne": return "单选";
                        case "SplitAny": return "多选";

                    }
                }
                else if (row.name == "RespondType") {
                    switch (row.value) {
                        //参与人数
                        case "One": return "单人";
                        case "Anyone": return "多人";
                        case "All": return "所有人";
                    }
                }
                else if (row.name == "RejectType") {
                    switch (row.value) {
                        //退回类型
                        case "None": return "不可退回";
                        case "OnlyStart": return "仅可退回提单";
                        case "OnlyPreActivity": return "仅可退上一步";
                        case "OnlyStartOrPreActivity": return "仅可退回提单或上一步";
                        case "AnyHistoryActivity": return "任意历史可退步骤";
                    }
                }
                else if (row.name == "ActorParser") {
                    switch (row.value) {
                        //参与者类型
                        case "CurrentUserActor": return "当前用户参与者";
                        case "AssignActor": return "指定用户";
                        case "RoleActor": return "角色参与者";
                        case "ParentOrgRoleActor": return "上级部门角色参与者";
                        case "SubOrgRoleActor": return "下级部门角色参与者";
                        case "HistoryActivityActor": return "历史审批步骤参与者";
                        case "OrgActor": return "部门参与者";
                        case "AssemblyActor": return "自定义扩展类参与者";
                        case "SqlActor": return "SQL参与者";
                    }
                }
                else if (row.name == "CirculateType") {
                    switch (row.value) {
                        //传阅
                        case "None": return "不允许传阅";
                        case "Auto": return "仅自动传阅";
                        case "Manual": return "仅手动传阅";
                        case "Both": return "手自一体";
                    }
                }
            }
            return value;
        },

        refleshGrid: function (rows) {
            if (this.grid) {
                this.grid.propertygrid({
                    data: rows,
                    collapseGroup: 1
                });
                // this.grid.propertygrid("collapseGroup",0);
            }
        },
        getEditor: function (name, row) {

            switch (name) {
                case "WorkflowID":
                case "ActivityID":
                case "TransitionID":

                case "FromActivityID":
                case "ToActivityID":
                case "ActorParser":
                case "ActivityType":
                case "UpdateTime":
                case "Creator":
                case "Updator":

                case "IsDeleted":
                    return "";


                case "CreateTime":
                    return "datetimebox";
                case "SubAppID":
                    return {
                        type: 'dialog',
                        options: {
                            dialog: 'WF_App'
                        }
                    };
                case "CirculateActor":
                    return {
                        type: 'dialog',
                        options: {
                            dialog: 'Sys_User',
                            multiple: true
                        }
                    };
                case "LineType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 90,
                            value: "sl",
                            data: [
                                { "name": "直线", "value": 'sl' },
                                { "name": "折线[左右移动]", "value": 'lr' },
                                { "name": "折线[上下移动]", "value": 'tb' }
                            ]
                        }
                    };

                case "RespondType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 90,
                            value: "anyone",
                            data: [
                                { "name": "单人", "value": 'One' },
                                { "name": "多人", "value": 'Anyone' },
                                { "name": "所有人", "value": 'All' },
                            ]
                        }
                    };
                case "RejectType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 150,
                            value: "OnlyStart",
                            data: [
                                { "name": "不可退回", "value": 'None' },
                                { "name": "仅退回提单", "value": 'OnlyStart' },
                                { "name": "仅退上一步", "value": 'OnlyPreActivity' },
                                { "name": "仅退回提单或上一步", "value": 'OnlyStartOrPreActivity' },
                                { "name": "任意历史可退步骤", "value": 'AnyHistoryActivity' },

                            ]
                        }
                    };

                case "JoinType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 120,
                            value: "JoinOne",
                            data: [
                               { "name": "单到聚合", "value": 'JoinOne' },
                               { "name": "条件聚合", "value": 'JoinAny' },
                               { "name": "全到聚合", "value": 'JoinAll' }
                            ]
                        }
                    };
                case "CirculateType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 100,
                            value: "0",
                            data: [
                               { "name": "不允许传阅", "value": 'None' },
                               { "name": "仅自动传阅", "value": 'Auto' },
                               { "name": "仅手动传阅", "value": 'Manual' },
                               { "name": "手自一体", "value": 'Both' }



                            ]
                        }
                    };
                case "SplitType":
                    return {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 90,
                            value: "SplitOne",
                            data: [
                                { "name": "单选", "value": 'SplitOne' },
                                { "name": "多选", "value": 'SplitAny' },
                                { "name": "全选", "value": 'SplitAll' },



                            ]
                        }
                    };

                case "ActorParamter":
                    return {
                        type: 'window',
                        options: {
                            title: "参与者设置",
                            url: '/WF/Designer/ActorParamterEdit.html',
                            width: 750,
                            height: 450,
                            otherParm: row["WorkflowID"]
                        }
                    }

                case "IsShowFlowMap":
                case "IsEnable":
                case "IsPowerEnable":
                case "IsEditForm":
                case "IsOpinionRequire":
                case "IsEnableTransmit":
                case "IsEnableCirculate":
                case "IsEnableTransmit":
                case "IsShowOpinion":
                case "IsEnableReject":
                case "IsEnableWithdraw":
                case "IsEnableInvalid":
                case "IsActorSpread":
                case "IsHistoryActorPriority":
                case "IsJoinRequire":

                    return {
                        type: 'checkbox',
                        options: {
                            on: "true",
                            off: "false"
                        }
                    };
                case "":
                    break;
            }
            return "text";
        },
        endEdit: function () {
            this.grid.propertygrid("endEdit", this.editIndex);

            //this.grid.propertygrid("refreshRow", this.editIndex);
        },

        onInit: function () {
            var that = this;
            this.grid = $('#grid');
            var formatName = this.formatName;
            var formatValue = this.formatValue;
            this.grid.propertygrid({
                width: 298,
                height: 700,
                showGroup: true,
                //scrollbarSize: 0,
                columns: [[
                        { field: 'name', title: '名称', width: 100, resizable: true, formatter: formatName },
                        { field: 'value', title: '值', width: 120, resizable: false, formatter: formatValue }
                ]],

                onBeforeEdit: function (rowIndex, rowData) {
                    Designer.Grid.editIndex = rowIndex;
                },
                onAfterEdit: function (rowIndex, rowData, changes) {
                    if (rowData.editor.type == "window") {
                        rowData.value = rowData.editor.options.value;
                        if (rowData.name == "ActorParamter") {
                            var rows = that.getRows();
                            var row = that.getRow("ActorParser");
                            row.value = rowData.value.ActorParserType;
                            that.refleshGrid(rows);

                        }
                    }
                    if (changes.value != undefined) {
                        if (Designer.Common.isGridAttrName(rowData.name)) {

                            var esValue = changes.value;
                            if (esValue) {
                                esValue = esValue.replace(/=/g, '＝').replace(/</g, '＜').replace(/>/g, '＞');
                            }
                            Designer.Common.gridToMap(rowData, esValue);
                            return;
                        }

                        if (that.editValueIsJson) {
                            rowData.value = changes.value;
                        }
                    }
                }

            });

        }
    };
    Designer.Data.onInit(function () {
        //工作流初始化
        $("body").attr("class", "");//清除样式，避免无法出现下拉框。
        Designer.Map.onInit();
        if (Designer.Map.isDesignMode) {
            Designer.Grid.onInit();
        }
        else {
            $("#east").attr("width", "1px");
        }
        Designer.Map.onLoad();
    });

})(window);