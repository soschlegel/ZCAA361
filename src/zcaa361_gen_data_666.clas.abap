CLASS zcaa361_gen_data_666 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES:
      if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcaa361_gen_data_666 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DELETE FROM zcaa361_tra_666.
    INSERT zcaa361_tra_666 FROM ( SELECT FROM /dmo/travel FIELDS * ).
    out->write( 'ZCAA361_TRA_666'  ).
    DELETE FROM zcaa361_book_666.
    INSERT zcaa361_book_666 FROM ( SELECT FROM /dmo/booking FIELDS * ).
    out->write( 'ZCAA361_BOOK_666'  ).

  ENDMETHOD.

ENDCLASS.
