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
        width: 500,
        height: 400

    },

    defaults: {
        frame: true,
        bodyPadding: 10
    },

    items: [
        {
            title: 'Gestao',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'GridGTMax'

            }]
        }
    ]
});