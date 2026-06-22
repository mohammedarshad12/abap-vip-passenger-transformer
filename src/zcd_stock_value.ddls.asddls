@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Stock Value CDS View'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCD_STOCK_VALUE
  as select from zstock_ars_items as s
    inner join zmat_ars_master as m
      on s.mat_id = m.mat_id
{
  key m.mat_id    as MaterialID,
      m.mat_name  as MaterialName,

      sum( s.quantity ) as TotalQuantity
}
group by
  m.mat_id,
  m.mat_name
