Ext.define('TrackIT.view.main.recuperados.MostraTicketRecuperado', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabssss',
    controller: 'ticketzzzz',
    requires: [
        'TrackIT.store.recuperados.TicketsSeleccionadosRecuperados',
        'TrackIT.view.main.recuperados.TicketControllerRecuperado'
    ],
    width: 1100,
    height: 500,

    store: {
        type: 'ticketselectedddd'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        // var index = Ext.StoreMgr.lookup("ticketselectedd").findExact('id',id);
        items: {
                  //xtype: 'infoticketrecuperadoprincipal'
              }

    },
    {
        title: 'Responder',
        bind: {
                  html: '<iframe src="/testetrackit/app/php/showEmailAnswerForm.php" width="100%" height="100%" frameBorder="0"></iframe>'
              }

    },
    {
        title: 'Outras Informações',
        items: {
                  xtype: 'infoticketrecuperado'
              }

    },
    {
      title: 'Respostas',
      items: [{
          xtype: 'mainlistrespostas'
      }]
    }]
    // ,
    //
    // dockedItems: {
    //     dock: 'bottom',
    //     xtype: 'toolbar',
    //     items: [{
    //         text: 'Responder',
    //         glyph: 43
    //
    //     },
    //     {
    //       text: 'Apagar',
    //       glyph: 43,
    //       listeners: {
    //          click: 'onClickDeleteForever'
    //       }
    //
    //     }
    //   ]
    // }
});
