@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity zcons_course as projection on zcds_courses 

{
   key CourseUuid,
   @Search.defaultSearchElement: true
   CourseId,
   @Search.defaultSearchElement: true
   CourseName,
   CourseLen,
   @Search.defaultSearchElement: true
   @Consumption.valueHelpDefinition: [{ entity : { name : 'I_Country' , element: 'Country' }}]
   Country,
   @Semantics.amount.currencyCode: 'CurrencyCode'
   Price,
   @Consumption.valueHelpDefinition: [{ entity : { name : 'I_Currency' , element: 'Currency' }}]
   CurrencyCode,
   LastChangedAt,
   LocalLastChangedAt,
   
   /* Associations */
   _country,
   _curr,
   _schedule

}
