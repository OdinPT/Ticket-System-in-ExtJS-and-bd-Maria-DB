Ext.define('TrackIT.view.main.historico.MostraTicketHistorico', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabsss',
    controller: 'ticketzzz',
    requires: [
        'TrackIT.store.historico.CarregaInfoHistoricoTicket',
        'TrackIT.view.main.historico.MostraInfoHistoricoTicketController',
        'TrackIT.view.main.historico.respostas.ListaRespostasHistorico'
    ],
    width: 1100,
    height: 500,

    store: {
        type: 'tickethistoricoseleccionado'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        // var index = Ext.StoreMgr.lookup("ticketselectedd").findExact('id',id);
        items: [{
            xtype: 'infotickethistorico'
        },
            {
                xtype: 'mainlistanexos'
            },
            {
                xtype: 'mainlistrespostas'
            }

        ]
    },
        {
            title: 'Historico dos Estados',
            items: [
                {
                    xtype: 'mainlisthistoricoesthist'
                }
            ]

        },
        {
            title: 'Historico dos Departamentos',
            items: [
                {
                    xtype: 'mainlisthistoricoDep'
                }
            ]

        }

    ]
});
