CREATE TABLE `WF_ActivityInstance` 
(
    `ActivityInstanceID` char(36) NOT NULL,
    `InstanceID` char(36) NOT NULL COMMENT '流程实例ID',
    `WorkflowID` char(36) NOT NULL COMMENT '流程定义ID',
    `AppID` varchar(50) NOT NULL COMMENT '流程应用ID',
    `StepID` int NULL COMMENT '活动序号ID，提单步骤为1',
    `ActivityID` char(36) NOT NULL COMMENT '活动ID',
    `ActivityName` varchar(50) NULL,
    `ActivityType` varchar(50) NULL COMMENT '开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ',
    `CreateTime` datetime NULL,
    `FinishTime` datetime NULL,
    `Actor` varchar(1000) NULL COMMENT '参与者用户名',
    `Command` varchar(50) NULL COMMENT '与活动执行的命令一致',
    `ActorDescription` varchar(1000) NULL COMMENT '参与用户的描述，真名',
    `RespondType` varchar(50) NOT NULL COMMENT '响应方式anyone,all',
    `ActivityState` tinyint(3) UNSIGNED Default 0 NOT NULL,
    `ActivityRemark` varchar(500) NULL,
    PRIMARY KEY (`ActivityInstanceID`) 
);

comment = '流程实例：活动节点';

CREATE TABLE `WF_App` 
(
    `AppID` varchar(50) NOT NULL COMMENT '流程应用ID（应用别名相同）',
    `AppName` varchar(100) NOT NULL COMMENT '应用名称',
    `Description` varchar(500) NULL COMMENT '应用描述',
    `FormPath` varchar(255) NULL COMMENT '表单控件的地址（Control地址，Action为固定）',
    `IsEnable` bit Default 1 NULL COMMENT '状态0:停用1启用',
    `SheetNumberFormat` varchar(50) Default "0" NULL COMMENT '工单号尾数format格式化表达式如：{0:0000}',
    `SheetNumberCycle` varchar(50) NULL COMMENT '工单号尾数的周期起始点 yyyy-MM-20 00:00:00  月为周期， yyyy-01-20 00:00:00 年为周期  yyyy-MM-dd 00:00:00日为周期 ，即发启时间的周期间隔',
    `WorkflowID` char(36) NULL,
    `WorkflowName` varchar(50) NULL,
    `AllowRoleIDs` varchar(740) NULL COMMENT '限制访问的角色',
    `AllowRoleNames` varchar(740) NULL,
    `Creator` varchar(50) NULL COMMENT '创建者',
    `CreateTime` datetime NOT NULL COMMENT '创建时间默认getdate()',
    PRIMARY KEY (`AppID`) 
);

comment = '流程应用';

CREATE TABLE `WF_Definition` 
(
    `WorkflowID` char(36) NOT NULL COMMENT '流程定义ID',
    `WorkflowName` varchar(50) NOT NULL COMMENT '流程名称',
    `Version` int Default 1 NOT NULL COMMENT '流程版本号',
    `IsEnableReject` bit Default 0 NOT NULL,
    `IsEnableCirculate` bit Default 0 NOT NULL,
    `IsEnableTransmit` int Default 0 NOT NULL,
    `IsEnableWithdraw` bit Default 0 NOT NULL,
    `IsEnableInvalid` bit Default 0 NOT NULL,
    `IsShowFlowMap` bit Default 1 NULL COMMENT '是否默认显示流程图',
    `IsHistoryActorPriority` bit Default 1 NOT NULL,
    `IsShowOpinion` int Default 1 NOT NULL,
    `Creator` varchar(50) NOT NULL COMMENT '流程创建者用户名',
    `CreateTime` datetime NOT NULL COMMENT '创建时间',
    `Updator` varchar(50) NOT NULL COMMENT '最后流程更新者用户名',
    `UpdateTime` datetime NOT NULL COMMENT '最后更新时间',
    `Remark` varchar(200) NULL COMMENT '备注说明',
    `AreaMap` varchar(1000) NULL,
    `IsDeleted` bit Default 0 NOT NULL COMMENT '是否已删除，默认0未删除，1已删除',
    PRIMARY KEY (`WorkflowID`) 
);

comment = '流程定义';

CREATE TABLE `WF_Instance` 
(
    `InstanceID` char(36) NOT NULL COMMENT '流程实例ID',
    `OpenBizDate` varchar(10) NOT NULL COMMENT '开单日期',
    `WorkflowID` char(36) NOT NULL COMMENT '流程定义ID',
    `AppID` varchar(50) NOT NULL COMMENT '流程应用ID',
    `StartTime` datetime NOT NULL COMMENT '流程实例发起时间',
    `FinishTime` datetime NULL COMMENT '流程实例完成时间',
    `SheetID` varchar(100) NULL COMMENT '受理号',
    `FormID` varchar(50) NULL COMMENT '表单主键ID',
    `InstanceState` int Default 0 NOT NULL COMMENT '0:拟稿（未创建实例时）；1：初始（草稿）状态；2：流程运行中；3：流程已完成；4：挂起中 ；5：退回提单； 99：流程取消作废；100：已删除',
    `CreatorID` varchar(50) NOT NULL COMMENT '创建人ID',
    `Creator` varchar(50) NOT NULL COMMENT '创建人用户名',
    `CreatorFullName` varchar(50) NULL COMMENT '创建人姓名',
    `CreatorOrgID` varchar(50) NOT NULL COMMENT '创建人部门ID',
    `CreatorOrgName` varchar(50) NULL COMMENT '创建人部门名称',
    `InstanceTitle` varchar(200) NOT NULL COMMENT '流程实例标题',
    `Urgency` tinyint(3) UNSIGNED Default 0 NULL COMMENT '紧急程度:0：一般1：紧急2：特别紧急3：最紧急   ',
    `Importance` tinyint(3) UNSIGNED NULL COMMENT '重要级别0：一般 1：重要 2：特别重要   ',
    `MainInstanceID` varchar(50) NULL,
    `MainActivityInstanceID` varchar(50) NULL,
    PRIMARY KEY (`InstanceID`) 
);

comment = '流程实例';

CREATE TABLE `WF_TaskInstance` 
(
    `TaskID` char(36) NOT NULL COMMENT '任务实例 ID',
    `FromTaskID` char(36) NOT NULL COMMENT '来自（第一步时为空GUID）',
    `InstanceID` char(36) NOT NULL COMMENT '流程实例ID',
    `AppID` varchar(50) NOT NULL COMMENT '流程应用ID',
    `WorkflowID` char(36) NOT NULL COMMENT '流程定义ID',
    `StepID` int NULL COMMENT '活动序号ID',
    `TaskSeq` varchar(200) NULL COMMENT '任务序列号,记录任务有时序顺序,规则：开始为00，第二步为00-01、00-02 第三步发给了三个人00-01-01、00-01-02、00-01-03根据人不断增加',
    `UserID` varchar(50) NOT NULL COMMENT '用户ID(有员工辞职后将从用户表中修改用户名称即可，这样新员工可以看到老员工的工作历史记录)',
    `UserName` varchar(50) NOT NULL COMMENT '用户名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）',
    `FullName` varchar(50) NOT NULL COMMENT '姓名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）',
    `OrgID` varchar(50) NOT NULL COMMENT '用户部门ID',
    `OrgName` varchar(50) NULL COMMENT '处理人部门名称',
    `Email` varchar(50) NULL,
    `Mobile` varchar(16) NULL,
    `ActivityInstanceID` char(36) NULL,
    `ActivityID` char(36) NULL COMMENT '活动ID',
    `ActivityName` varchar(50) NULL,
    `TaskState` int Default 0 NULL COMMENT '状态0未读1已读 2已完成',
    `IsCompleter` bit Default 0 NULL COMMENT '是否为活动最后结束者',
    `Opinion` varchar(500) NULL COMMENT '审批意见',
    `IsValid` bit Default 1 NULL COMMENT '是否有效任务，当被强制回收时此字段值为false表示为无效任务或已被回收了（当任一人响应时，回收其它未处理的活动实例内任务），',
    `IsCirculate` bit Default 0 NULL COMMENT '是否为传阅',
    `IsTransmit` bit Default 0 NULL COMMENT '是否转交',
    `FromCreator` varchar(50) NULL COMMENT '谁创建的，谁发送过来的',
    `FromCreatorID` varchar(50) NULL COMMENT '谁创建的，谁发送过来的用户ID',
    `FinishTime` datetime NULL COMMENT '完成时间',
    `CreateTime` datetime NULL,
    PRIMARY KEY (`TaskID`) 
);

comment = '流程实例：待办任务';

CREATE TABLE `WF_Transition` 
(
    `TransitionID` char(36) NOT NULL COMMENT '与前继ActivityId值一样',
    `WorkflowID` char(36) NOT NULL,
    `FromActivityID` char(36) NOT NULL,
    `ToActivityID` char(36) NOT NULL COMMENT '后续活动定义ID',
    `Remark` varchar(200) NULL COMMENT '备注',
    `LineType` varchar(50) NULL,
    `PostionM` decimal(18,2) NULL,
    `IsJoinRequire` bit Default 0 NOT NULL COMMENT '是否必参与迁移',
    `GroupName` varchar(10) NULL COMMENT '迁移条件分组（可指定分组后最少到达的数量）',
    `GroupNum` int Default 1 NULL COMMENT '可指定分组后最少到达的数量',
    `CreateTime` datetime NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`TransitionID`) 
);

comment = '流程定义：迁移线';

CREATE TABLE `WF_TransitionInstance` 
(
    `TransitionInstanceID` char(36) NOT NULL COMMENT '本活动实例ID',
    `InstanceID` char(36) NOT NULL,
    `FromActivityInstanceID` char(36) NOT NULL COMMENT '上一活动实例ID',
    `FromActivityID` char(36) NOT NULL,
    `ToActivityInstanceID` char(36) NOT NULL,
    `ToActivityID` char(36) NOT NULL,
    `TransitionState` tinyint(3) UNSIGNED Default 0 NOT NULL,
    `CreateTime` datetime NOT NULL COMMENT '创建时间',
    PRIMARY KEY (`TransitionInstanceID`) 
);

comment = '流程实例：迁移线';

CREATE TABLE `WF_Activity` 
(
    `ActivityID` char(36) NOT NULL COMMENT '流程活动ID',
    `WorkflowID` char(36) NULL,
    `StepID` int Default 1 NOT NULL COMMENT '序号ID',
    `ActivityName` varchar(50) NOT NULL COMMENT '活动名称',
    `ActivityType` varchar(20) Default "ormal" NOT NULL COMMENT '开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ',
    `ActorParser` varchar(200) NULL COMMENT '参与者解析器',
    `ActorParamter` varchar(500) NULL COMMENT '参与者解析器参数，每种解析自身对应XML格式数据',
    `Remark` varchar(300) NULL COMMENT '步骤描述',
    `JoinType` varchar(20) Default "JoinXOR" NOT NULL COMMENT '转入模式规则JoinXOR异或;JoinAnd并,JoinOR或',
    `SplitType` varchar(20) Default "JoinXOR" NOT NULL COMMENT '转出模式SplitXOR异或;SplitAnd并,SplitOR',
    `RespondType` varchar(10) Default "anyone" NOT NULL COMMENT 'anyone任一人，all全部人',
    `RejectType` varchar(20) NULL COMMENT '退回类型：None不可退回，提单OnlyStart，OnlyPreActivity 上一步，OnlyStartOrPreActivity提单或上一步，AnyHistoryActivity 任意历史可退步骤，默认OnlyStart',
    `RejectActivity` varchar(500) NULL,
    `CirculateActor` varchar(500) NULL COMMENT '当进入此步骤时自动传阅工单到此传阅中的人',
    `PositionX` int Default 0 NOT NULL COMMENT '图程图所在X位标',
    `PositionY` int Default 0 NOT NULL COMMENT '图程图所在Y位标',
    `Width` int NOT NULL,
    `Height` int NOT NULL,
    `CirculateType` varchar(20) Default "(0)" NOT NULL,
    `SubAppID` varchar(10) NULL,
    `SubAssembly` varchar(100) NULL,
    `IsEditForm` bit Default 1 NOT NULL COMMENT '是否允许编辑表单默认为true',
    `IsDeleted` bit Default 0 NOT NULL,
    `IsShowOpinion` bit Default 1 NOT NULL,
    `IsOpinionRequire` bit Default 0 NOT NULL COMMENT '审批意见是否必填 默认为fase',
    `IsEnableTransmit` bit Default 0 NULL COMMENT '是否允许转交默认为否',
    `IsHistoryActorPriority` bit Default 1 NOT NULL,
    `IsActorSpread` bit Default 1 NOT NULL,
    `CreateTime` datetime NOT NULL,
    PRIMARY KEY (`ActivityID`) 
);

comment = '流程定义：活动节点';

