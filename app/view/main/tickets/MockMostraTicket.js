Ext.define('TrackIT.view.main.tickets.MockMostraTicket', {
    extend: 'Ext.tab.Panel',
    //extend: 'Ext.tab.Panel',

    xtype: 'mockmaintabtickets',
    controller: 'ticketzz',
    requires: [
        'TrackIT.store.tickets.TicketSelected',
        'TrackIT.view.main.tickets.respostas.ListaRespostas',
        'TrackIT.view.main.tickets.TicketController',
        'TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta'
    ],

    layout: 'border',


     width: 1100,
     height: 640,

    store: {
        type: 'ticketselectedd'
    },

    defaults: {
        bodyPadding: 1,
        scrollable: true,
        closable: true,
        collapsible: true,
        split: true

    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: [
            {
                xtype: 'mockinfoticketprincipal'
            },
            {
                //xtype:'mainlisthistoricocoment'
                xtype:'mockmainlisthistoricocoment'

            },
            {
                xtype: 'mainlistanexos'
            },
            {

                xtype: 'Mockmainlistrespostas'
            }
        ]
    },
        {
            title: 'Histórico dos Estados',
            items: [
                {
                    xtype: 'mainlisthistoricoest'
                }
            ]

        },
        {
            title: 'Histórico dos Departamentos',
            items: [
                {
                    xtype: 'mainlisthistoricoDep'
                }
            ]

        },
        {
            title: 'Histórico Atribuição',
            items: [
                {
                    xtype: 'mainlisthistoricoatribuica'
                }
            ]

        }


    ]
});