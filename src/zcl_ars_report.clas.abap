CLASS zcl_ars_report DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_ars_report IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    SELECT
      m~mat_id,
      m~mat_name,
      SUM( s~quantity ) AS total_qty
    FROM zstock_ars_items AS s
    INNER JOIN zmat_ars_master AS m
      ON s~mat_id = m~mat_id
    GROUP BY
      m~mat_id,
      m~mat_name
    HAVING
      SUM( s~quantity ) > 100
    INTO TABLE @DATA(lt_result).

    out->write( lt_result ).

  ENDMETHOD.

ENDCLASS.
