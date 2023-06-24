@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Schedule Info'
define view entity zcds_schedule as select from zschedule as schedule
association to parent zcds_courses as _course on $projection.CourseUuid = _course.CourseUuid
{
    key schedule.schedule_uuid as ScheduleUuid,
    schedule.course_begin as CourseBegin,
    schedule.course_uuid as CourseUuid,
    schedule.location as Location,
    schedule.trainer as Trainer,
    schedule.is_online as IsOnline,
    @Semantics.systemDateTime.lastChangedAt: true
    schedule.last_changed_at as LastChangedAt,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    schedule.local_last_changed_at as LocalLastChangedAt,
    _course 
}
