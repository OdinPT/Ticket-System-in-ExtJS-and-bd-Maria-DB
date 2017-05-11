
Ext.define('TrackIT.view.main.tickets.MostraOutrasInfoTicket', {
    extend: 'Ext.form.Panel',
    xtype: 'infoticket',
    controller: 'outrainfoticket',
    requires: [
      'TrackIT.store.tickets.CarregaInfoTicket',
      'TrackIT.view.main.tickets.MostraOutrasInfoTicketController'
    ],
    id: 'paginaoutrasinfoticket',
    frame: true,
    title: 'Outras Informações',
    width: 1080,
    height: 300,
    bodyPadding: 10,
    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 20
        },

        config:{stores: ['ticketseleccionado1']},

  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Carregar Informações',
        glyph: 43,
        listeners: {
           click: 'onClickObterOutrasInfoTicket'
        }

      },
      {
        text: 'Limpar',
        glyph: 43,
        listeners: {
          click: 'onClickLimpaOutrasInfoTicket'
        }
      }
    ]
  }
  });
