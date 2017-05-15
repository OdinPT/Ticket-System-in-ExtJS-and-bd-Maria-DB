
Ext.define('TrackIT.view.main.recuperados.MostraOutrasInfoTicketRecuperado', {
    extend: 'Ext.form.Panel',
    xtype: 'infoticketrecuperado',
    controller: 'outrainfoticketrecuperado',
    requires: [
      'TrackIT.store.recuperados.CarregaInfoTicketRecuperado',
      'TrackIT.view.main.recuperados.MostraOutrasInfoTicketRecuperadoController'
    ],
    id: 'paginaoutrasinfoticketrecuperado',
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

    config:{stores: ['ticketrecuperadoseleccionado1']},

    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'id'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Data:',
        id: 'datea'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Estado:',
        id: 'state'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Departamento:',
        id: 'department'
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
           click: 'onClickObterOutrasInfoTicketRecuperado'
        }

      },
      {
        text: 'Limpar',
        glyph: 43,
        listeners: {
          click: 'onClickLimpaOutrasInfoTicketRecuperado'
        }
      }
    ]
  }
  });
