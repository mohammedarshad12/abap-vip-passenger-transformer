CLASS zcl_ars_swarehouse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_ars_swarehouse IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA:
      lt_material TYPE TABLE OF zmat_ars_master,
      lt_stock    TYPE TABLE OF zstock_ars_items.

*--------------------------------------------------------------------
* Material Master Data
*--------------------------------------------------------------------

    lt_material = VALUE #(

      ( client   = sy-mandt
        mat_id   = 'M001'
        mat_name = 'Laptop'
        unit     = 'EA' )

      ( client   = sy-mandt
        mat_id   = 'M002'
        mat_name = 'Mouse'
        unit     = 'EA' )

      ( client   = sy-mandt
        mat_id   = 'M003'
        mat_name = 'Keyboard'
        unit     = 'EA' )

    ).

    INSERT zmat_ars_master FROM TABLE @lt_material.

*--------------------------------------------------------------------
* Stock Data
*--------------------------------------------------------------------

    lt_stock = VALUE #(

      ( client       = sy-mandt
        mat_id       = 'M001'
        warehouse_id = 'W001'
        quantity     = 50
        price_per_unit = '1000' )

      ( client       = sy-mandt
        mat_id       = 'M001'
        warehouse_id = 'W002'
        quantity     = 75
        price_per_unit = '1000' )

      ( client       = sy-mandt
        mat_id       = 'M002'
        warehouse_id = 'W001'
        quantity     = 40
        price_per_unit = '500' )

      ( client       = sy-mandt
        mat_id       = 'M003'
        warehouse_id = 'W001'
        quantity     = 120
        price_per_unit = '300' )

    ).

    INSERT zstock_ars_items FROM TABLE @lt_stock.

    COMMIT WORK.

    out->write(
      'Material Master and Stock data inserted successfully'
    ).

  ENDMETHOD.

ENDCLASS.
