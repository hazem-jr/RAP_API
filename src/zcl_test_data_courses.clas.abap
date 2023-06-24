CLASS zcl_test_data_courses DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_data_courses IMPLEMENTATION.
  method if_oo_adt_classrun~main.
        data : lt_course type TABLE of zcourses with EMPTY KEY ,
               lt_schedule type table of zschedule with empty key .


        try.

          lt_course = value #(
          (
              course_uuid = cl_system_uuid=>create_uuid_x16_static(  )
              course_id   = 'P001'
              course_name = 'ABAP Development'
              course_len = 5
              country = 'SA'
              price = 1000
              currency_code = 'EGP'
          )

          (
              course_uuid = cl_system_uuid=>create_uuid_x16_static(  )
              course_id   = 'P002'
              course_name = 'CDS Development'
              course_len = 6
              country = 'SA'
              price = 1500
              currency_code = 'EGP'
          )
          (
              course_uuid = cl_system_uuid=>create_uuid_x16_static(  )
              course_id   = 'P003'
              course_name = 'RAP Development'
              course_len = 8
              country = 'SA'
              price = 3000
              currency_code = 'EGP'
          )


          ) .



          delete from zcourses .
          insert zcourses from TABLE @lt_course .
          out->write( |{ sy-dbcnt } entries in ZCOURSES Table modified| ) .


          lt_schedule = value #(
          (
              schedule_uuid = cl_system_uuid=>create_uuid_x16_static(  )
              course_uuid =  lt_course[ 1 ]-course_uuid
              course_begin   = '20220201'
              trainer = 'Hazem'
              is_online = abap_false
              Location = 'Cairo'

          )

          (
              schedule_uuid = cl_system_uuid=>create_uuid_x16_static(  )
              course_uuid =  lt_course[ 2 ]-course_uuid
              course_begin   = '20220801'
              trainer = 'Ahmed '
              is_online = abap_true
              Location = 'Tanta'

          )

          ) .

          delete from zschedule .
          insert zschedule from table @lt_schedule .
          out->write( |{ sy-dbcnt } entries in zschedule Table modified| ) .

          Commit work .



          catch cx_uuid_error into data(cx).
          out->write( cx ) .
        endtry.
  ENDMETHOD.
ENDCLASS.
