CREATE TABLE [WF_ActivityInstance] 
(
    [ActivityInstanceID] uniqueidentifier Default (newid()) NOT NULL,
    [InstanceID] uniqueidentifier Default newid() NOT NULL,
    [WorkflowID] uniqueidentifier Default newid() NOT NULL,
    [AppID] nvarchar(50) NOT NULL,
    [StepID] int NULL,
    [ActivityID] uniqueidentifier NOT NULL,
    [ActivityName] nvarchar(50) NULL,
    [ActivityType] nvarchar(50) NULL,
    [CreateTime] datetime Default getdate() NULL,
    [FinishTime] datetime NULL,
    [Actor] nvarchar(1000) NULL,
    [Command] nvarchar(50) NULL,
    [ActorDescription] nvarchar(1000) NULL,
    [RespondType] nvarchar(50) NOT NULL,
    [ActivityState] tinyint Default 0 NOT NULL,
    [ActivityRemark] nvarchar(500) NULL,
    PRIMARY KEY ([ActivityInstanceID]) 
)

exec sp_addextendedproperty N'MS_Description', N'流程实例ID', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'InstanceID';
exec sp_addextendedproperty N'MS_Description', N'流程定义ID', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'WorkflowID';
exec sp_addextendedproperty N'MS_Description', N'流程应用ID', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'AppID';
exec sp_addextendedproperty N'MS_Description', N'活动序号ID，提单步骤为1', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'StepID';
exec sp_addextendedproperty N'MS_Description', N'活动ID', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'ActivityID';
exec sp_addextendedproperty N'MS_Description', N'开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'ActivityType';
exec sp_addextendedproperty N'MS_Description', N'参与者用户名', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'Actor';
exec sp_addextendedproperty N'MS_Description', N'与活动执行的命令一致', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'Command';
exec sp_addextendedproperty N'MS_Description', N'参与用户的描述，真名', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'ActorDescription';
exec sp_addextendedproperty N'MS_Description', N'响应方式anyone,all', N'user', N'dbo', N'table', N'WF_ActivityInstance', N'column', N'RespondType';
exec sp_addextendedproperty N'MS_Description', N'流程节点：运行实例', N'user', N'dbo', N'table', N'WF_ActivityInstance';

CREATE TABLE [WF_App] 
(
    [AppID] nvarchar(50) NOT NULL,
    [AppName] nvarchar(100) NOT NULL,
    [Description] nvarchar(500) NULL,
    [FormPath] nvarchar(255) NULL,
    [IsEnable] bit Default 1 NULL,
    [SheetNumberFormat] nvarchar(50) Default (N'0') NULL,
    [SheetNumberCycle] nvarchar(50) NULL,
    [WorkflowID] uniqueidentifier NULL,
    [WorkflowName] nvarchar(50) NULL,
    [AllowRoleIDs] nvarchar(740) NULL,
    [AllowRoleNames] nvarchar(740) NULL,
    [Creator] nvarchar(50) NULL,
    [CreateTime] datetime Default getdate() NOT NULL,
    PRIMARY KEY ([AppID]) 
)

exec sp_addextendedproperty N'MS_Description', N'流程应用ID（应用别名相同）', N'user', N'dbo', N'table', N'WF_App', N'column', N'AppID';
exec sp_addextendedproperty N'MS_Description', N'应用名称', N'user', N'dbo', N'table', N'WF_App', N'column', N'AppName';
exec sp_addextendedproperty N'MS_Description', N'应用描述', N'user', N'dbo', N'table', N'WF_App', N'column', N'Description';
exec sp_addextendedproperty N'MS_Description', N'表单控件的地址（Control地址，Action为固定）', N'user', N'dbo', N'table', N'WF_App', N'column', N'FormPath';
exec sp_addextendedproperty N'MS_Description', N'状态0:停用1启用', N'user', N'dbo', N'table', N'WF_App', N'column', N'IsEnable';
exec sp_addextendedproperty N'MS_Description', N'工单号尾数format格式化表达式如：{0:0000}', N'user', N'dbo', N'table', N'WF_App', N'column', N'SheetNumberFormat';
exec sp_addextendedproperty N'MS_Description', N'工单号尾数的周期起始点 yyyy-MM-20 00:00:00  月为周期， yyyy-01-20 00:00:00 年为周期  yyyy-MM-dd 00:00:00日为周期 ，即发启时间的周期间隔', N'user', N'dbo', N'table', N'WF_App', N'column', N'SheetNumberCycle';
exec sp_addextendedproperty N'MS_Description', N'限制访问的角色', N'user', N'dbo', N'table', N'WF_App', N'column', N'AllowRoleIDs';
exec sp_addextendedproperty N'MS_Description', N'创建者', N'user', N'dbo', N'table', N'WF_App', N'column', N'Creator';
exec sp_addextendedproperty N'MS_Description', N'创建时间默认getdate()', N'user', N'dbo', N'table', N'WF_App', N'column', N'CreateTime';
exec sp_addextendedproperty N'MS_Description', N'工作流应用', N'user', N'dbo', N'table', N'WF_App';

CREATE TABLE [WF_Definition] 
(
    [WorkflowID] uniqueidentifier Default (newid()) NOT NULL,
    [WorkflowName] nvarchar(50) NOT NULL,
    [Version] int Default 1 NOT NULL,
    [IsEnableReject] bit Default 0 NOT NULL,
    [IsEnableCirculate] bit Default 0 NOT NULL,
    [IsEnableTransmit] int Default 0 NOT NULL,
    [IsEnableWithdraw] bit Default 0 NOT NULL,
    [IsEnableInvalid] bit Default 0 NOT NULL,
    [IsShowFlowMap] bit Default 1 NULL,
    [IsHistoryActorPriority] bit Default 1 NOT NULL,
    [IsShowOpinion] int Default 1 NOT NULL,
    [Creator] nvarchar(50) NOT NULL,
    [CreateTime] datetime Default getdate() NOT NULL,
    [Updator] nvarchar(50) NOT NULL,
    [UpdateTime] datetime Default getdate() NOT NULL,
    [Remark] nvarchar(200) NULL,
    [AreaMap] nvarchar(1000) NULL,
    [IsDeleted] bit Default 0 NOT NULL,
    PRIMARY KEY ([WorkflowID]) 
)

exec sp_addextendedproperty N'MS_Description', N'流程定义ID', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'WorkflowID';
exec sp_addextendedproperty N'MS_Description', N'流程名称', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'WorkflowName';
exec sp_addextendedproperty N'MS_Description', N'流程版本号', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'Version';
exec sp_addextendedproperty N'MS_Description', N'是否默认显示流程图', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'IsShowFlowMap';
exec sp_addextendedproperty N'MS_Description', N'流程创建者用户名', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'Creator';
exec sp_addextendedproperty N'MS_Description', N'创建时间', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'CreateTime';
exec sp_addextendedproperty N'MS_Description', N'最后流程更新者用户名', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'Updator';
exec sp_addextendedproperty N'MS_Description', N'最后更新时间', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'UpdateTime';
exec sp_addextendedproperty N'MS_Description', N'备注说明', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'Remark';
exec sp_addextendedproperty N'MS_Description', N'是否已删除，默认0未删除，1已删除', N'user', N'dbo', N'table', N'WF_Definition', N'column', N'IsDeleted';
exec sp_addextendedproperty N'MS_Description', N'流程定义', N'user', N'dbo', N'table', N'WF_Definition';

CREATE TABLE [WF_Instance] 
(
    [InstanceID] uniqueidentifier Default (newid()) NOT NULL,
    [OpenBizDate] nvarchar(10) NOT NULL,
    [WorkflowID] uniqueidentifier Default newid() NOT NULL,
    [AppID] nvarchar(50) NOT NULL,
    [StartTime] datetime NOT NULL,
    [FinishTime] datetime NULL,
    [SheetID] nvarchar(100) NULL,
    [FormID] nvarchar(50) NULL,
    [InstanceState] int Default 0 NOT NULL,
    [CreatorID] nvarchar(50) NOT NULL,
    [Creator] nvarchar(50) NOT NULL,
    [CreatorFullName] nvarchar(50) NULL,
    [CreatorOrgID] nvarchar(50) NOT NULL,
    [CreatorOrgName] nvarchar(50) NULL,
    [InstanceTitle] nvarchar(200) NOT NULL,
    [Urgency] tinyint Default 0 NULL,
    [Importance] tinyint NULL,
    [MainInstanceID] nvarchar(50) NULL,
    [MainActivityInstanceID] nvarchar(50) NULL,
    PRIMARY KEY ([InstanceID]) 
)

exec sp_addextendedproperty N'MS_Description', N'流程实例ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'InstanceID';
exec sp_addextendedproperty N'MS_Description', N'开单日期', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'OpenBizDate';
exec sp_addextendedproperty N'MS_Description', N'流程定义ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'WorkflowID';
exec sp_addextendedproperty N'MS_Description', N'流程应用ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'AppID';
exec sp_addextendedproperty N'MS_Description', N'流程实例发起时间', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'StartTime';
exec sp_addextendedproperty N'MS_Description', N'流程实例完成时间', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'FinishTime';
exec sp_addextendedproperty N'MS_Description', N'受理号', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'SheetID';
exec sp_addextendedproperty N'MS_Description', N'表单主键ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'FormID';
exec sp_addextendedproperty N'MS_Description', N'0:拟稿（未创建实例时）；1：初始（草稿）状态；2：流程运行中；3：流程已完成；4：挂起中 ；5：退回提单； 99：流程取消作废；100：已删除', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'InstanceState';
exec sp_addextendedproperty N'MS_Description', N'创建人ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'CreatorID';
exec sp_addextendedproperty N'MS_Description', N'创建人用户名', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'Creator';
exec sp_addextendedproperty N'MS_Description', N'创建人姓名', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'CreatorFullName';
exec sp_addextendedproperty N'MS_Description', N'创建人部门ID', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'CreatorOrgID';
exec sp_addextendedproperty N'MS_Description', N'创建人部门名称', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'CreatorOrgName';
exec sp_addextendedproperty N'MS_Description', N'流程实例标题', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'InstanceTitle';
exec sp_addextendedproperty N'MS_Description', N'紧急程度:0：一般1：紧急2：特别紧急3：最紧急   ', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'Urgency';
exec sp_addextendedproperty N'MS_Description', N'重要级别0：一般 1：重要 2：特别重要   ', N'user', N'dbo', N'table', N'WF_Instance', N'column', N'Importance';
exec sp_addextendedproperty N'MS_Description', N'流程实例', N'user', N'dbo', N'table', N'WF_Instance';

CREATE TABLE [WF_TaskInstance] 
(
    [TaskID] uniqueidentifier Default (newid()) NOT NULL,
    [FromTaskID] uniqueidentifier NOT NULL,
    [InstanceID] uniqueidentifier NOT NULL,
    [AppID] nvarchar(50) NOT NULL,
    [WorkflowID] uniqueidentifier NOT NULL,
    [StepID] int NULL,
    [TaskSeq] nvarchar(200) NULL,
    [UserID] nvarchar(50) NOT NULL,
    [UserName] nvarchar(50) NOT NULL,
    [FullName] nvarchar(50) NOT NULL,
    [OrgID] nvarchar(50) NOT NULL,
    [OrgName] nvarchar(50) NULL,
    [Email] nvarchar(50) NULL,
    [Mobile] nvarchar(16) NULL,
    [ActivityInstanceID] uniqueidentifier NULL,
    [ActivityID] uniqueidentifier NULL,
    [ActivityName] nvarchar(50) NULL,
    [TaskState] int Default 0 NULL,
    [IsCompleter] bit Default 0 NULL,
    [Opinion] nvarchar(500) NULL,
    [IsValid] bit Default 1 NULL,
    [IsCirculate] bit Default 0 NULL,
    [IsTransmit] bit Default 0 NULL,
    [FromCreator] nvarchar(50) NULL,
    [FromCreatorID] nvarchar(50) NULL,
    [FinishTime] datetime NULL,
    [CreateTime] datetime Default getdate() NULL,
    PRIMARY KEY ([TaskID]) 
)

exec sp_addextendedproperty N'MS_Description', N'任务实例 ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'TaskID';
exec sp_addextendedproperty N'MS_Description', N'来自（第一步时为空GUID）', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'FromTaskID';
exec sp_addextendedproperty N'MS_Description', N'流程实例ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'InstanceID';
exec sp_addextendedproperty N'MS_Description', N'流程应用ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'AppID';
exec sp_addextendedproperty N'MS_Description', N'流程定义ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'WorkflowID';
exec sp_addextendedproperty N'MS_Description', N'活动序号ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'StepID';
exec sp_addextendedproperty N'MS_Description', N'任务序列号,记录任务有时序顺序,规则：开始为00，第二步为00-01、00-02 第三步发给了三个人00-01-01、00-01-02、00-01-03根据人不断增加', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'TaskSeq';
exec sp_addextendedproperty N'MS_Description', N'用户ID(有员工辞职后将从用户表中修改用户名称即可，这样新员工可以看到老员工的工作历史记录)', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'UserID';
exec sp_addextendedproperty N'MS_Description', N'用户名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'UserName';
exec sp_addextendedproperty N'MS_Description', N'姓名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'FullName';
exec sp_addextendedproperty N'MS_Description', N'用户部门ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'OrgID';
exec sp_addextendedproperty N'MS_Description', N'处理人部门名称', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'OrgName';
exec sp_addextendedproperty N'MS_Description', N'活动ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'ActivityID';
exec sp_addextendedproperty N'MS_Description', N'状态0未读1已读 2已完成', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'TaskState';
exec sp_addextendedproperty N'MS_Description', N'是否为活动最后结束者', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'IsCompleter';
exec sp_addextendedproperty N'MS_Description', N'审批意见', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'Opinion';
exec sp_addextendedproperty N'MS_Description', N'是否有效任务，当被强制回收时此字段值为false表示为无效任务或已被回收了（当任一人响应时，回收其它未处理的活动实例内任务），', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'IsValid';
exec sp_addextendedproperty N'MS_Description', N'是否为传阅', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'IsCirculate';
exec sp_addextendedproperty N'MS_Description', N'是否转交', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'IsTransmit';
exec sp_addextendedproperty N'MS_Description', N'谁创建的，谁发送过来的', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'FromCreator';
exec sp_addextendedproperty N'MS_Description', N'谁创建的，谁发送过来的用户ID', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'FromCreatorID';
exec sp_addextendedproperty N'MS_Description', N'完成时间', N'user', N'dbo', N'table', N'WF_TaskInstance', N'column', N'FinishTime';
exec sp_addextendedproperty N'MS_Description', N'流程运转任务', N'user', N'dbo', N'table', N'WF_TaskInstance';

CREATE TABLE [WF_Transition] 
(
    [TransitionID] uniqueidentifier Default (newid()) NOT NULL,
    [WorkflowID] uniqueidentifier NOT NULL,
    [FromActivityID] uniqueidentifier NOT NULL,
    [ToActivityID] uniqueidentifier NOT NULL,
    [Remark] nvarchar(200) NULL,
    [LineType] nvarchar(50) NULL,
    [PostionM] decimal(18,2) NULL,
    [IsJoinRequire] bit Default 0 NOT NULL,
    [GroupName] nvarchar(10) NULL,
    [GroupNum] int Default 1 NULL,
    [CreateTime] datetime Default getdate() NOT NULL,
    PRIMARY KEY ([TransitionID]) 
)

exec sp_addextendedproperty N'MS_Description', N'与前继ActivityId值一样', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'TransitionID';
exec sp_addextendedproperty N'MS_Description', N'后续活动定义ID', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'ToActivityID';
exec sp_addextendedproperty N'MS_Description', N'备注', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'Remark';
exec sp_addextendedproperty N'MS_Description', N'是否必参与迁移', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'IsJoinRequire';
exec sp_addextendedproperty N'MS_Description', N'迁移条件分组（可指定分组后最少到达的数量）', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'GroupName';
exec sp_addextendedproperty N'MS_Description', N'可指定分组后最少到达的数量', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'GroupNum';
exec sp_addextendedproperty N'MS_Description', N'创建时间', N'user', N'dbo', N'table', N'WF_Transition', N'column', N'CreateTime';
exec sp_addextendedproperty N'MS_Description', N'流程定义：迁移线', N'user', N'dbo', N'table', N'WF_Transition';

CREATE TABLE [WF_TransitionInstance] 
(
    [TransitionInstanceID] uniqueidentifier Default (newid()) NOT NULL,
    [InstanceID] uniqueidentifier Default newid() NOT NULL,
    [FromActivityInstanceID] uniqueidentifier NOT NULL,
    [FromActivityID] uniqueidentifier NOT NULL,
    [ToActivityInstanceID] uniqueidentifier Default newid() NOT NULL,
    [ToActivityID] uniqueidentifier Default newid() NOT NULL,
    [TransitionState] tinyint Default 0 NOT NULL,
    [CreateTime] datetime Default getdate() NOT NULL,
    PRIMARY KEY ([TransitionInstanceID]) 
)

exec sp_addextendedproperty N'MS_Description', N'本活动实例ID', N'user', N'dbo', N'table', N'WF_TransitionInstance', N'column', N'TransitionInstanceID';
exec sp_addextendedproperty N'MS_Description', N'上一活动实例ID', N'user', N'dbo', N'table', N'WF_TransitionInstance', N'column', N'FromActivityInstanceID';
exec sp_addextendedproperty N'MS_Description', N'创建时间', N'user', N'dbo', N'table', N'WF_TransitionInstance', N'column', N'CreateTime';
exec sp_addextendedproperty N'MS_Description', N'流程迁移线：运行实例', N'user', N'dbo', N'table', N'WF_TransitionInstance';

CREATE TABLE [WF_Activity] 
(
    [ActivityID] uniqueidentifier Default (newid()) NOT NULL,
    [WorkflowID] uniqueidentifier NULL,
    [StepID] int Default 1 NOT NULL,
    [ActivityName] nvarchar(50) NOT NULL,
    [ActivityType] nvarchar(20) Default (N'ormal') NOT NULL,
    [ActorParser] nvarchar(200) NULL,
    [ActorParamter] nvarchar(500) NULL,
    [Remark] nvarchar(300) NULL,
    [JoinType] nvarchar(20) Default (N'JoinXOR') NOT NULL,
    [SplitType] nvarchar(20) Default (N'JoinXOR') NOT NULL,
    [RespondType] nvarchar(10) Default (N'anyone') NOT NULL,
    [RejectType] nvarchar(20) NULL,
    [RejectActivity] nvarchar(500) NULL,
    [CirculateActor] nvarchar(500) NULL,
    [PositionX] int Default 0 NOT NULL,
    [PositionY] int Default 0 NOT NULL,
    [Width] int NOT NULL,
    [Height] int NOT NULL,
    [CirculateType] nvarchar(20) Default (N'(0)') NOT NULL,
    [SubAppID] nvarchar(10) NULL,
    [SubAssembly] nvarchar(100) NULL,
    [IsEditForm] bit Default 1 NOT NULL,
    [IsDeleted] bit Default 0 NOT NULL,
    [IsShowOpinion] bit Default 1 NOT NULL,
    [IsOpinionRequire] bit Default 0 NOT NULL,
    [IsEnableTransmit] bit Default 0 NULL,
    [IsHistoryActorPriority] bit Default 1 NOT NULL,
    [IsActorSpread] bit Default 1 NOT NULL,
    [CreateTime] datetime Default getdate() NOT NULL,
    PRIMARY KEY ([ActivityID]) 
)

exec sp_addextendedproperty N'MS_Description', N'流程活动ID', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'ActivityID';
exec sp_addextendedproperty N'MS_Description', N'序号ID', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'StepID';
exec sp_addextendedproperty N'MS_Description', N'活动名称', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'ActivityName';
exec sp_addextendedproperty N'MS_Description', N'开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'ActivityType';
exec sp_addextendedproperty N'MS_Description', N'参与者解析器', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'ActorParser';
exec sp_addextendedproperty N'MS_Description', N'参与者解析器参数，每种解析自身对应XML格式数据', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'ActorParamter';
exec sp_addextendedproperty N'MS_Description', N'步骤描述', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'Remark';
exec sp_addextendedproperty N'MS_Description', N'转入模式规则JoinXOR异或;JoinAnd并,JoinOR或', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'JoinType';
exec sp_addextendedproperty N'MS_Description', N'转出模式SplitXOR异或;SplitAnd并,SplitOR', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'SplitType';
exec sp_addextendedproperty N'MS_Description', N'anyone任一人，all全部人', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'RespondType';
exec sp_addextendedproperty N'MS_Description', N'退回类型：None不可退回，提单OnlyStart，OnlyPreActivity 上一步，OnlyStartOrPreActivity提单或上一步，AnyHistoryActivity 任意历史可退步骤，默认OnlyStart', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'RejectType';
exec sp_addextendedproperty N'MS_Description', N'当进入此步骤时自动传阅工单到此传阅中的人', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'CirculateActor';
exec sp_addextendedproperty N'MS_Description', N'图程图所在X位标', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'PositionX';
exec sp_addextendedproperty N'MS_Description', N'图程图所在Y位标', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'PositionY';
exec sp_addextendedproperty N'MS_Description', N'是否允许编辑表单默认为true', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'IsEditForm';
exec sp_addextendedproperty N'MS_Description', N'审批意见是否必填 默认为fase', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'IsOpinionRequire';
exec sp_addextendedproperty N'MS_Description', N'是否允许转交默认为否', N'user', N'dbo', N'table', N'WF_Activity', N'column', N'IsEnableTransmit';
exec sp_addextendedproperty N'MS_Description', N'流程定义：流程节点', N'user', N'dbo', N'table', N'WF_Activity';

