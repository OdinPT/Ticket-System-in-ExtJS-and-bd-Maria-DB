Ext.define('TrackIT.view.main.tickets.MostraTicket', {
    extend: 'Ext.tab.Panel',
    //extend: 'Ext.tab.Panel',

    xtype: 'maintabtickets',
    controller: 'ticketzz',
    requires: [
        'TrackIT.store.tickets.TicketSelected',
        'TrackIT.view.main.tickets.respostas.ListaRespostas',
        'TrackIT.view.main.tickets.TicketController',
        'TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta'
    ],

    layout: 'border',

    width: 1100,
<<<<<<< HEAD
    height: 500,
=======
    height: 900,
>>>>>>> a24fcc125feea59199f412789f438675a17b8613

    store: {
        type: 'ticketselectedd'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true,
        collapsible: true,
        split: true

    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: [
            {
                xtype: 'infoticketprincipal'
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
                    xtype: 'mainlisthistoricoest'
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
/*
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
        {
          text: 'M/ historico',
          glyph: 43,
          listeners: {
             click: 'onClickMoveToHistorico'
          }

        }
      ]
    }*/
});
