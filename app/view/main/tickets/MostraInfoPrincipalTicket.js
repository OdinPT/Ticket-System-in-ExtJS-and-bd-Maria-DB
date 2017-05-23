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
    height: 440,



    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 0
        },

    config:{stores: ['ticketseleccionado2']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID:',
            id: 'idd'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Email:',
            id: 'emaill'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'dateaa'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Estado:',
            id: 'statee'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Departamento:',
            id: 'nome_departamentoo'
        },
        {
        xtype: 'textfield',
        fieldLabel: 'Assunto:',
        id: 'subjectt'
    },
    {
        xtype: 'textareafield',
        id: 'bodyy',
        fieldLabel: 'Corpo:'
    }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
          {
        text: 'Move p/ Historico',
        glyph: 43,
        listeners: {
          click: 'onClickMoveParaHistorico'
        }
      },
          {
              text: 'Responder',
              glyph: 43,
              listeners: {
                  click: function(){
                      var myWin = Ext.create("Ext.window.Window", {
                          title: 'Resposta',
                          modal: true,
                          width: 1000,
                          height: 500,
                          items: {
                              xtype: 'enviaresposta'
                          }
                      });
                      myWin.show();
                  }
              }
          }
    ]
  }
  });
