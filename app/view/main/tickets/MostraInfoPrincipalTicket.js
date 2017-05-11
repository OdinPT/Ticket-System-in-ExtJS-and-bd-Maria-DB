
Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicket', {
    extend: 'Ext.form.Panel',
    xtype: 'infoticketprincipal',
    controller: 'infoticketprincipal',
    requires: [
      'TrackIT.store.tickets.CarregaInfoPrincipalTicket',
      'TrackIT.view.main.tickets.MostraInfoPrincipalTicketController'
    ],
    id: 'paginainfoprincipalticket',
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

    config:{stores: ['ticketseleccionado2']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID:',
            id: 'id'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Remetente :',
            id: 'fromaddress'
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
            id: 'nome_departamento'
        },
        {
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
      /*{
        text: 'Carregar Informações',
        glyph: 43,
        listeners: {
           click: 'onClickObterInfoPrincipalTicket'
        }

      },*/
      {
        text: 'Move p/ Historico',
        glyph: 43,
        listeners: {
          click: 'onClickMoveParaHistorico'
        }
      }
    ]
  }
  });
