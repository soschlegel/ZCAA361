@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Search.searchable: true

@UI: {
   headerInfo: { typeName: 'Travel',
                 typeNamePlural: 'Travels',
                 title: { type: #STANDARD, value: 'TravelID' },
                 description: { type: #STANDARD, value: 'Description' }
                 },
   presentationVariant: [{ sortOrder: [{ by: 'TravelID', direction: #DESC }] }]
  }


@Metadata.allowExtensions: true
define root view entity ZCAA361_C_Travel_666
  as projection on ZCAA361_I_Travel_666 as Travel

{

      @Search.defaultSearchElement: true
      @UI.facet: [ { id:              'Travel',
                      purpose:         #STANDARD,
                      type:            #COLLECTION,
                      label:           'Travel',
                      position:        10 },
                    { id:              'Admin',
                      purpose:         #STANDARD,
                      type:            #FIELDGROUP_REFERENCE,
                      parentId:        'Travel',
                      label:           'Administrative Data',
                      targetQualifier: 'AdminFG',
                      position:        10 },
                    { id:              'Dates',
                      purpose:         #STANDARD,
                      type:            #FIELDGROUP_REFERENCE,
                      parentId:        'Travel',
                      label:           'Dates',
                      targetQualifier: 'DateFG',
                      position:        20 },
                    { id:              'Costs',
                      purpose:         #STANDARD,
                      type:            #FIELDGROUP_REFERENCE,
                      parentId:        'Travel',
                      label:           'Costs',
                      targetQualifier: 'CostFG',
                      position:        30 },
                    { id:              'Booking',
                      purpose:         #STANDARD,
                      type:            #LINEITEM_REFERENCE,
                      label:           'Booking',
                      position:        20,
                      targetElement:   '_Booking'},
                    { id:              'PriceDP',
                      purpose:         #STANDARD,
                      type:            #DATAPOINT_REFERENCE,
                      targetQualifier: 'Price',
                      position:        10 },
                    { id:              'StatusDP',
                      purpose:         #STANDARD,
                      type:            #DATAPOINT_REFERENCE,
                      targetQualifier: 'StatusDP',
                      position:        20 }
                 ]

      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ],
          fieldGroup:     [ { position: 10, qualifier: 'AdminFG' } ] ,
          selectionField: [ { position: 10 } ] }

  key Travel_ID          as TravelID,

      @UI: {
            lineItem:       [ { position: 20, importance: #HIGH } ],
            fieldGroup:     [ { position: 20, qualifier: 'AdminFG' } ],
            selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency', element: 'AgencyID'  } }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      Agency_ID          as AgencyID,
      _Agency.Name       as AgencyName,

      @UI: {
              lineItem:       [ { position: 30, importance: #HIGH } ],
              fieldGroup:     [ { position: 30, qualifier: 'AdminFG' } ],
              selectionField: [ { position: 30 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Customer', element: 'CustomerID'  } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      Customer_ID        as CustomerID,
      _Customer.LastName as CustomerName,

      @UI: {
       lineItem:       [ { position: 40, importance: #MEDIUM } ],
       fieldGroup:     [ { position: 40, qualifier: 'DateFG' } ] }
      Begin_Date         as BeginDate,

      @UI: {
       lineItem:       [ { position: 50, importance: #MEDIUM } ],
       fieldGroup:     [ { position: 50, qualifier: 'DateFG' } ] }
      End_Date           as EndDate,

      @UI.fieldGroup:     [ { position: 20, qualifier: 'CostFG' }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Booking_Fee        as BookingFee,

      @UI: {
       lineItem:       [ { position: 80, importance: #MEDIUM } ],
       fieldGroup:     [ { position: 10, qualifier: 'CostFG' } ],
       dataPoint:        { qualifier: 'Price' }
       }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Total_Price        as TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      Currency_Code      as CurrencyCode,

      @UI: {
         lineItem:       [ { position: 90, importance: #HIGH }
                                   ,{ type: #FOR_ACTION, dataAction: 'bookTravel', label: 'Book Travel' }
                           ],
                  identification: [ { type: #FOR_ACTION, dataAction: 'bookTravel', label: 'Book Travel' } ],
         fieldGroup:     [ { position: 50, label: 'Status', qualifier: 'AdminFG' } ],
         dataPoint:        { qualifier: 'StatusDP' }
          }
      Status             as TravelStatus,

      @UI.fieldGroup: [ { position: 40, qualifier: 'AdminFG' } ]
      Description        as Description,

      @UI.hidden: true
      Last_Changed_At    as LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZCAA361_C_Booking_666,
      _Agency,
      _Customer


}
