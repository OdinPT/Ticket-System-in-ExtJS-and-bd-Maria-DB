Ext.define('TrackIT.view.main.tickets.MostraTicket', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabtickets',
    controller: 'ticketzz',
    requires: [
        'TrackIT.store.tickets.TicketSelected',
        'TrackIT.view.main.tickets.respostas.ListaRespostas',
        'TrackIT.view.main.tickets.TicketController',
        'TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta'
    ],
    width: 1100,
    height: 700,

    store: {
        type: 'ticketselectedd'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },
    items: [
        {
            title: 'Conteúdo do Ticket',
            flex: 1,
            margin: '0 10 0 0',

            items: [{
                xtype: 'infoticketprincipal'
            },
                {
                    xtype: 'mainlistanexos'

                },
                {
                    xtype: 'mainlistrespostas'
                }]

        },
        {
            title: 'Lista de funcionários',
            flex: 1,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                //xtype: 'mainlistCliente',
            }]
        }
    ],

/*
    items: [{
        title: 'Conteúdo do Ticket',
        items: [{
                  xtype: 'infoticketprincipal'
              },
            {
                xtype: 'mainlistanexos'

            },
            {
                xtype: 'mainlistrespostas'
            }]

    },
*/
  /*{
    title: 'Respostas',
    items: [{
        xtype: 'mainlistrespostas'
    }]
  }*/
///*],

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
    }
});
