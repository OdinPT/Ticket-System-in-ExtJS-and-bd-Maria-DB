
Ext.define('TrackIT.view.main.historico.MostraInfoTicketHistorico', {
    extend: 'Ext.form.Panel',
    xtype: 'infotickethistorico',
    controller: 'infotickethistorico',
    requires: [
      'TrackIT.store.historico.CarregaInfoHistoricoTicket',
      'TrackIT.view.main.historico.MostraInfoHistoricoTicketController'
    ],
    id: 'paginainfohistoricoticket',
    title: 'Informação Principal',
    width: 1380,
    height: 440,
    autoScroll: true,
    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 0
    },

    config:{stores: ['tickethistoricoseleccionado']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID:',
            id: 'idd',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Email:',
            id: 'emaill',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'dateaa',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Estado:',
            id: 'statee',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Departamento:',
            id: 'departmentt',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Assunto:',
            id: 'subjectt',
            readOnly: true
        },
        {
            xtype: 'textareafield',
            id: 'bodyy',
            fieldLabel: 'Corpo:',
            readOnly: true
        }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [

      {
        text: 'Apagar',
        glyph: 43,
        listeners: {
          click: 'onClickApagaTicketDoHistorico'
        }
      },
      {
      text: 'Recuperar',
      glyph: 43,
      listeners: {
        click: 'onClickMoveParaTickets'
      }
    }
    ]
  }
  });
