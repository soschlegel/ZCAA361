@EndUserText.label: 'Booking projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

@UI: {
  headerInfo: { typeName: 'Booking',
                typeNamePlural: 'Bookings',
                title: { type: #STANDARD, value: 'BookingID' } } }

define view entity ZCAA361_C_Booking_666
  as projection on ZCAA361_I_Booking_666
{
      @UI.facet: [ { id:            'Booking',
                     purpose:       #STANDARD,
                     type:          #IDENTIFICATION_REFERENCE,
                     label:         'Booking',
                     position:      10 } ]
      @Search.defaultSearchElement: true
  key Travel_ID       as TravelID,
      @UI: { lineItem:       [ { position: 20, importance: #HIGH } ],
             identification: [ { position: 20 } ] }
      @Search.defaultSearchElement: true
  key Booking_ID      as BookingID,

      @UI: { lineItem:       [ { position: 30, importance: #HIGH } ],
             identification: [ { position: 30 } ] }
      Booking_Date    as BookingDate,

      @UI: { lineItem:       [ { position: 40, importance: #HIGH } ],
             identification: [ { position: 40 } ] }
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer', element: 'CustomerID' }}]
      @Search.defaultSearchElement: true
      Customer_ID     as CustomerID,

      @UI: { lineItem:       [ { position: 50, importance: #HIGH } ],
             identification: [ { position: 50 } ] }
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Carrier', element: 'AirlineID' }}]
      @ObjectModel.text.element: ['CarrierName']
      Carrier_ID      as CarrierID,
      _Carrier.Name   as CarrierName,
      @UI: { lineItem:       [ { position: 60, importance: #HIGH } ],
             identification: [ { position: 60 } ] }
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'ConnectionID'},
                                            additionalBinding: [ { localElement: 'FlightDate',   element: 'FlightDate'},
                                                                 { localElement: 'CurrencyCode', element: 'CurrencyCode' } ] } ]
      Connection_ID   as ConnectionID,
      @UI: { lineItem:       [ { position: 70, importance: #HIGH } ],
             identification: [ { position: 70 } ] }
      @Consumption.valueHelpDefinition: [ {entity: {name: '/DMO/I_Flight', element: 'FlightDate' },
                                            additionalBinding: [ { localElement: 'ConnectionID', element: 'ConnectionID'},
                                                             { localElement: 'CarrierID',    element: 'AirlineID'},
                                                                { localElement: 'CurrencyCode', element: 'CurrencyCode' }]}]
      Flight_Date     as FlightDate,
      @UI: { lineItem:       [ { position: 80, importance: #HIGH } ],
             identification: [ { position: 80 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Flight_Price    as FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]
      Currency_Code   as CurrencyCode,
      @UI.hidden: true
      Last_Changed_At as LastChangedAt, -- Take over from parent
      /* Associations */
      _Travel : redirected to parent ZCAA361_C_Travel_666,
      _Customer,
      _Carrier
}
