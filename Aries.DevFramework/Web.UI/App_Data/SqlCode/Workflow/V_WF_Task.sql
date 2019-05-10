select t.taskID,t.AppID, wi.SheetID,wi.InstanceTitle,t.ActivityName,t.TaskState,wi.InstanceState,
a.AppName,t.CreateTime,wi.StartTime,t.UserID,t.InstanceID,wi.CreatorID,wi.CreatorFullName,
t.IsCirculate,t.IsValid,t.FromCreatorID
from WF_TaskInstance t
left join WF_Instance wi
on t.InstanceID=wi.InstanceID
left join WF_App a
on t.AppID=a.AppID