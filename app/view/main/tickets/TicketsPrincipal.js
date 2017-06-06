Ext.define('TrackIT.view.main.tickets.TicketsPrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        'TrackIT.view.admin.FormRegistaUtilizador',
        'TrackIT.view.admin.GridMostraFuncionarios'

    ],
    xtype: 'ticketsprincipal',
    width: 500,
    height: 400,

    layout: {
        type: 'hbox',
        pack: 'start',
        align: 'stretch'
    },

    bodyPadding: 10,

    defaults: {
        frame: true,
        bodyPadding: 10
    },

    items: [
        {
            title: 'Formulário de Registo',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'infoticketprincipal'
            }]
        },
        {
            title: 'Lista de funcionários',
            flex: 1,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                xtype: 'mainlistfuncionarios'
            }]
        }
    ]

});