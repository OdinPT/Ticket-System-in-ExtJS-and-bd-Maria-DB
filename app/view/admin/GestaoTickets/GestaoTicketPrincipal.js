Ext.define('TrackIT.view.admin.GestaoTickets.GestaoTicketPrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        //'TrackIT.view.admin.departamento.FormRegistaDepartamento',
        'TrackIT.view.admin.GestaoTickets.GridGestaoTickets'

    ],
    xtype: 'GestaoTicketprincipal',

    layout: {
        type: 'hbox',
        pack: 'start',
        align: 'stretch',


        height: 300,
        width: 500
    },


    defaults: {
        frame: true,
        bodyPadding: 10
    },

    items: [
        {
            title: 'Total de Tickets  dos Departamento',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'GridGTMax'

            }]
        },
        /*{
            title: 'Total de Tickets ',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'mainlistgestesticket'

            }]
        },*/
        //mainlistgestesticket
    ]
});