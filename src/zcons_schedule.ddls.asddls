@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Schedule Info ( Consum )'
@Search.searchable: true
@Metadata.allowExtensions: true
define  view entity zcons_schedule as projection on zcds_schedule

{
    key ScheduleUuid,
    CourseBegin,
    CourseUuid,
    @Search.defaultSearchElement: true
    Location,
    @Search.defaultSearchElement: true
    Trainer,
    IsOnline,
    LastChangedAt,
    LocalLastChangedAt,
    /* Associations */
    _course : redirected to parent zcons_course

}
