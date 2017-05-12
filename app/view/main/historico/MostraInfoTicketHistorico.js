
Ext.define('TrackIT.view.main.historico.MostraInfoTicketHistorico', {
    extend: 'Ext.form.Panel',
    xtype: 'infotickethistorico',
    controller: 'infotickethistorico',
    requires: [
      'TrackIT.store.historico.CarregaInfoHistoricoTicket',
      'TrackIT.view.main.historico.MostraInfoHistoricoTicketController'
    ],
    id: 'paginainfohistoricoticket',
    frame: true,
    title: 'Informação Principal',
    width: 1080,
    height: 400,
    bodyPadding: 10,
    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 20
        },

    config:{stores: ['tickethistoricoseleccionado']},

    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'idee'
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'dateaaa'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Estado:',
            id: 'stateee'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Departamento:',
            id: 'departmenttt'
        },
        {
        xtype: 'textfield',
        fieldLabel: 'Assunto:',
        id: 'subjectee'
    },
    {
        xtype: 'textareafield',
        id: 'bodyyy',
        fieldLabel: 'Corpo:'
    }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Carregar Informações',
        glyph: 43,
        listeners: {
           click: 'onClickObterInfoHistorico'
        }

      },
      {
        text: 'Apagar',
        glyph: 43,
        listeners: {
          click: 'onClickApagaTicketDoHistorico'
        }
      }
      /*{
      text: 'Mover p/ Recuperados',
      glyph: 43,
      listeners: {
        click: 'onClickMoveParaRecuperados'
      }
    }*/
    ]
  }
  });
