CREATE TABLE WF_ActivityInstance 
(
    ActivityInstanceID char(36) Default (SYS_GUID()) NOT NULL,
    InstanceID char(36) Default SYS_GUID() NOT NULL,
    WorkflowID char(36) Default SYS_GUID() NOT NULL,
    AppID nvarchar2(50) NOT NULL,
    StepID NUMBER(10) NULL,
    ActivityID char(36) NOT NULL,
    ActivityName nvarchar2(50) NULL,
    ActivityType nvarchar2(50) NULL,
    CreateTime date Default sysdate NULL,
    FinishTime date NULL,
    Actor nvarchar2(1000) NULL,
    Command nvarchar2(50) NULL,
    ActorDescription nvarchar2(1000) NULL,
    RespondType nvarchar2(50) NOT NULL,
    ActivityState NUMBER(3) Default 0 NOT NULL,
    ActivityRemark nvarchar2(500) NULL,
    PRIMARY KEY (ActivityInstanceID) 
)

comment on column WF_ACTIVITYINSTANCE.INSTANCEID  is '流程实例ID';
comment on column WF_ACTIVITYINSTANCE.WORKFLOWID  is '流程定义ID';
comment on column WF_ACTIVITYINSTANCE.APPID  is '流程应用ID';
comment on column WF_ACTIVITYINSTANCE.STEPID  is '活动序号ID，提单步骤为1';
comment on column WF_ACTIVITYINSTANCE.ACTIVITYID  is '活动ID';
comment on column WF_ACTIVITYINSTANCE.ACTIVITYTYPE  is '开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ';
comment on column WF_ACTIVITYINSTANCE.ACTOR  is '参与者用户名';
comment on column WF_ACTIVITYINSTANCE.COMMAND  is '与活动执行的命令一致';
comment on column WF_ACTIVITYINSTANCE.ACTORDESCRIPTION  is '参与用户的描述，真名';
comment on column WF_ACTIVITYINSTANCE.RESPONDTYPE  is '响应方式anyone,all';
comment on table WF_ACTIVITYINSTANCE  is '流程实例：活动节点';

CREATE TABLE WF_App 
(
    AppID nvarchar2(50) NOT NULL,
    AppName nvarchar2(100) NOT NULL,
    Description nvarchar2(500) NULL,
    FormPath nvarchar2(255) NULL,
    IsEnable NUMBER(1) Default 1 NULL,
    SheetNumberFormat nvarchar2(50) Default '0' NULL,
    SheetNumberCycle nvarchar2(50) NULL,
    WorkflowID char(36) NULL,
    WorkflowName nvarchar2(50) NULL,
    AllowRoleIDs nvarchar2(740) NULL,
    AllowRoleNames nvarchar2(740) NULL,
    Creator nvarchar2(50) NULL,
    CreateTime date Default sysdate NOT NULL,
    PRIMARY KEY (AppID) 
)

comment on column WF_APP.APPID  is '流程应用ID（应用别名相同）';
comment on column WF_APP.APPNAME  is '应用名称';
comment on column WF_APP.DESCRIPTION  is '应用描述';
comment on column WF_APP.FORMPATH  is '表单控件的地址（Control地址，Action为固定）';
comment on column WF_APP.ISENABLE  is '状态0:停用1启用';
comment on column WF_APP.SHEETNUMBERFORMAT  is '工单号尾数format格式化表达式如：{0:0000}';
comment on column WF_APP.SHEETNUMBERCYCLE  is '工单号尾数的周期起始点 yyyy-MM-20 00:00:00  月为周期， yyyy-01-20 00:00:00 年为周期  yyyy-MM-dd 00:00:00日为周期 ，即发启时间的周期间隔';
comment on column WF_APP.ALLOWROLEIDS  is '限制访问的角色';
comment on column WF_APP.CREATOR  is '创建者';
comment on column WF_APP.CREATETIME  is '创建时间默认getdate()';
comment on table WF_APP  is '流程应用';

CREATE TABLE WF_Definition 
(
    WorkflowID char(36) Default (SYS_GUID()) NOT NULL,
    WorkflowName nvarchar2(50) NOT NULL,
    Version NUMBER(10) Default 1 NOT NULL,
    IsEnableReject NUMBER(1) Default 0 NOT NULL,
    IsEnableCirculate NUMBER(1) Default 0 NOT NULL,
    IsEnableTransmit NUMBER(10) Default 0 NOT NULL,
    IsEnableWithdraw NUMBER(1) Default 0 NOT NULL,
    IsEnableInvalid NUMBER(1) Default 0 NOT NULL,
    IsShowFlowMap NUMBER(1) Default 1 NULL,
    IsHistoryActorPriority NUMBER(1) Default 1 NOT NULL,
    IsShowOpinion NUMBER(10) Default 1 NOT NULL,
    Creator nvarchar2(50) NOT NULL,
    CreateTime date Default sysdate NOT NULL,
    Updator nvarchar2(50) NOT NULL,
    UpdateTime date Default sysdate NOT NULL,
    Remark nvarchar2(200) NULL,
    AreaMap nvarchar2(1000) NULL,
    IsDeleted NUMBER(1) Default 0 NOT NULL,
    PRIMARY KEY (WorkflowID) 
)

comment on column WF_DEFINITION.WORKFLOWID  is '流程定义ID';
comment on column WF_DEFINITION.WORKFLOWNAME  is '流程名称';
comment on column WF_DEFINITION.VERSION  is '流程版本号';
comment on column WF_DEFINITION.ISSHOWFLOWMAP  is '是否默认显示流程图';
comment on column WF_DEFINITION.CREATOR  is '流程创建者用户名';
comment on column WF_DEFINITION.CREATETIME  is '创建时间';
comment on column WF_DEFINITION.UPDATOR  is '最后流程更新者用户名';
comment on column WF_DEFINITION.UPDATETIME  is '最后更新时间';
comment on column WF_DEFINITION.REMARK  is '备注说明';
comment on column WF_DEFINITION.ISDELETED  is '是否已删除，默认0未删除，1已删除';
comment on table WF_DEFINITION  is '流程定义';

CREATE TABLE WF_Instance 
(
    InstanceID char(36) Default (SYS_GUID()) NOT NULL,
    OpenBizDate nvarchar2(10) NOT NULL,
    WorkflowID char(36) Default SYS_GUID() NOT NULL,
    AppID nvarchar2(50) NOT NULL,
    StartTime date NOT NULL,
    FinishTime date NULL,
    SheetID nvarchar2(100) NULL,
    FormID nvarchar2(50) NULL,
    InstanceState NUMBER(10) Default 0 NOT NULL,
    CreatorID nvarchar2(50) NOT NULL,
    Creator nvarchar2(50) NOT NULL,
    CreatorFullName nvarchar2(50) NULL,
    CreatorOrgID nvarchar2(50) NOT NULL,
    CreatorOrgName nvarchar2(50) NULL,
    InstanceTitle nvarchar2(200) NOT NULL,
    Urgency NUMBER(3) Default 0 NULL,
    Importance NUMBER(3) NULL,
    MainInstanceID nvarchar2(50) NULL,
    MainActivityInstanceID nvarchar2(50) NULL,
    PRIMARY KEY (InstanceID) 
)

comment on column WF_INSTANCE.INSTANCEID  is '流程实例ID';
comment on column WF_INSTANCE.OPENBIZDATE  is '开单日期';
comment on column WF_INSTANCE.WORKFLOWID  is '流程定义ID';
comment on column WF_INSTANCE.APPID  is '流程应用ID';
comment on column WF_INSTANCE.STARTTIME  is '流程实例发起时间';
comment on column WF_INSTANCE.FINISHTIME  is '流程实例完成时间';
comment on column WF_INSTANCE.SHEETID  is '受理号';
comment on column WF_INSTANCE.FORMID  is '表单主键ID';
comment on column WF_INSTANCE.INSTANCESTATE  is '0:拟稿（未创建实例时）；1：初始（草稿）状态；2：流程运行中；3：流程已完成；4：挂起中 ；5：退回提单； 99：流程取消作废；100：已删除';
comment on column WF_INSTANCE.CREATORID  is '创建人ID';
comment on column WF_INSTANCE.CREATOR  is '创建人用户名';
comment on column WF_INSTANCE.CREATORFULLNAME  is '创建人姓名';
comment on column WF_INSTANCE.CREATORORGID  is '创建人部门ID';
comment on column WF_INSTANCE.CREATORORGNAME  is '创建人部门名称';
comment on column WF_INSTANCE.INSTANCETITLE  is '流程实例标题';
comment on column WF_INSTANCE.URGENCY  is '紧急程度:0：一般1：紧急2：特别紧急3：最紧急   ';
comment on column WF_INSTANCE.IMPORTANCE  is '重要级别0：一般 1：重要 2：特别重要   ';
comment on table WF_INSTANCE  is '流程实例';

CREATE TABLE WF_TaskInstance 
(
    TaskID char(36) Default (SYS_GUID()) NOT NULL,
    FromTaskID char(36) NOT NULL,
    InstanceID char(36) NOT NULL,
    AppID nvarchar2(50) NOT NULL,
    WorkflowID char(36) NOT NULL,
    StepID NUMBER(10) NULL,
    TaskSeq nvarchar2(200) NULL,
    UserID nvarchar2(50) NOT NULL,
    UserName nvarchar2(50) NOT NULL,
    FullName nvarchar2(50) NOT NULL,
    OrgID nvarchar2(50) NOT NULL,
    OrgName nvarchar2(50) NULL,
    Email nvarchar2(50) NULL,
    Mobile nvarchar2(16) NULL,
    ActivityInstanceID char(36) NULL,
    ActivityID char(36) NULL,
    ActivityName nvarchar2(50) NULL,
    TaskState NUMBER(10) Default 0 NULL,
    IsCompleter NUMBER(1) Default 0 NULL,
    Opinion nvarchar2(500) NULL,
    IsValid NUMBER(1) Default 1 NULL,
    IsCirculate NUMBER(1) Default 0 NULL,
    IsTransmit NUMBER(1) Default 0 NULL,
    FromCreator nvarchar2(50) NULL,
    FromCreatorID nvarchar2(50) NULL,
    FinishTime date NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (TaskID) 
)

comment on column WF_TASKINSTANCE.TASKID  is '任务实例 ID';
comment on column WF_TASKINSTANCE.FROMTASKID  is '来自（第一步时为空GUID）';
comment on column WF_TASKINSTANCE.INSTANCEID  is '流程实例ID';
comment on column WF_TASKINSTANCE.APPID  is '流程应用ID';
comment on column WF_TASKINSTANCE.WORKFLOWID  is '流程定义ID';
comment on column WF_TASKINSTANCE.STEPID  is '活动序号ID';
comment on column WF_TASKINSTANCE.TASKSEQ  is '任务序列号,记录任务有时序顺序,规则：开始为00，第二步为00-01、00-02 第三步发给了三个人00-01-01、00-01-02、00-01-03根据人不断增加';
comment on column WF_TASKINSTANCE.USERID  is '用户ID(有员工辞职后将从用户表中修改用户名称即可，这样新员工可以看到老员工的工作历史记录)';
comment on column WF_TASKINSTANCE.USERNAME  is '用户名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）';
comment on column WF_TASKINSTANCE.FULLNAME  is '姓名（记录历史的用户名，姓名，新旧员工交替时有迹可寻）';
comment on column WF_TASKINSTANCE.ORGID  is '用户部门ID';
comment on column WF_TASKINSTANCE.ORGNAME  is '处理人部门名称';
comment on column WF_TASKINSTANCE.ACTIVITYID  is '活动ID';
comment on column WF_TASKINSTANCE.TASKSTATE  is '状态0未读1已读 2已完成';
comment on column WF_TASKINSTANCE.ISCOMPLETER  is '是否为活动最后结束者';
comment on column WF_TASKINSTANCE.OPINION  is '审批意见';
comment on column WF_TASKINSTANCE.ISVALID  is '是否有效任务，当被强制回收时此字段值为false表示为无效任务或已被回收了（当任一人响应时，回收其它未处理的活动实例内任务），';
comment on column WF_TASKINSTANCE.ISCIRCULATE  is '是否为传阅';
comment on column WF_TASKINSTANCE.ISTRANSMIT  is '是否转交';
comment on column WF_TASKINSTANCE.FROMCREATOR  is '谁创建的，谁发送过来的';
comment on column WF_TASKINSTANCE.FROMCREATORID  is '谁创建的，谁发送过来的用户ID';
comment on column WF_TASKINSTANCE.FINISHTIME  is '完成时间';
comment on table WF_TASKINSTANCE  is '流程实例：待办任务';

CREATE TABLE WF_Transition 
(
    TransitionID char(36) Default (SYS_GUID()) NOT NULL,
    WorkflowID char(36) NOT NULL,
    FromActivityID char(36) NOT NULL,
    ToActivityID char(36) NOT NULL,
    Remark nvarchar2(200) NULL,
    LineType nvarchar2(50) NULL,
    PostionM NUMBER(18,2) NULL,
    IsJoinRequire NUMBER(1) Default 0 NOT NULL,
    GroupName nvarchar2(10) NULL,
    GroupNum NUMBER(10) Default 1 NULL,
    CreateTime date Default sysdate NOT NULL,
    PRIMARY KEY (TransitionID) 
)

comment on column WF_TRANSITION.TRANSITIONID  is '与前继ActivityId值一样';
comment on column WF_TRANSITION.TOACTIVITYID  is '后续活动定义ID';
comment on column WF_TRANSITION.REMARK  is '备注';
comment on column WF_TRANSITION.ISJOINREQUIRE  is '是否必参与迁移';
comment on column WF_TRANSITION.GROUPNAME  is '迁移条件分组（可指定分组后最少到达的数量）';
comment on column WF_TRANSITION.GROUPNUM  is '可指定分组后最少到达的数量';
comment on column WF_TRANSITION.CREATETIME  is '创建时间';
comment on table WF_TRANSITION  is '流程定义：迁移线';

CREATE TABLE WF_TransitionInstance 
(
    TransitionInstanceID char(36) Default (SYS_GUID()) NOT NULL,
    InstanceID char(36) Default SYS_GUID() NOT NULL,
    FromActivityInstanceID char(36) NOT NULL,
    FromActivityID char(36) NOT NULL,
    ToActivityInstanceID char(36) Default SYS_GUID() NOT NULL,
    ToActivityID char(36) Default SYS_GUID() NOT NULL,
    TransitionState NUMBER(3) Default 0 NOT NULL,
    CreateTime date Default sysdate NOT NULL,
    PRIMARY KEY (TransitionInstanceID) 
)

comment on column WF_TRANSITIONINSTANCE.TRANSITIONINSTANCEID  is '本活动实例ID';
comment on column WF_TRANSITIONINSTANCE.FROMACTIVITYINSTANCEID  is '上一活动实例ID';
comment on column WF_TRANSITIONINSTANCE.CREATETIME  is '创建时间';
comment on table WF_TRANSITIONINSTANCE  is '流程实例：迁移线';

CREATE TABLE WF_Activity 
(
    ActivityID char(36) Default (SYS_GUID()) NOT NULL,
    WorkflowID char(36) NULL,
    StepID NUMBER(10) Default 1 NOT NULL,
    ActivityName nvarchar2(50) NOT NULL,
    ActivityType nvarchar2(20) Default 'ormal' NOT NULL,
    ActorParser nvarchar2(200) NULL,
    ActorParamter nvarchar2(500) NULL,
    Remark nvarchar2(300) NULL,
    JoinType nvarchar2(20) Default 'JoinXOR' NOT NULL,
    SplitType nvarchar2(20) Default 'JoinXOR' NOT NULL,
    RespondType nvarchar2(10) Default 'anyone' NOT NULL,
    RejectType nvarchar2(20) NULL,
    RejectActivity nvarchar2(500) NULL,
    CirculateActor nvarchar2(500) NULL,
    PositionX NUMBER(10) Default 0 NOT NULL,
    PositionY NUMBER(10) Default 0 NOT NULL,
    Width NUMBER(10) NOT NULL,
    Height NUMBER(10) NOT NULL,
    CirculateType nvarchar2(20) Default '(0)' NOT NULL,
    SubAppID nvarchar2(10) NULL,
    SubAssembly nvarchar2(100) NULL,
    IsEditForm NUMBER(1) Default 1 NOT NULL,
    IsDeleted NUMBER(1) Default 0 NOT NULL,
    IsShowOpinion NUMBER(1) Default 1 NOT NULL,
    IsOpinionRequire NUMBER(1) Default 0 NOT NULL,
    IsEnableTransmit NUMBER(1) Default 0 NULL,
    IsHistoryActorPriority NUMBER(1) Default 1 NOT NULL,
    IsActorSpread NUMBER(1) Default 1 NOT NULL,
    CreateTime date Default sysdate NOT NULL,
    PRIMARY KEY (ActivityID) 
)

comment on column WF_ACTIVITY.ACTIVITYID  is '流程活动ID';
comment on column WF_ACTIVITY.STEPID  is '序号ID';
comment on column WF_ACTIVITY.ACTIVITYNAME  is '活动名称';
comment on column WF_ACTIVITY.ACTIVITYTYPE  is '开始步骤Start；结束步骤：End； 普通审批步骤：Normal ；自动步骤：Auto；会签开始步骤：CountersignStart；会签结束步骤：CountersignEnd；发散步骤Branch； 聚合步骤：Aggregation   ';
comment on column WF_ACTIVITY.ACTORPARSER  is '参与者解析器';
comment on column WF_ACTIVITY.ACTORPARAMTER  is '参与者解析器参数，每种解析自身对应XML格式数据';
comment on column WF_ACTIVITY.REMARK  is '步骤描述';
comment on column WF_ACTIVITY.JOINTYPE  is '转入模式规则JoinXOR异或;JoinAnd并,JoinOR或';
comment on column WF_ACTIVITY.SPLITTYPE  is '转出模式SplitXOR异或;SplitAnd并,SplitOR';
comment on column WF_ACTIVITY.RESPONDTYPE  is 'anyone任一人，all全部人';
comment on column WF_ACTIVITY.REJECTTYPE  is '退回类型：None不可退回，提单OnlyStart，OnlyPreActivity 上一步，OnlyStartOrPreActivity提单或上一步，AnyHistoryActivity 任意历史可退步骤，默认OnlyStart';
comment on column WF_ACTIVITY.CIRCULATEACTOR  is '当进入此步骤时自动传阅工单到此传阅中的人';
comment on column WF_ACTIVITY.POSITIONX  is '图程图所在X位标';
comment on column WF_ACTIVITY.POSITIONY  is '图程图所在Y位标';
comment on column WF_ACTIVITY.ISEDITFORM  is '是否允许编辑表单默认为true';
comment on column WF_ACTIVITY.ISOPINIONREQUIRE  is '审批意见是否必填 默认为fase';
comment on column WF_ACTIVITY.ISENABLETRANSMIT  is '是否允许转交默认为否';
comment on table WF_ACTIVITY  is '流程定义：活动节点';

