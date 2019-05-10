/// <reference path="/Style/JS/Aries.Loader.js" />
function GeFlow(bgDiv, property) {
    if (navigator.userAgent.indexOf("MSIE 8.0") > 0 || navigator.userAgent.indexOf("MSIE 7.0") > 0 || navigator.userAgent.indexOf("MSIE 6.0") > 0) {
        GeFlow.prototype.useSVG = "";
    } else {
        GeFlow.prototype.useSVG = "1";
    }
    this.$id = bgDiv.attr("id");
    this.$bgDiv = bgDiv;
    this.$bgDiv.addClass("GeFlow");
    if (!property.haveHead) {
        this.$bgDiv.css("background", "none");
        this.$bgDiv.css("background-image", "none");
    }
    var width = (property.width || 800);
    var height = (property.height || 500);
    this.$bgDiv.css({
        width: width + "px",
        height: height + "px"
    });
    this.$tool = null;
    this.$head = null;
    this.$title = null;
    this.$nodeRemark = {};
    this.$nowType = "cursor";
    this.$lineData = {};
    this.$lineCount = 0;
    this.$nodeData = {};
    this.$nodeCount = 0;
    this.$areaData = {};
    this.$areaCount = 0;
    this.$lineDom = {};
    this.$nodeDom = {};
    this.$areaDom = {};
    this.$max = property.initNum || 1;
    this.$focus = "";
    this.$cursor = "default";
    this.$editable = false;
    var headHeight = 0;
    var tmp = "";
    if (property.haveHead) {
        tmp = "<div class='GeFlow_head'><label title='" + (property.initLabelText || "新建工作流") + "'>" + (property.initLabelText || "新建工作流") + "</label><span></span>";
        for (var x = 0; x < property.headBtns.length; ++x) {
            var name = property.headBtns[x];
            if (!property.useOperStack && (name == "undo" || name == "redo")) { continue; }
            tmp += "<a href='javascript:void(0)' class='GeFlow_head_btn'><b class='ico_" + property.headBtns[x] + "'></b></a>"
        };
        tmp += "<span></span></div>";
        this.$head = $(tmp);
        this.$bgDiv.append(this.$head);
        headHeight = 32;


        this.onTitleClick = null;
        this.onBtnNewClick = null;
        this.onBtnOpenClick = null;
        this.onBtnSaveClick = null;
        this.onFreshClick = null;

        if (property.headBtns) {
            this.$head.on("click", {
                inthis: this
            }, function (e) {
                if (!e) e = window.event;
                var tar = e.target;
                var This = e.data.inthis;
                if (tar.tagName == "DIV" || tar.tagName == "SPAN") return;
                if (tar.tagName == "LABEL") { if (This.onTitleClick != null) This.onTitleClick(); return; }
                else if (tar.tagName == "a") tar = tar.childNode[0];


                switch ($(tar).attr("class")) {
                    case "ico_new":
                        if (This.onBtnNewClick != null) This.onBtnNewClick();
                        break;
                    case "ico_open":
                        if (This.onBtnOpenClick != null) This.onBtnOpenClick();
                        break;
                    case "ico_save":
                        if (This.onBtnSaveClick != null) This.onBtnSaveClick();
                        break;
                    case "ico_undo":
                        property.useOperStack && This.undo();
                        break;
                    case "ico_redo":
                        property.useOperStack && This.redo();
                        break;
                    case "ico_reload":
                        if (This.onFreshClick != null) This.onFreshClick();
                        break
                }
            })
        }
    };
    var toolWidth = 0;
    if (property.haveTool) {
        this.$bgDiv.append("<div class='GeFlow_tool'" + (property.haveHead ? "" : " style='margin-top:3px'") + "><div style='height:" + (height - headHeight - (property.haveHead ? 7 : 10)) + "px' class='GeFlow_tool_div'></div></div>");
        this.$tool = this.$bgDiv.find(".GeFlow_tool div");
        this.$tool.append("<a href='javascript:void(0)' class='GeFlow_tool_btndown' id='" + this.$id + "_btn_cursor'><b class='ico_cursor'/></a><a href='javascript:void(0)' class='GeFlow_tool_btn' id='" + this.$id + "_btn_direct'><b class='ico_direct'/></a>");
        if (property.toolBtns && property.toolBtns.length > 0) {
            tmp = "<span/>";
            for (var i = 0; i < property.toolBtns.length; ++i) {
                tmp += "<a href='javascript:void(0)' id='" + this.$id + "_btn_" + property.toolBtns[i] + "' class='GeFlow_tool_btn'><b class='ico_" + property.toolBtns[i] + "'/></a>";
            };
            this.$tool.append(tmp)
        };
        if (property.haveGroup) this.$tool.append("<span/><a href='javascript:void(0)' class='GeFlow_tool_btn' id='" + this.$id + "_btn_group'><b class='ico_group'/></a>");
        toolWidth = 43;
        this.$nowType = "cursor";
        this.$tool.on("click", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            var tar;
            switch (e.target.tagName) {
                case "SPAN":
                    return false;
                case "DIV":
                    return false;
                case "B":
                    tar = e.target.parentNode;
                    break;
                case "A":
                    tar = e.target
            };
            var type = $(tar).attr("id").split("btn_")[1];
            e.data.inthis.switchToolBtn(type);
            return false
        });
        this.$editable = true;
    };
    width = width - toolWidth - 8;
    height = height - headHeight - (property.haveHead ? 5 : 8);
    this.$bgDiv.append("<div class='GeFlow_work' style='width:" + (width) + "px;height:" + (height) + "px;" + (property.haveHead ? "" : "margin-top:3px") + "'></div>");
    var nobackground = "";
    if (!property.haveHead) {
        nobackground = "background:none;background-image:none;";
    }
    this.$workArea = $("<div class='GeFlow_work_inner' style='width:" + width * 2 + "px;height:" + height * 2 + "px;" + nobackground + "'></div>").attr({
        "unselectable": "on",
        "onselectstart": 'return false',
        "onselect": 'document.selection.empty()'
    });
    this.$bgDiv.children(".GeFlow_work").append(this.$workArea);
    this.$draw = null;
    this.initDraw("draw_" + this.$id, width, height);
    this.$group = null;
    this.initGroup(width, height);
    if (this.$editable) {
        this.$workArea.on("click", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            if (!e.data.inthis.$editable) return;
            var type = e.data.inthis.$nowType;
            if (type == "cursor") {
                var t = $(e.target);
                var n = t.prop("tagName");
                if (n == "svg" || (n == "DIV" && t.prop("class").indexOf("GeFlow_work") > -1) || n == "LABEL") e.data.inthis.blurItem();
                return
            } else if (type == "direct" || type == "group") return;
            var X, Y;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(this);
            X = ev.x - t.left + this.parentNode.scrollLeft;
            Y = ev.y - t.top + this.parentNode.scrollTop;
            e.data.inthis.addNode(GeFlow.prototype.guid(), {
                name: e.data.inthis.$nodeRemark[e.data.inthis.$nowType] + e.data.inthis.$max,
                left: X,
                top: Y,
                type: e.data.inthis.$nowType
            });
            e.data.inthis.$max++
        });
        this.$workArea.mousemove({
            inthis: this
        }, function (e) {
            if (e.data.inthis.$nowType != "direct") return;
            var lineStart = $(this).data("lineStart");
            if (!lineStart) return;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(this);
            var X, Y;
            X = ev.x - t.left + this.parentNode.scrollLeft;
            Y = ev.y - t.top + this.parentNode.scrollTop;
            var line = document.getElementById("GeFlow_tmp_line");
            if (GeFlow.prototype.useSVG != "") {
                line.childNodes[0].setAttribute("d", "M " + lineStart.x + " " + lineStart.y + " L " + X + " " + Y);
                line.childNodes[1].setAttribute("d", "M " + lineStart.x + " " + lineStart.y + " L " + X + " " + Y);
                if (line.childNodes[1].getAttribute("marker-end") == "url(\"#arrow2\")") line.childNodes[1].setAttribute("marker-end", "url(#arrow3)");
                else line.childNodes[1].setAttribute("marker-end", "url(#arrow2)")
            } else line.points.value = lineStart.x + "," + lineStart.y + " " + X + "," + Y
        });
        this.$workArea.mouseup({
            inthis: this
        }, function (e) {
            if (e.data.inthis.$nowType != "direct") return;
            $(this).css("cursor", "auto").removeData("lineStart");
            var tmp = document.getElementById("GeFlow_tmp_line");
            if (tmp) e.data.inthis.$draw.removeChild(tmp)
        });
        this.initWorkForNode();
        this.$ghost = $("<div class='rs_ghost'></div>").attr({
            "unselectable": "on",
            "onselectstart": 'return false',
            "onselect": 'document.selection.empty()'
        });
        this.$bgDiv.append(this.$ghost);
        this.$textArea = $("<textarea></textarea>");
        this.$bgDiv.append(this.$textArea);
        this.$lineMove = $("<div class='GeFlow_line_move' style='display:none'></div>");
        this.$workArea.append(this.$lineMove);
        this.$lineMove.on("mousedown", {
            inthis: this
        }, function (e) {
            var lm = $(this);
            lm.css({
                "background-color": "#333"
            });
            var This = e.data.inthis;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            var X, Y;
            X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
            Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
            var p = This.$lineMove.position();
            var vX = X - p.left,
                vY = Y - p.top;
            var isMove = false;
            document.onmousemove = function (e) {
                if (!e) e = window.event;
                var ev = GeFlow.prototype.mousePosition(e);
                var ps = This.$lineMove.position();
                X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
                Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
                if (This.$lineMove.data("type") == "lr") {
                    X = X - vX;
                    if (X < 0) X = 0;
                    else if (X > This.$workArea.width()) X = This.$workArea.width();
                    This.$lineMove.css({
                        left: X + "px"
                    })
                } else if (This.$lineMove.data("type") == "tb") {
                    Y = Y - vY;
                    if (Y < 0) Y = 0;
                    else if (Y > This.$workArea.height()) Y = This.$workArea.height();
                    This.$lineMove.css({
                        top: Y + "px"
                    })
                };
                isMove = true
            };
            document.onmouseup = function (e) {
                if (isMove) {
                    var p = This.$lineMove.position();
                    if (This.$lineMove.data("type") == "lr") This.setLineM(This.$lineMove.data("tid"), p.left + 3);
                    else if (This.$lineMove.data("type") == "tb") This.setLineM(This.$lineMove.data("tid"), p.top + 3)
                };
                This.$lineMove.css({
                    "background-color": "transparent"
                });
                if (This.$focus == This.$lineMove.data("tid")) {
                    This.focusItem(This.$lineMove.data("tid"))
                };
                document.onmousemove = null;
                document.onmouseup = null
            }
        });
        this.$lineOper = $("<div class='GeFlow_line_oper' style='display:none'><b class='b_l1'></b><b class='b_l2'></b><b class='b_l3'></b><b class='b_x'></b></div>");
        this.$workArea.append(this.$lineOper);
        this.$lineOper.on("click", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            if (e.target.tagName != "B") return;
            var This = e.data.inthis;
            var id = $(this).data("tid");
            switch ($(e.target).attr("class")) {
                case "b_x":
                    This.delLine(id);
                    this.style.display = "none";
                    break;
                case "b_l1":
                    This.setLineType(id, "lr");
                    break;
                case "b_l2":
                    This.setLineType(id, "tb");
                    break;
                case "b_l3":
                    This.setLineType(id, "sl");
                    break
            }
        });

        this.onItemAdd = null;
        this.onItemDel = null;
        this.onItemMove = null;
        this.onItemRename = null;
        this.onItemFocus = null;
        this.onItemBlur = null;
        this.onItemResize = null;
        this.onLineMove = null;
        this.onLineSetType = null;
        this.onItemMark = null;
        if (property.useOperStack) {
            this.$undoStack = [];
            this.$redoStack = [];
            this.$isUndo = 0;
            this.pushOper = function (funcName, paras) {
                var len = this.$undoStack.length;
                if (this.$isUndo == 1) {
                    this.$redoStack.push([funcName, paras]);
                    this.$isUndo = false;
                    if (this.$redoStack.length > 40) this.$redoStack.shift()
                } else {
                    this.$undoStack.push([funcName, paras]);
                    if (this.$undoStack.length > 40) this.$undoStack.shift();
                    if (this.$isUndo == 0) {
                        this.$redoStack.splice(0, this.$redoStack.length)
                    };
                    this.$isUndo = 0
                }
            };
            this.pushExternalOper = function (func, jsonPara) {
                this.pushOper("externalFunc", [func, jsonPara])
            };
            this.undo = function () {
                if (this.$undoStack.length == 0) return;
                var tmp = this.$undoStack.pop();
                this.$isUndo = 1;
                if (tmp[0] == "externalFunc") {
                    tmp[1][0](tmp[1][1])
                } else {
                    switch (tmp[1].length) {
                        case 0:
                            this[tmp[0]]();
                            break;
                        case 1:
                            this[tmp[0]](tmp[1][0]);
                            break;
                        case 2:
                            this[tmp[0]](tmp[1][0], tmp[1][1]);
                            break;
                        case 3:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2]);
                            break;
                        case 4:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2], tmp[1][3]);
                            break;
                        case 5:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2], tmp[1][3], tmp[1][4]);
                            break
                    }
                }
            };
            this.redo = function () {
                if (this.$redoStack.length == 0) return;
                var tmp = this.$redoStack.pop();
                this.$isUndo = 2;
                if (tmp[0] == "externalFunc") {
                    tmp[1][0](tmp[1][1])
                } else {
                    switch (tmp[1].length) {
                        case 0:
                            this[tmp[0]]();
                            break;
                        case 1:
                            this[tmp[0]](tmp[1][0]);
                            break;
                        case 2:
                            this[tmp[0]](tmp[1][0], tmp[1][1]);
                            break;
                        case 3:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2]);
                            break;
                        case 4:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2], tmp[1][3]);
                            break;
                        case 5:
                            this[tmp[0]](tmp[1][0], tmp[1][1], tmp[1][2], tmp[1][3], tmp[1][4]);
                            break
                    }
                }
            }
        }
    }
};
GeFlow.prototype = {
    useSVG: "",
    getSvgMarker: function (id, color) {
        var m = document.createElementNS("http://www.w3.org/2000/svg", "marker");
        m.setAttribute("id", id);
        m.setAttribute("viewBox", "0 0 6 6");
        m.setAttribute("refX", 5);
        m.setAttribute("refY", 3);
        m.setAttribute("markerUnits", "strokeWidth");
        m.setAttribute("markerWidth", 6);
        m.setAttribute("markerHeight", 6);
        m.setAttribute("orient", "auto");
        var path = document.createElementNS("http://www.w3.org/2000/svg", "path");
        path.setAttribute("d", "M 0 0 L 6 3 L 0 6 z");
        path.setAttribute("fill", color);
        path.setAttribute("stroke-width", 0);
        m.appendChild(path);
        return m
    }, initDraw: function (id, width, height) {
        var elem;
        if (GeFlow.prototype.useSVG != "") {
            this.$draw = document.createElementNS("http://www.w3.org/2000/svg", "svg");
            this.$workArea.prepend(this.$draw);
            var defs = document.createElementNS("http://www.w3.org/2000/svg", "defs");
            this.$draw.appendChild(defs);
            defs.appendChild(GeFlow.prototype.getSvgMarker("arrow1", "#15428B"));
            defs.appendChild(GeFlow.prototype.getSvgMarker("arrow2", "#ff3300"));
            defs.appendChild(GeFlow.prototype.getSvgMarker("arrow3", "#ff3300"))
        } else {
            this.$draw = document.createElement("v:group");
            this.$draw.coordsize = width * 2 + "," + height * 2;
            this.$workArea.prepend("<div class='GeFlow_work_vml' style='position:relative;width:" + width * 2 + "px;height:" + height * 2 + "px'></div>");
            this.$workArea.children("div")[0].insertBefore(this.$draw, null)
        };
        this.$draw.id = id;
        this.$draw.style.width = width * 2 + "px";
        this.$draw.style.height = +height * 2 + "px";
        var tmpClk = null;
        if (GeFlow.prototype.useSVG != "") tmpClk = "g";
        else tmpClk = "PolyLine";
        $(this.$draw).delegate(tmpClk, "click", {
            inthis: this
        }, function (e) {
            e.data.inthis.focusItem(this.id, true)
        });
        if (this.$editable) $(this.$draw).delegate(tmpClk, "dblclick", {
            inthis: this
        }, function (e) {
            var oldTxt, x, y, from, to;
            var This = e.data.inthis;
            if (GeFlow.prototype.useSVG != "") {
                oldTxt = this.childNodes[2].textContent;
                from = this.getAttribute("from").split(",");
                to = this.getAttribute("to").split(",")
            } else {
                oldTxt = this.childNodes[1].innerHTML;
                var n = this.getAttribute("fromTo").split(",");
                from = [n[0], n[1]];
                to = [n[2], n[3]]
            }; if (This.$lineData[this.id].type == "lr") {
                from[0] = This.$lineData[this.id].M;
                to[0] = from[0]
            } else if (This.$lineData[this.id].type == "tb") {
                from[1] = This.$lineData[this.id].M;
                to[1] = from[1]
            };
            x = (parseInt(from[0], 10) + parseInt(to[0], 10)) / 2 - 60;
            y = (parseInt(from[1], 10) + parseInt(to[1], 10)) / 2 - 12;
            var t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$textArea.val(oldTxt).css({
                display: "block",
                width: 120,
                height: 14,
                left: t.left + x - This.$workArea[0].parentNode.scrollLeft,
                top: t.top + y - This.$workArea[0].parentNode.scrollTop
            }).data("id", This.$focus).focus();
            This.$workArea.parent().one("mousedown", function (e) {
                This.setName(This.$textArea.data("id"), This.$textArea.val(), "line");
                This.$textArea.val("").removeData("id").hide()
            })
        })
    }, initGroup: function (width, height) {
        this.$group = $("<div class='GeFlow_work_group' style='width:" + width * 2 + "px;height:" + height * 2 + "px'></div>");
        this.$workArea.prepend(this.$group);
        if (!this.$editable) return;
        this.$group.on("mousedown", {
            inthis: this
        }, function (e) {
            var This = e.data.inthis;
            if (This.$nowType != "group") return;
            if (This.$textArea.css("display") == "block") {
                This.setName(This.$textArea.data("id"), This.$textArea.val(), "area");
                This.$textArea.val("").removeData("id").hide();
                return false
            };
            if (!e) e = window.event;
            var cursor = $(e.target).css("cursor");
            var id = e.target.parentNode;
            switch (cursor) {
                case "nw-resize":
                    id = id.parentNode;
                    break;
                case "w-resize":
                    id = id.parentNode;
                    break;
                case "n-resize":
                    id = id.parentNode;
                    break;
                case "move":
                    break;
                default:
                    return
            };
            id = id.id;
            var hack = 1;
            if (navigator.userAgent.indexOf("8.0") != -1) hack = 0;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$ghost.css({
                display: "block",
                width: This.$areaData[id].width - 2 + "px",
                height: This.$areaData[id].height - 2 + "px",
                top: This.$areaData[id].top + t.top - This.$workArea[0].parentNode.scrollTop + hack + "px",
                left: This.$areaData[id].left + t.left - This.$workArea[0].parentNode.scrollLeft + hack + "px",
                cursor: cursor
            });
            var X, Y;
            X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
            Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
            if (cursor != "move") {
                var vX = (This.$areaData[id].left + This.$areaData[id].width) - X;
                var vY = (This.$areaData[id].top + This.$areaData[id].height) - Y
            } else {
                var vX = X - This.$areaData[id].left;
                var vY = Y - This.$areaData[id].top
            };
            var isMove = false;
            This.$ghost.css("cursor", cursor);
            document.onmousemove = function (e) {
                if (!e) e = window.event;
                var ev = GeFlow.prototype.mousePosition(e);
                if (cursor != "move") {
                    X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft - This.$areaData[id].left + vX;
                    Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop - This.$areaData[id].top + vY;
                    if (X < 200) X = 200;
                    if (Y < 100) Y = 100;
                    switch (cursor) {
                        case "nw-resize":
                            This.$ghost.css({
                                width: X - 2 + "px",
                                height: Y - 2 + "px"
                            });
                            break;
                        case "w-resize":
                            This.$ghost.css({
                                width: X - 2 + "px"
                            });
                            break;
                        case "n-resize":
                            This.$ghost.css({
                                height: Y - 2 + "px"
                            });
                            break
                    }
                } else {
                    X = ev.x - vX;
                    Y = ev.y - vY;
                    if (X < t.left - This.$workArea[0].parentNode.scrollLeft) X = t.left - This.$workArea[0].parentNode.scrollLeft;
                    else if (X + This.$workArea[0].parentNode.scrollLeft + This.$areaData[id].width > t.left + This.$workArea.width()) X = t.left + This.$workArea.width() - This.$workArea[0].parentNode.scrollLeft - This.$areaData[id].width;
                    if (Y < t.top - This.$workArea[0].parentNode.scrollTop) Y = t.top - This.$workArea[0].parentNode.scrollTop;
                    else if (Y + This.$workArea[0].parentNode.scrollTop + This.$areaData[id].height > t.top + This.$workArea.height()) Y = t.top + This.$workArea.height() - This.$workArea[0].parentNode.scrollTop - This.$areaData[id].height;
                    This.$ghost.css({
                        left: X + hack + "px",
                        top: Y + hack + "px"
                    })
                };
                isMove = true
            };
            document.onmouseup = function (e) {
                This.$ghost.empty().hide();
                document.onmousemove = null;
                document.onmouseup = null;
                if (!isMove) return;
                if (cursor != "move") This.resizeArea(id, This.$ghost.outerWidth(), This.$ghost.outerHeight());
                else This.moveArea(id, X + This.$workArea[0].parentNode.scrollLeft - t.left, Y + This.$workArea[0].parentNode.scrollTop - t.top)
            }
        });
        this.$group.on("dblclick", {
            inthis: this
        }, function (e) {
            var This = e.data.inthis;
            if (This.$nowType != "group") return;
            if (!e) e = window.event;
            if (e.target.tagName != "LABEL") return false;
            var oldTxt = e.target.innerHTML;
            var p = e.target.parentNode;
            var x = parseInt(p.style.left, 10) + 18,
                y = parseInt(p.style.top, 10) + 1;
            var t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$textArea.val(oldTxt).css({
                display: "block",
                width: 100,
                height: 14,
                left: t.left + x - This.$workArea[0].parentNode.scrollLeft,
                top: t.top + y - This.$workArea[0].parentNode.scrollTop
            }).data("id", p.id).focus();
            This.$workArea.parent().one("mousedown", function (e) {
                if (This.$textArea.css("display") == "block") {
                    This.setName(This.$textArea.data("id"), This.$textArea.val(), "area");
                    This.$textArea.val("").removeData("id").hide()
                }
            });
            return false
        });
        this.$group.on("click", {
            inthis: this
        }, function (e) {
            var This = e.data.inthis;
            if (This.$nowType != "group") return;
            if (!e) e = window.event;
            switch ($(e.target).attr("class")) {
                case "rs_close":
                    This.delArea(e.target.parentNode.parentNode.id);
                    return false;
                case "bg":
                    return false
            };
            switch (e.target.tagName) {
                case "LABEL":
                    return false;
                case "B":
                    var id = e.target.parentNode.id;
                    switch (This.$areaData[id].color) {
                        case "red":
                            This.setAreaColor(id, "yellow");
                            break;
                        case "yellow":
                            This.setAreaColor(id, "blue");
                            break;
                        case "blue":
                            This.setAreaColor(id, "green");
                            break;
                        case "green":
                            This.setAreaColor(id, "red");
                            break
                    };
                    return false
            };
            var X, Y;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(this);
            X = ev.x - t.left + this.parentNode.parentNode.scrollLeft;
            Y = ev.y - t.top + this.parentNode.parentNode.scrollTop;
            var color = ["red", "yellow", "blue", "green"];
            e.data.inthis.addArea(GeFlow.prototype.guid(), {
                name: "Group" + e.data.inthis.$max,
                left: X,
                top: Y,
                color: color[e.data.inthis.$max % 4],
                width: 200,
                height: 100
            });
            e.data.inthis.$max++;
            return false
        })
    }, setNodeRemarks: function (remark) {
        if (this.$tool == null) return;
        this.$tool.children("a").each(function () {
            this.title = remark[$(this).attr("id").split("btn_")[1]]
        });
        this.$nodeRemark = remark
    }, switchToolBtn: function (type) {
        this.$tool.children("#" + this.$id + "_btn_" + this.$nowType).attr("class", "GeFlow_tool_btn");
        if (this.$nowType == "group") {
            this.$workArea.prepend(this.$group);
            for (var key in this.$areaDom) this.$areaDom[key].addClass("lock").children("div:eq(1)").css("display", "none")
        };
        this.$nowType = type;
        this.$tool.children("#" + this.$id + "_btn_" + type).attr("class", "GeFlow_tool_btndown");
        if (this.$nowType == "group") {
            this.blurItem();
            this.$workArea.append(this.$group);
            for (var key in this.$areaDom) this.$areaDom[key].removeClass("lock").children("div:eq(1)").css("display", "")
        };
        if (this.$textArea.css("display") == "none") this.$textArea.removeData("id").val("").hide()
    }, addNode: function (id, json) {
        if (this.onItemAdd != null && !this.onItemAdd(id, "node", json)) return;
        if (this.$undoStack) {
            this.pushOper("delNode", [id])
        };
        var mark = json.history ? " item_history" : (json.mark ? " item_mark" : "");
        //if (json.type != "start" && json.type != "end") {

        json.width = json.width ? json.width : 116;
        json.height = json.height ? json.height : 44;
        if (json.top < 0) json.top = 0;
        if (json.left < 0) json.left = 0;
        var hack = 0;
        if (navigator.userAgent.indexOf("8.0") != -1) hack = 2;
        this.$nodeDom[id] = $("<div class='GeFlow_item" + mark + "' id='" + id + "' style='top:" + json.top + "px;left:" + json.left + "px'><table cellspacing='1' style='width:" + (json.width - 2) + "px;height:" + (json.height - 2) + "px;'><tr><td class='ico'><b class='ico_" + json.type + "'></b></td><td>" + json.name + "</td></tr></table><div style='display:none'><div class='rs_bottom'></div><div class='rs_right'></div><div class='rs_rb'></div><div class='rs_close'></div></div></div>");
        if (json.type == 'complex') this.$nodeDom[id].addClass('item_complex')
        //} else {
        //    json.width = 32;
        //    json.height = 32;
        //    this.$nodeDom[id] = $("<div class='GeFlow_item item_round" + mark + "' id='" + id + "' style='top:" + json.top + "px;left:" + json.left + "px'><table cellspacing='0'><tr><td class='ico'><b class='ico_" + json.type + "'></b></td></tr></table><div  style='display:none'><div class='rs_close'></div></div><div class='span'>" + json.name + "</div></div>")
        //};
        var ua = navigator.userAgent.toLowerCase();
        if (ua.indexOf('msie') != -1 && ua.indexOf('8.0') != -1) this.$nodeDom[id].css("filter", "progid:DXImageTransform.Microsoft.Shadow(color=#94AAC2,direction=135,strength=2)");
        this.$workArea.append(this.$nodeDom[id]);
        this.$nodeData[id] = json;
        ++this.$nodeCount
    }, initWorkForNode: function () {
        this.$workArea.delegate(".GeFlow_item", "click", {
            inthis: this
        }, function (e) {
            e.data.inthis.focusItem(this.id, true);
            $(this).removeClass("item_mark")
        });
        this.$workArea.delegate(".ico", "mousedown", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            var This = e.data.inthis;
            if (This.$nowType == "direct") return;
            var Dom = $(this).parents(".GeFlow_item");
            var id = Dom.attr("id");
            This.focusItem(id, true);
            var hack = 1;
            if (navigator.userAgent.indexOf("8.0") != -1) hack = 0;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$ghost.css({
                display: "block",
                width: This.$nodeData[id].width - 2 + "px",
                height: This.$nodeData[id].height - 2 + "px",
                top: This.$nodeData[id].top + t.top - This.$workArea[0].parentNode.scrollTop + hack + "px",
                left: This.$nodeData[id].left + t.left - This.$workArea[0].parentNode.scrollLeft + hack + "px",
                cursor: "move"
            });
            Dom.children("table").clone().prependTo(This.$ghost);
            var X, Y;
            X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
            Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
            var vX = X - This.$nodeData[id].left,
                vY = Y - This.$nodeData[id].top;
            var isMove = false;
            document.onmousemove = function (e) {
                if (!e) e = window.event;
                var ev = GeFlow.prototype.mousePosition(e);
                X = ev.x - vX;
                Y = ev.y - vY;
                if (X < t.left - This.$workArea[0].parentNode.scrollLeft) X = t.left - This.$workArea[0].parentNode.scrollLeft;
                else if (X + This.$workArea[0].parentNode.scrollLeft + This.$nodeData[id].width > t.left + This.$workArea.width()) X = t.left + This.$workArea.width() - This.$workArea[0].parentNode.scrollLeft - This.$nodeData[id].width;
                if (Y < t.top - This.$workArea[0].parentNode.scrollTop) Y = t.top - This.$workArea[0].parentNode.scrollTop;
                else if (Y + This.$workArea[0].parentNode.scrollTop + This.$nodeData[id].height > t.top + This.$workArea.height()) Y = t.top + This.$workArea.height() - This.$workArea[0].parentNode.scrollTop - This.$nodeData[id].height;
                This.$ghost.css({
                    left: X + hack + "px",
                    top: Y + hack + "px"
                });
                isMove = true
            };
            document.onmouseup = function (e) {
                if (isMove) This.moveNode(id, X + This.$workArea[0].parentNode.scrollLeft - t.left, Y + This.$workArea[0].parentNode.scrollTop - t.top);
                This.$ghost.empty().hide();
                document.onmousemove = null;
                document.onmouseup = null
            }
        });
        if (!this.$editable) return;
        this.$workArea.delegate(".GeFlow_item", "mouseenter", {
            inthis: this
        }, function (e) {
            if (e.data.inthis.$nowType != "direct") return;
            $(this).addClass("item_mark")
        });
        this.$workArea.delegate(".GeFlow_item", "mouseleave", {
            inthis: this
        }, function (e) {
            if (e.data.inthis.$nowType != "direct") return;
            $(this).removeClass("item_mark")
        });
        this.$workArea.delegate(".GeFlow_item", "mousedown", {
            inthis: this
        }, function (e) {
            var This = e.data.inthis;
            if (This.$nowType != "direct") return;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            var X, Y;
            X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
            Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
            This.$workArea.data("lineStart", {
                "x": X,
                "y": Y,
                "id": this.id
            }).css("cursor", "crosshair");
            var line = GeFlow.prototype.drawLine("GeFlow_tmp_line", [X, Y], [X, Y], true, true);
            This.$draw.appendChild(line)
        });
        this.$workArea.delegate(".GeFlow_item", "mouseup", {
            inthis: this
        }, function (e) {
            var This = e.data.inthis;
            if (This.$nowType != "direct") return;
            var lineStart = This.$workArea.data("lineStart");
            if (lineStart) This.addLine(GeFlow.prototype.guid(), {
                from: lineStart.id,
                to: this.id,
                name: ""
            });
            This.$max++
        });
        this.$workArea.delegate(".GeFlow_item > .span", "dblclick", {
            inthis: this
        }, function (e) {
            var oldTxt = this.innerHTML;
            var This = e.data.inthis;
            var id = this.parentNode.id;
            var t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$textArea.val(oldTxt).css({
                display: "block",
                height: $(this).height(),
                width: 100,
                left: t.left + This.$nodeData[id].left - This.$workArea[0].parentNode.scrollLeft - 24,
                top: t.top + This.$nodeData[id].top - This.$workArea[0].parentNode.scrollTop + 26
            }).data("id", This.$focus).focus();
            This.$workArea.parent().one("mousedown", function (e) {
                This.setName(This.$textArea.data("id"), This.$textArea.val(), "node");
                This.$textArea.val("").removeData("id").hide()
            })
        });
        this.$workArea.delegate(".ico + td", "dblclick", {
            inthis: this
        }, function (e) {
            var oldTxt = this.innerHTML;
            var This = e.data.inthis;
            var id = $(this).parents(".GeFlow_item").attr("id");
            var t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$textArea.val(oldTxt).css({
                display: "block",
                width: $(this).width() + 24,
                height: $(this).height(),
                left: t.left + 24 + This.$nodeData[id].left - This.$workArea[0].parentNode.scrollLeft,
                top: t.top + 2 + This.$nodeData[id].top - This.$workArea[0].parentNode.scrollTop
            }).data("id", This.$focus).focus();
            This.$workArea.parent().one("mousedown", function (e) {
                This.setName(This.$textArea.data("id"), This.$textArea.val(), "node");
                This.$textArea.val("").removeData("id").hide()
            })
        });
        this.$workArea.delegate(".rs_close", "click", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            e.data.inthis.delNode(e.data.inthis.$focus);
            return false
        });
        this.$workArea.delegate(".GeFlow_item > div > div[class!=rs_close]", "mousedown", {
            inthis: this
        }, function (e) {
            if (!e) e = window.event;
            var cursor = $(this).css("cursor");
            if (cursor == "pointer") {
                return
            };
            var This = e.data.inthis;
            var id = This.$focus;
            This.switchToolBtn("cursor");
            e.cancelBubble = true;
            e.stopPropagation();
            var hack = 1;
            if (navigator.userAgent.indexOf("8.0") != -1) hack = 0;
            var ev = GeFlow.prototype.mousePosition(e),
                t = GeFlow.prototype.getElCoordinate(This.$workArea[0]);
            This.$ghost.css({
                display: "block",
                width: This.$nodeData[id].width - 2 + "px",
                height: This.$nodeData[id].height - 2 + "px",
                top: This.$nodeData[id].top + t.top - This.$workArea[0].parentNode.scrollTop + hack + "px",
                left: This.$nodeData[id].left + t.left - This.$workArea[0].parentNode.scrollLeft + hack + "px",
                cursor: cursor
            });
            var X, Y;
            X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft;
            Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop;
            var vX = (This.$nodeData[id].left + This.$nodeData[id].width) - X;
            var vY = (This.$nodeData[id].top + This.$nodeData[id].height) - Y;
            var isMove = false;
            This.$ghost.css("cursor", cursor);
            document.onmousemove = function (e) {
                if (!e) e = window.event;
                var ev = GeFlow.prototype.mousePosition(e);
                X = ev.x - t.left + This.$workArea[0].parentNode.scrollLeft - This.$nodeData[id].left + vX;
                Y = ev.y - t.top + This.$workArea[0].parentNode.scrollTop - This.$nodeData[id].top + vY;
                if (X < 86) X = 86;
                if (Y < 24) Y = 24;
                isMove = true;
                switch (cursor) {
                    case "nw-resize":
                        This.$ghost.css({
                            width: X - 2 + "px",
                            height: Y - 2 + "px"
                        });
                        break;
                    case "w-resize":
                        This.$ghost.css({
                            width: X - 2 + "px"
                        });
                        break;
                    case "n-resize":
                        This.$ghost.css({
                            height: Y - 2 + "px"
                        });
                        break
                }
            };
            document.onmouseup = function (e) {
                This.$ghost.hide();
                if (!isMove) return;
                if (!e) e = window.event;
                This.resizeNode(id, This.$ghost.outerWidth(), This.$ghost.outerHeight());
                document.onmousemove = null;
                document.onmouseup = null
            }
        })
    }, getItemInfo: function (id, type) {
        switch (type) {
            case "node":
                return this.$nodeData[id] || null;
            case "line":
                return this.$lineData[id] || null;
            case "area":
                return this.$areaData[id] || null
        }
    }, blurItem: function () {
        if (this.$focus != "") {
            var jq = $("#" + this.$focus);
            if (jq.prop("tagName") == "DIV") {
                if (this.onItemBlur != null && !this.onItemBlur(id, "node")) return false;
                jq.removeClass("item_focus").children("div:eq(0)").css("display", "none")
            } else {
                if (this.onItemBlur != null && !this.onItemBlur(id, "line")) return false;
                if (GeFlow.prototype.useSVG != "") {
                    if (!this.$lineData[this.$focus].marked) {
                        jq[0].childNodes[1].setAttribute("stroke", "#5068AE");
                        jq[0].childNodes[1].setAttribute("marker-end", "url(#arrow1)")
                    }
                } else {
                    if (!this.$lineData[this.$focus].marked) jq[0].strokeColor = "#5068AE"
                };
                this.$lineMove.hide().removeData("type").removeData("tid");
                if (this.$editable) this.$lineOper.hide().removeData("tid")
            }
        };
        this.$focus = "";
        return true
    }, focusItem: function (id, bool) {
        var jq = $("#" + id);
        if (jq.length == 0) return;
        if (!this.blurItem()) return;
        if (jq.prop("tagName") == "DIV") {
            if (bool && this.onItemFocus != null && !this.onItemFocus(id, "node")) return;
            jq.addClass("item_focus");
            if (this.$editable) jq.children("div:eq(0)").css("display", "block");
            this.$workArea.append(jq)
        } else {
            if (this.onItemFocus != null && !this.onItemFocus(id, "line")) return;
            if (GeFlow.prototype.useSVG != "") {
                jq[0].childNodes[1].setAttribute("stroke", "#ff3300");
                jq[0].childNodes[1].setAttribute("marker-end", "url(#arrow2)")
            } else jq[0].strokeColor = "#ff3300"; if (!this.$editable) return;
            var x, y, from, to;
            if (GeFlow.prototype.useSVG != "") {
                from = jq.attr("from").split(",");
                to = jq.attr("to").split(",")
            } else {
                var n = jq[0].getAttribute("fromTo").split(",");
                from = [n[0], n[1]];
                to = [n[2], n[3]]
            };
            from[0] = parseInt(from[0], 10);
            from[1] = parseInt(from[1], 10);
            to[0] = parseInt(to[0], 10);
            to[1] = parseInt(to[1], 10);
            if (this.$lineData[id].type == "lr") {
                from[0] = this.$lineData[id].M;
                to[0] = from[0];
                this.$lineMove.css({
                    width: "5px",
                    height: (to[1] - from[1]) * (to[1] > from[1] ? 1 : -1) + "px",
                    left: from[0] - 3 + "px",
                    top: (to[1] > from[1] ? from[1] : to[1]) + 1 + "px",
                    cursor: "e-resize",
                    display: "block"
                }).data({
                    "type": "lr",
                    "tid": id
                })
            } else if (this.$lineData[id].type == "tb") {
                from[1] = this.$lineData[id].M;
                to[1] = from[1];
                this.$lineMove.css({
                    width: (to[0] - from[0]) * (to[0] > from[0] ? 1 : -1) + "px",
                    height: "5px",
                    left: (to[0] > from[0] ? from[0] : to[0]) + 1 + "px",
                    top: from[1] - 3 + "px",
                    cursor: "s-resize",
                    display: "block"
                }).data({
                    "type": "tb",
                    "tid": id
                })
            };
            x = (from[0] + to[0]) / 2 - 35;
            y = (from[1] + to[1]) / 2 + 6;
            this.$lineOper.css({
                display: "block",
                left: x + "px",
                top: y + "px"
            }).data("tid", id)
        };
        this.$focus = id;
        this.switchToolBtn("cursor")
    }, moveNode: function (id, left, top) {
        if (!this.$nodeData[id]) return;
        if (this.onItemMove != null && !this.onItemMove(id, "node", left, top)) return;
        if (this.$undoStack) {
            var paras = [id, this.$nodeData[id].left, this.$nodeData[id].top];
            this.pushOper("moveNode", paras)
        };
        if (left < 0) left = 0;
        if (top < 0) top = 0;
        $("#" + id).css({
            left: left + "px",
            top: top + "px"
        });
        this.$nodeData[id].left = left;
        this.$nodeData[id].top = top;
        this.resetLines(id, this.$nodeData[id])
    }, setName: function (id, name, type) {
        var oldName;
        if (type == "node") {
            if (!this.$nodeData[id]) return;
            if (this.$nodeData[id].name == name) return;
            if (this.onItemRename != null && !this.onItemRename(id, name, "node")) return;
            oldName = this.$nodeData[id].name;
            this.$nodeData[id].name = name;
            if (this.$nodeData[id].type == "start" || this.$nodeData[id].type == "end") {
                this.$nodeDom[id].children(".span").text(name)
            } else {
                this.$nodeDom[id].find("td:eq(1)").text(name);
                var hack = 0;
                if (navigator.userAgent.indexOf("8.0") != -1) hack = 2;
                var width = this.$nodeDom[id].outerWidth();
                var height = this.$nodeDom[id].outerHeight();
                this.$nodeDom[id].children("table").css({
                    width: width - 2 + "px",
                    height: height - 2 + "px"
                });
                this.$nodeData[id].width = width;
                this.$nodeData[id].height = height
            };
            this.resetLines(id, this.$nodeData[id])
        } else if (type == "line") {
            if (!this.$lineData[id]) return;
            if (this.$lineData[id].name == name) return;
            if (this.onItemRename != null && !this.onItemRename(id, name, "line")) return;
            oldName = this.$lineData[id].name;
            this.$lineData[id].name = name;
            if (GeFlow.prototype.useSVG != "") {
                this.$lineDom[id].childNodes[2].textContent = name
            } else {
                this.$lineDom[id].childNodes[1].innerHTML = name;
                var n = this.$lineDom[id].getAttribute("fromTo").split(",");
                var x;
                if (this.$lineData[id].type != "lr") {
                    x = (n[2] - n[0]) / 2
                } else {
                    var Min = n[2] > n[0] ? n[0] : n[2];
                    if (Min > this.$lineData[id].M) Min = this.$lineData[id].M;
                    x = this.$lineData[id].M - Min
                }; if (x < 0) x = x * -1;
                this.$lineDom[id].childNodes[1].style.left = x - this.$lineDom[id].childNodes[1].offsetWidth / 2 + 4 + "px"
            }
        } else if (type == "area") {
            if (!this.$areaData[id]) return;
            if (this.$areaData[id].name == name) return;
            if (this.onItemRename != null && !this.onItemRename(id, name, "area")) return;
            oldName = this.$areaData[id].name;
            this.$areaData[id].name = name;
            this.$areaDom[id].children("label").text(name)
        };
        if (this.$undoStack) {
            var paras = [id, oldName, type];
            this.pushOper("setName", paras)
        }
    }, resizeNode: function (id, width, height) {
        if (!this.$nodeData[id]) return;
        if (this.onItemResize != null && !this.onItemResize(id, "node", width, height)) return;
        //if (this.$nodeData[id].type == "start" || this.$nodeData[id].type == "end") return;
        if (this.$undoStack) {
            var paras = [id, this.$nodeData[id].width, this.$nodeData[id].height];
            this.pushOper("resizeNode", paras)
        };
        var hack = 0;
        if (navigator.userAgent.indexOf("8.0") != -1) hack = 2;
        this.$nodeDom[id].children("table").css({
            width: width - 2 + "px",
            height: height - 2 + "px"
        });
        width = this.$nodeDom[id].outerWidth() - hack;
        height = this.$nodeDom[id].outerHeight() - hack;
        this.$nodeDom[id].children("table").css({
            width: width - 2 + "px",
            height: height - 2 + "px"
        });
        this.$nodeData[id].width = width;
        this.$nodeData[id].height = height;
        this.resetLines(id, this.$nodeData[id])
    }, delNode: function (id) {
        if (!this.$nodeData[id]) return;
        if (this.$undoStack) {
            var paras = [id, this.$nodeData[id]];
            this.pushOper("addNode", paras)
        };
        if (this.onItemDel != null && !this.onItemDel(id, "node")) return;
        delete this.$nodeData[id];
        this.$nodeDom[id].remove();
        delete this.$nodeDom[id];
        --this.$nodeCount;
        if (this.$focus == id) this.$focus = "";
        for (var k in this.$lineData) {
            if (this.$lineData[k].from == id || this.$lineData[k].to == id) {
                this.$draw.removeChild(this.$lineDom[k]);
                delete this.$lineData[k];
                delete this.$lineDom[k]
            }
        }
    }, setTitle: function (text) {
        this.$title = text;
        if (this.$head && text) this.$head.children("label").attr("title", text).text(text)
    }, loadData: function (data) {
        if (data) {
            this.setTitle(data.title);
            if (data.initNum) this.$max = data.initNum;
            for (var i in data.nodes) this.addNode(i, data.nodes[i]);
            for (var j in data.lines) this.addLine(j, data.lines[j]);
            for (var k in data.areas) this.addArea(k, data.areas[k])
        }
    }, loadDataAjax: function (para) {
        var This = this;
        $.ajax({
            type: para.type,
            url: para.url,
            dataType: "json",
            data: para.data,
            success: function (msg) {
                if (para.dataFilter) para.dataFilter(msg, "json");
                This.loadData(msg);
                if (para.success) para.success(msg)
            }, error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (para.error) para.error(textStatus, errorThrown)
            }
        })
    }, exportData: function () {
        return {
            nodes: this.$nodeData,
            lines: this.$lineData,
            areas: this.$areaData
        }
    }, clearData: function () {
        for (var key in this.$nodeData) {
            this.delNode(key)
        };
        for (var key in this.$lineData) {
            this.delLine(key)
        };
        for (var key in this.$areaData) {
            this.delArea(key)
        }
    }, destrory: function () {
        this.$bgDiv.empty();
        this.$lineData = null;
        this.$nodeData = null;
        this.$lineDom = null;
        this.$nodeDom = null;
        this.$areaDom = null;
        this.$areaData = null;
        this.$nodeCount = 0;
        this.$areaCount = 0;
        this.$areaCount = 0
    }, drawLine: function (id, sp, ep, mark, dash) {
        var line;
        if (GeFlow.prototype.useSVG != "") {
            line = document.createElementNS("http://www.w3.org/2000/svg", "g");
            var hi = document.createElementNS("http://www.w3.org/2000/svg", "path");
            var path = document.createElementNS("http://www.w3.org/2000/svg", "path");
            if (id != "") line.setAttribute("id", id);
            line.setAttribute("from", sp[0] + "," + sp[1]);
            line.setAttribute("to", ep[0] + "," + ep[1]);
            hi.setAttribute("visibility", "hidden");
            hi.setAttribute("stroke-width", 9);
            hi.setAttribute("fill", "none");
            hi.setAttribute("stroke", "white");
            hi.setAttribute("d", "M " + sp[0] + " " + sp[1] + " L " + ep[0] + " " + ep[1]);
            hi.setAttribute("pointer-events", "stroke");
            path.setAttribute("d", "M " + sp[0] + " " + sp[1] + " L " + ep[0] + " " + ep[1]);
            path.setAttribute("stroke-width", 1.4);
            path.setAttribute("stroke-linecap", "round");
            path.setAttribute("fill", "none");
            if (dash) path.setAttribute("style", "stroke-dasharray:6,5");
            if (mark) {
                path.setAttribute("stroke", "#ff3300");
                path.setAttribute("marker-end", "url(#arrow2)")
            } else {
                path.setAttribute("stroke", "#5068AE");
                path.setAttribute("marker-end", "url(#arrow1)")
            };
            line.appendChild(hi);
            line.appendChild(path);
            line.style.cursor = "crosshair";
            if (id != "" && id != "GeFlow_tmp_line") {
                var text = document.createElementNS("http://www.w3.org/2000/svg", "text");
                line.appendChild(text);
                var x = (ep[0] + sp[0]) / 2;
                var y = (ep[1] + sp[1]) / 2;
                text.setAttribute("text-anchor", "middle");
                text.setAttribute("x", x);
                text.setAttribute("y", y);
                line.style.cursor = "pointer";
                text.style.cursor = "text"
            }
        } else {
            line = document.createElement("v:polyline");
            if (id != "") line.id = id;
            line.setAttribute("points", "");
            line.points.value = sp[0] + "," + sp[1] + " " + ep[0] + "," + ep[1];
            line.setAttribute("fromTo", sp[0] + "," + sp[1] + "," + ep[0] + "," + ep[1]);
            line.strokeWeight = "1.2";
            line.setAttribute("stroke", "");
            line.stroke.EndArrow = "Block";
            line.style.cursor = "crosshair";
            if (id != "" && id != "GeFlow_tmp_line") {
                var text = document.createElement("div");
                alert(line.outerHTML);
                var x = (ep[0] - sp[0]) / 2;
                var y = (ep[1] - sp[1]) / 2;
                if (x < 0) x = x * -1;
                if (y < 0) y = y * -1;
                text.style.left = x + "px";
                text.style.top = y - 6 + "px";
                line.style.cursor = "pointer"
                line.appendChild(text);
            };
            if (dash) line.stroke.dashstyle = "Dash";
            if (mark) line.strokeColor = "#ff3300";
            else line.strokeColor = "#5068AE"
        };
        return line
    }, drawPoly: function (id, sp, m1, m2, ep, mark) {
        var poly, strPath;
        if (GeFlow.prototype.useSVG != "") {
            poly = document.createElementNS("http://www.w3.org/2000/svg", "g");
            var hi = document.createElementNS("http://www.w3.org/2000/svg", "path");
            var path = document.createElementNS("http://www.w3.org/2000/svg", "path");
            if (id != "") poly.setAttribute("id", id);
            poly.setAttribute("from", sp[0] + "," + sp[1]);
            poly.setAttribute("to", ep[0] + "," + ep[1]);
            hi.setAttribute("visibility", "hidden");
            hi.setAttribute("stroke-width", 9);
            hi.setAttribute("fill", "none");
            hi.setAttribute("stroke", "white");
            strPath = "M " + sp[0] + " " + sp[1];
            if (m1[0] != sp[0] || m1[1] != sp[1]) strPath += " L " + m1[0] + " " + m1[1];
            if (m2[0] != ep[0] || m2[1] != ep[1]) strPath += " L " + m2[0] + " " + m2[1];
            strPath += " L " + ep[0] + " " + ep[1];
            hi.setAttribute("d", strPath);
            hi.setAttribute("pointer-events", "stroke");
            path.setAttribute("d", strPath);
            path.setAttribute("stroke-width", 1.4);
            path.setAttribute("stroke-linecap", "round");
            path.setAttribute("fill", "none");
            if (mark) {
                path.setAttribute("stroke", "#ff3300");
                path.setAttribute("marker-end", "url(#arrow2)")
            } else {
                path.setAttribute("stroke", "#5068AE");
                path.setAttribute("marker-end", "url(#arrow1)")
            };
            poly.appendChild(hi);
            poly.appendChild(path);
            var text = document.createElementNS("http://www.w3.org/2000/svg", "text");
            poly.appendChild(text);
            var x = (m2[0] + m1[0]) / 2;
            var y = (m2[1] + m1[1]) / 2;
            text.setAttribute("text-anchor", "middle");
            text.setAttribute("x", x);
            text.setAttribute("y", y);
            text.style.cursor = "text";
            poly.style.cursor = "pointer"
        } else {
            poly = document.createElement("v:Polyline");
            if (id != "") poly.id = id;
            poly.filled = "false";
            strPath = sp[0] + "," + sp[1];
            if (m1[0] != sp[0] || m1[1] != sp[1]) strPath += " " + m1[0] + "," + m1[1];
            if (m2[0] != ep[0] || m2[1] != ep[1]) strPath += " " + m2[0] + "," + m2[1];
            strPath += " " + ep[0] + "," + ep[1];
            poly.points.value = strPath;
            poly.setAttribute("fromTo", sp[0] + "," + sp[1] + "," + ep[0] + "," + ep[1]);
            poly.strokeWeight = "1.2";
            poly.stroke.EndArrow = "Block";
            var text = document.createElement("div");
            poly.appendChild(text);
            var x = (m2[0] - m1[0]) / 2;
            var y = (m2[1] - m1[1]) / 2;
            if (x < 0) x = x * -1;
            if (y < 0) y = y * -1;
            text.style.left = x + "px";
            text.style.top = y - 4 + "px";
            poly.style.cursor = "pointer";
            if (mark) poly.strokeColor = "#ff3300";
            else poly.strokeColor = "#5068AE"
        };
        return poly
    }, calcStartEnd: function (n1, n2) {
        var X_1, Y_1, X_2, Y_2;
        var x11 = n1.left,
            x12 = n1.left + n1.width,
            x21 = n2.left,
            x22 = n2.left + n2.width;
        if (x11 >= x22) {
            X_1 = x11;
            X_2 = x22
        } else if (x12 <= x21) {
            X_1 = x12;
            X_2 = x21
        } else if (x11 <= x21 && x12 >= x21 && x12 <= x22) {
            X_1 = (x12 + x21) / 2;
            X_2 = X_1
        } else if (x11 >= x21 && x12 <= x22) {
            X_1 = (x11 + x12) / 2;
            X_2 = X_1
        } else if (x21 >= x11 && x22 <= x12) {
            X_1 = (x21 + x22) / 2;
            X_2 = X_1
        } else if (x11 <= x22 && x12 >= x22) {
            X_1 = (x11 + x22) / 2;
            X_2 = X_1
        };
        var y11 = n1.top,
            y12 = n1.top + n1.height,
            y21 = n2.top,
            y22 = n2.top + n2.height;
        if (y11 >= y22) {
            Y_1 = y11;
            Y_2 = y22
        } else if (y12 <= y21) {
            Y_1 = y12;
            Y_2 = y21
        } else if (y11 <= y21 && y12 >= y21 && y12 <= y22) {
            Y_1 = (y12 + y21) / 2;
            Y_2 = Y_1
        } else if (y11 >= y21 && y12 <= y22) {
            Y_1 = (y11 + y12) / 2;
            Y_2 = Y_1
        } else if (y21 >= y11 && y22 <= y12) {
            Y_1 = (y21 + y22) / 2;
            Y_2 = Y_1
        } else if (y11 <= y22 && y12 >= y22) {
            Y_1 = (y11 + y22) / 2;
            Y_2 = Y_1
        };
        return {
            "start": [X_1, Y_1],
            "end": [X_2, Y_2]
        }
    }, calcPolyPoints: function (n1, n2, type, M) {
        var SP = {
            x: n1.left + n1.width / 2,
            y: n1.top + n1.height / 2
        };
        var EP = {
            x: n2.left + n2.width / 2,
            y: n2.top + n2.height / 2
        };
        var sp = [],
            m1 = [],
            m2 = [],
            ep = [];
        sp = [SP.x, SP.y];
        ep = [EP.x, EP.y];
        if (type == "lr") {
            m1 = [M, SP.y];
            m2 = [M, EP.y];
            if (m1[0] > n1.left && m1[0] < n1.left + n1.width) {
                m1[1] = (SP.y > EP.y ? n1.top : n1.top + n1.height);
                sp[0] = m1[0];
                sp[1] = m1[1]
            } else {
                sp[0] = (m1[0] < n1.left ? n1.left : n1.left + n1.width)
            }; if (m2[0] > n2.left && m2[0] < n2.left + n2.width) {
                m2[1] = (SP.y > EP.y ? n2.top + n2.height : n2.top);
                ep[0] = m2[0];
                ep[1] = m2[1]
            } else {
                ep[0] = (m2[0] < n2.left ? n2.left : n2.left + n2.width)
            }
        } else if (type == "tb") {
            m1 = [SP.x, M];
            m2 = [EP.x, M];
            if (m1[1] > n1.top && m1[1] < n1.top + n1.height) {
                m1[0] = (SP.x > EP.x ? n1.left : n1.left + n1.width);
                sp[0] = m1[0];
                sp[1] = m1[1]
            } else {
                sp[1] = (m1[1] < n1.top ? n1.top : n1.top + n1.height)
            }; if (m2[1] > n2.top && m2[1] < n2.top + n2.height) {
                m2[0] = (SP.x > EP.x ? n2.left + n2.width : n2.left);
                ep[0] = m2[0];
                ep[1] = m2[1]
            } else {
                ep[1] = (m2[1] < n2.top ? n2.top : n2.top + n2.height)
            }
        };
        return {
            start: sp,
            m1: m1,
            m2: m2,
            end: ep
        }
    }, getMValue: function (n1, n2, mType) {
        if (mType == "lr") {
            return (n1.left + n1.width / 2 + n2.left + n2.width / 2) / 2
        } else if (mType == "tb") {
            return (n1.top + n1.height / 2 + n2.top + n2.height / 2) / 2
        }
    }, addLine: function (id, json) {
        if (this.onItemAdd != null && !this.onItemAdd(id, "line", json)) return;
        if (this.$undoStack) {
            this.pushOper("delLine", [id])
        };
        var n1 = null,
            n2 = null;
        if (json.from == json.to) return;
        for (var k in this.$lineData) {
            if ((json.from == this.$lineData[k].from && json.to == this.$lineData[k].to)) return
        };
        var n1 = this.$nodeData[json.from],
            n2 = this.$nodeData[json.to];
        if (!n1 || !n2) return;
        var res;
        if (json.type && json.type != "sl") res = GeFlow.prototype.calcPolyPoints(n1, n2, json.type, json.M);
        else res = GeFlow.prototype.calcStartEnd(n1, n2); if (!res) return;
        this.$lineData[id] = {};
        if (json.type) {
            this.$lineData[id].type = json.type;
            this.$lineData[id].M = json.M
        } else this.$lineData[id].type = "sl";
        this.$lineData[id].from = json.from;
        this.$lineData[id].to = json.to;
        this.$lineData[id].name = json.name;
        if (json.mark) this.$lineData[id].marked = json.mark;
        else this.$lineData[id].marked = false; if (this.$lineData[id].type == "sl") this.$lineDom[id] = GeFlow.prototype.drawLine(id, res.start, res.end, json.mark);
        else this.$lineDom[id] = GeFlow.prototype.drawPoly(id, res.start, res.m1, res.m2, res.end, json.mark);
        this.$draw.appendChild(this.$lineDom[id]);
        if (GeFlow.prototype.useSVG == "") {
            this.$lineDom[id].childNodes[1].innerHTML = json.name;
            if (this.$lineData[id].type != "sl") {
                var Min = (res.start[0] > res.end[0] ? res.end[0] : res.start[0]);
                if (Min > res.m2[0]) Min = res.m2[0];
                if (Min > res.m1[0]) Min = res.m1[0];
                this.$lineDom[id].childNodes[1].style.left = (res.m2[0] + res.m1[0]) / 2 - Min - this.$lineDom[id].childNodes[1].offsetWidth / 2 + 4;
                Min = (res.start[1] > res.end[1] ? res.end[1] : res.start[1]);
                if (Min > res.m2[1]) Min = res.m2[1];
                if (Min > res.m1[1]) Min = res.m1[1];
                this.$lineDom[id].childNodes[1].style.top = (res.m2[1] + res.m1[1]) / 2 - Min - this.$lineDom[id].childNodes[1].offsetHeight / 2
            } else this.$lineDom[id].childNodes[1].style.left = ((res.end[0] - res.start[0]) * (res.end[0] > res.start[0] ? 1 : -1) - this.$lineDom[id].childNodes[1].offsetWidth) / 2 + 4
        } else this.$lineDom[id].childNodes[2].textContent = json.name;
        ++this.$lineCount
    }, resetLines: function (id, node) {
        for (var i in this.$lineData) {
            var other = null;
            var res;
            if (this.$lineData[i].from == id) {
                other = this.$nodeData[this.$lineData[i].to] || null;
                if (other == null) continue;
                if (this.$lineData[i].type == "sl") res = GeFlow.prototype.calcStartEnd(node, other);
                else res = GeFlow.prototype.calcPolyPoints(node, other, this.$lineData[i].type, this.$lineData[i].M); if (!res) break
            } else if (this.$lineData[i].to == id) {
                other = this.$nodeData[this.$lineData[i].from] || null;
                if (other == null) continue;
                if (this.$lineData[i].type == "sl") res = GeFlow.prototype.calcStartEnd(other, node);
                else res = GeFlow.prototype.calcPolyPoints(other, node, this.$lineData[i].type, this.$lineData[i].M); if (!res) break
            };
            if (other == null) continue;
            this.$draw.removeChild(this.$lineDom[i]);
            if (this.$lineData[i].type == "sl") {
                this.$lineDom[i] = GeFlow.prototype.drawLine(i, res.start, res.end, this.$lineData[i].marked)
            } else {
                this.$lineDom[i] = GeFlow.prototype.drawPoly(i, res.start, res.m1, res.m2, res.end, this.$lineData[i].marked)
            };
            this.$draw.appendChild(this.$lineDom[i]);
            if (GeFlow.prototype.useSVG == "") {
                this.$lineDom[i].childNodes[1].innerHTML = this.$lineData[i].name;
                if (this.$lineData[i].type != "sl") {
                    var Min = (res.start[0] > res.end[0] ? res.end[0] : res.start[0]);
                    if (Min > res.m2[0]) Min = res.m2[0];
                    if (Min > res.m1[0]) Min = res.m1[0];
                    this.$lineDom[i].childNodes[1].style.left = (res.m2[0] + res.m1[0]) / 2 - Min - this.$lineDom[i].childNodes[1].offsetWidth / 2 + 4;
                    Min = (res.start[1] > res.end[1] ? res.end[1] : res.start[1]);
                    if (Min > res.m2[1]) Min = res.m2[1];
                    if (Min > res.m1[1]) Min = res.m1[1];
                    this.$lineDom[i].childNodes[1].style.top = (res.m2[1] + res.m1[1]) / 2 - Min - this.$lineDom[i].childNodes[1].offsetHeight / 2 - 4
                } else this.$lineDom[i].childNodes[1].style.left = ((res.end[0] - res.start[0]) * (res.end[0] > res.start[0] ? 1 : -1) - this.$lineDom[i].childNodes[1].offsetWidth) / 2 + 4
            } else this.$lineDom[i].childNodes[2].textContent = this.$lineData[i].name
        }
    }, setLineType: function (id, newType) {
        if (!newType || newType == null || newType == "" || !this.$lineData[id] || newType == this.$lineData[id].type) return false;
        if (this.onLineSetType != null && !this.onLineSetType(id, newType)) return;
        if (this.$undoStack) {
            var paras = [id, this.$lineData[id].type];
            this.pushOper("setLineType", paras);
            if (this.$lineData[id].type != "sl") {
                var para2 = [id, this.$lineData[id].M];
                this.pushOper("setLineM", para2)
            }
        };
        var from = this.$lineData[id].from;
        var to = this.$lineData[id].to;
        this.$lineData[id].type = newType;
        var res;
        if (newType != "sl") {
            var res = GeFlow.prototype.calcPolyPoints(this.$nodeData[from], this.$nodeData[to], this.$lineData[id].type, this.$lineData[id].M);
            this.setLineM(id, this.getMValue(this.$nodeData[from], this.$nodeData[to], newType), true)
        } else {
            delete this.$lineData[id].M;
            this.$lineMove.hide().removeData("type").removeData("tid");
            res = GeFlow.prototype.calcStartEnd(this.$nodeData[from], this.$nodeData[to]);
            if (!res) return;
            this.$draw.removeChild(this.$lineDom[id]);
            this.$lineDom[id] = GeFlow.prototype.drawLine(id, res.start, res.end, this.$lineData[id].marked || this.$focus == id);
            this.$draw.appendChild(this.$lineDom[id]);
            if (GeFlow.prototype.useSVG == "") {
                this.$lineDom[id].childNodes[1].innerHTML = this.$lineData[id].name;
                this.$lineDom[id].childNodes[1].style.left = ((res.end[0] - res.start[0]) * (res.end[0] > res.start[0] ? 1 : -1) - this.$lineDom[id].childNodes[1].offsetWidth) / 2 + 4
            } else this.$lineDom[id].childNodes[2].textContent = this.$lineData[id].name
        }; if (this.$focus == id) {
            this.focusItem(id)
        }
    }, setLineM: function (id, M, noStack) {
        if (!this.$lineData[id] || M < 0 || !this.$lineData[id].type || this.$lineData[id].type == "sl") return false;
        if (this.onLineMove != null && !this.onLineMove(id, M)) return false;
        if (this.$undoStack && !noStack) {
            var paras = [id, this.$lineData[id].M];
            this.pushOper("setLineM", paras)
        };
        var from = this.$lineData[id].from;
        var to = this.$lineData[id].to;
        this.$lineData[id].M = M;
        var ps = GeFlow.prototype.calcPolyPoints(this.$nodeData[from], this.$nodeData[to], this.$lineData[id].type, this.$lineData[id].M);
        this.$draw.removeChild(this.$lineDom[id]);
        this.$lineDom[id] = GeFlow.prototype.drawPoly(id, ps.start, ps.m1, ps.m2, ps.end, this.$lineData[id].marked || this.$focus == id);
        this.$draw.appendChild(this.$lineDom[id]);
        if (GeFlow.prototype.useSVG == "") {
            this.$lineDom[id].childNodes[1].innerHTML = this.$lineData[id].name;
            var Min = (ps.start[0] > ps.end[0] ? ps.end[0] : ps.start[0]);
            if (Min > ps.m2[0]) Min = ps.m2[0];
            if (Min > ps.m1[0]) Min = ps.m1[0];
            this.$lineDom[id].childNodes[1].style.left = (ps.m2[0] + ps.m1[0]) / 2 - Min - this.$lineDom[id].childNodes[1].offsetWidth / 2 + 4;
            Min = (ps.start[1] > ps.end[1] ? ps.end[1] : ps.start[1]);
            if (Min > ps.m2[1]) Min = ps.m2[1];
            if (Min > ps.m1[1]) Min = ps.m1[1];
            this.$lineDom[id].childNodes[1].style.top = (ps.m2[1] + ps.m1[1]) / 2 - Min - this.$lineDom[id].childNodes[1].offsetHeight / 2 - 4
        } else this.$lineDom[id].childNodes[2].textContent = this.$lineData[id].name
    }, delLine: function (id) {
        if (!this.$lineData[id]) return;
        if (this.onItemDel != null && !this.onItemDel(id, "line")) return;
        if (this.$undoStack) {
            var paras = [id, this.$lineData[id]];
            this.pushOper("addLine", paras)
        };
        this.$draw.removeChild(this.$lineDom[id]);
        delete this.$lineData[id];
        delete this.$lineDom[id];
        if (this.$focus == id) this.$focus = "";
        --this.$lineCount
    }, markItem: function (id, type, mark) {
        if (type == "node") {
            if (!this.$nodeData[id]) return;
            if (this.onItemMark != null && !this.onItemMark(id, "node", mark)) return;
            this.$nodeData[id].marked = mark || false;
            if (mark) this.$nodeDom[id].addClass("item_mark");
            else this.$nodeDom[id].removeClass("item_mark")
        } else if (type == "line") {
            if (!this.$lineData[id]) return;
            if (this.onItemMark != null && !this.onItemMark(id, "line", mark)) return;
            this.$lineData[id].marked = mark || false;
            if (GeFlow.prototype.useSVG != "") {
                if (mark) {
                    this.$lineDom[id].childNodes[1].setAttribute("stroke", "#ff3300");
                    this.$lineDom[id].childNodes[1].setAttribute("marker-end", "url(#arrow2)")
                } else {
                    this.$lineDom[id].childNodes[1].setAttribute("stroke", "#5068AE");
                    this.$lineDom[id].childNodes[1].setAttribute("marker-end", "url(#arrow1)")
                }
            } else {
                if (mark) this.$lineDom[id].strokeColor = "#ff3300";
                else this.$lineDom[id].strokeColor = "#5068AE"
            }
        };
        if (this.$undoStatck) {
            var paras = [id, type, !mark];
            this.pushOper("markItem", paras)
        }
    }, moveArea: function (id, left, top) {
        if (!this.$areaData[id]) return;
        if (this.onItemMove != null && !this.onItemMove(id, "area", left, top)) return;
        if (this.$undoStack) {
            var paras = [id, this.$areaData[id].left, this.$areaData[id].top];
            this.pushOper("moveNode", paras)
        };
        if (left < 0) left = 0;
        if (top < 0) top = 0;
        $("#" + id).css({
            left: left + "px",
            top: top + "px"
        });
        this.$areaData[id].left = left;
        this.$areaData[id].top = top
    }, delArea: function (id) {
        if (!this.$areaData[id]) return;
        if (this.$undoStack) {
            var paras = [id, this.$areaData[id]];
            this.pushOper("addArea", paras)
        };
        if (this.onItemDel != null && !this.onItemDel(id, "node")) return;
        delete this.$areaData[id];
        this.$areaDom[id].remove();
        delete this.$areaDom[id];
        --this.$areaCount
    }, setAreaColor: function (id, color) {
        if (!this.$areaData[id]) return;
        if (this.$undoStack) {
            var paras = [id, this.$areaData[id].color];
            this.pushOper("setAreaColor", paras)
        };
        if (color == "red" || color == "yellow" || color == "blue" || color == "green") {
            this.$areaDom[id].removeClass("area_" + this.$areaData[id].color).addClass("area_" + color);
            this.$areaData[id].color = color
        }
    }, resizeArea: function (id, width, height) {
        if (!this.$areaData[id]) return;
        if (this.onItemResize != null && !this.onItemResize(id, "area", width, height)) return;
        if (this.$undoStack) {
            var paras = [id, this.$areaData[id].width, this.$areaData[id].height];
            this.pushOper("resizeArea", paras)
        };
        var hack = 0;
        if (navigator.userAgent.indexOf("8.0") != -1) hack = 2;
        this.$areaDom[id].children(".bg").css({
            width: width - 2 + "px",
            height: height - 2 + "px"
        });
        width = this.$areaDom[id].outerWidth();
        height = this.$areaDom[id].outerHeight();
        this.$areaDom[id].children("bg").css({
            width: width - 2 + "px",
            height: height - 2 + "px"
        });
        this.$areaData[id].width = width;
        this.$areaData[id].height = height
    }, addArea: function (id, json) {
        if (this.onItemAdd != null && !this.onItemAdd(id, "area", json)) return;
        if (this.$undoStack) {
            this.pushOper("delArea", [id])
        };
        this.$areaDom[id] = $("<div id='" + id + "' class='GeFlow_area area_" + json.color + "' style='top:" + json.top + "px;left:" + json.left + "px'><div class='bg' style='width:" + (json.width - 2) + "px;height:" + (json.height - 2) + "px'></div>" + "<label>" + json.name + "</label><b></b><div><div class='rs_bottom'></div><div class='rs_right'></div><div class='rs_rb'></div><div class='rs_close'></div></div></div>");
        this.$areaData[id] = json;
        this.$group.append(this.$areaDom[id]);
        if (this.$nowType != "group") this.$areaDom[id].children("div:eq(1)").css("display", "none");
        ++this.$areaCount
    }, reinitSize: function (width, height) {
        var w = (width || 800) - 2;
        var h = (height || 500) - 2;
        this.$bgDiv.css({
            height: h + "px",
            width: w + "px"
        });
        var headHeight = 0,
            hack = 10;
        if (this.$head != null) {
            headHeight = 32;
            hack = 7
        };
        if (this.$tool != null) {
            this.$tool.css({
                height: h - headHeight - hack + "px"
            })
        };
        w -= 51;
        h = h - headHeight - (this.$head != null ? 5 : 8);
        this.$workArea.parent().css({
            height: h + "px",
            width: w + "px"
        });
        this.$workArea.css({
            height: h * 2 + "px",
            width: w * 2 + "px"
        })
    }
};
//获取一个DIV的绝对坐标的功能函数,即使是非绝对定位,一样能获取到
GeFlow.prototype.getElCoordinate = function (dom) {
    var t = dom.offsetTop;
    var l = dom.offsetLeft;
    dom = dom.offsetParent;
    while (dom) {
        t += dom.offsetTop;
        l += dom.offsetLeft;
        dom = dom.offsetParent;
    }; return {
        top: t,
        left: l
    };
}
//兼容各种浏览器的,获取鼠标真实位置
GeFlow.prototype.mousePosition = function (ev) {
    if (!ev) ev = window.event;
    if (ev.pageX || ev.pageY) {
        return { x: ev.pageX, y: ev.pageY };
    }
    return {
        x: ev.clientX + document.documentElement.scrollLeft - document.body.clientLeft,
        y: ev.clientY + document.documentElement.scrollTop - document.body.clientTop
    };
}
//生成随机guid数
GeFlow.prototype.guid = function () {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}