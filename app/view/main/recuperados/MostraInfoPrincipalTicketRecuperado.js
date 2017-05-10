
Ext.define('TrackIT.view.main.recuperados.MostraInfoPrincipalTicketRecuperado', {
    extend: 'Ext.form.Panel',
    xtype: 'infoticketrecuperadoprincipal',
    controller: 'infoticketrecuperadoprincipal',
    requires: [
      'TrackIT.store.recuperados.CarregaInfoPrincipalTicketRecuperado',
      'TrackIT.view.main.recuperados.MostraInfoPrincipalTicketRecuperadoController'
    ],
    id: 'paginainfoprincipalticketrecuperado',
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

    config:{stores: ['ticketrecuperadoseleccionado2']},

    items: [{
        xtype: 'textfield',
        fieldLabel: 'Assunto:',
        id: 'subject'
    },
    {
        xtype: 'textareafield',
        id: 'body',
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
           click: 'onClickObterInfoPrincipalTicketRecuperado'
        }

      },
      {
        text: 'Apagar',
        glyph: 43,
        listeners: {
          click: 'onClickApagaRecuperado'
        }
      },
      {
      text: 'M/ historico',
      glyph: 43,
      listeners: {
        click: 'onClickMoveParaHistoricoRecuperado'
      }
    }
  ]}
  });
