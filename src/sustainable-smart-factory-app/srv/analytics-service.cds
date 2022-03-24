using {sap.smartfactory as pdm} from '../db/pdm-analytics-model';

service AnalyticsService @(path : '/analytics') {

  // Main Entities
  @readonly
  entity AnomaliesExtendedView as projection on
  pdm.AnomaliesExtendedView
  { * };
  
  // Value Helps
  entity EquipmentVH as projection on pdm.EquipmentView;
  entity AnomalyTypeNameVH as projection on pdm.AnomalyTypeNameView;
  entity FuncLocationVH as projection on pdm.FuncLocationView;

  // @sap.semantics : 'aggregate'
  // define view Scans as
  //   select from pdm.AnomaliesExtendedView {
  //     detectedDate      @(sap.aggregation.role : 'dimension')@(odata.Type : 'Edm.Date '),
  //     numberOfAnomalies @(sap.aggregation.role : 'measure')@(odata.Type : 'Edm.Number')
  //   };

  // @sap.semantics : 'aggregate'
  // annotate Scans with @(Analytics : {Query : true}, ) {
  //   detectedDate      @(sap.aggregation.role : 'dimension');
  //   numberOfAnomalies @DefaultAggregation : #SUM  @sap.aggregation.role : 'measure';
  // }

//   @sap.semantics : 'aggregate'
//   entity EquipmentConditionsDetailView as projection on pdm.EquipmentConditionsDetailView {
//     *
//   };

//   @readonly
//   entity EquipmentAnomaliesCountByDateView               as
//     select from EquipmentConditionsDetailView {
//       sum(
//         numberOfAnomalies
//       ) as numberOfAnomalies : Integer,
//       equipment,
//       detectedDate
//     }
//     group by
//       equipment,
//       detectedDate;

}