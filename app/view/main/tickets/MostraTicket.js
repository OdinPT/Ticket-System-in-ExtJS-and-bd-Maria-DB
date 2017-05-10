Ext.define('TrackIT.view.main.tickets.MostraTicket', {
    extend: 'Ext.tab.Panel',
        xtype: 'maintabtickets',
    controller: 'ticketzz',
    requires: [
        'TrackIT.store.tickets.TicketSelected',
        'TrackIT.view.main.tickets.respostas.ListaRespostas',
        'TrackIT.view.main.tickets.TicketController'
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

    items: [{
        title: 'Conteúdo do Ticket',
        // var index = Ext.StoreMgr.lookup("ticketselectedd").findExact('id',id);
        items: [{
                  xtype: 'infoticketprincipal'
              }]

    },
    {
        title: 'Responder',
        bind: {
                  html: '<iframe src="/testetrackit/app/php/showEmailAnswerForm.php" width="100%" height="100%" frameBorder="0"></iframe>'
              }
    },
  {
    title: 'Outras Informações',
    items: [{
        xtype: 'infoticket'
    }]
  },
  {
    title: 'Respostas',
    items: [{
        xtype: 'mainlistrespostas'
    }]
  }
],

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
