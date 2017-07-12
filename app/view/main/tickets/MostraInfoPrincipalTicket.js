Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicket', {
    extend: 'Ext.form.Panel',
    xtype: 'infoticketprincipal',
    controller: 'infoticketprincipal',

    requires: [
      'TrackIT.store.tickets.CarregaInfoPrincipalTicket',
      'TrackIT.view.main.tickets.MostraInfoPrincipalTicketController',
        'TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta'
    ],
    id: 'paginainfoprincipalticket',
    title: 'Informação Principal',

    //width: 1100,

    width: 1050,
    height: 550,
    autoScroll: true,


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
            id: 'Descricao_Estado',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Departamento:',
            id: 'nome_departamentoo',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Tipo Resolução nor:',
            id: 'DesTipoRes',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Funcionário Atribuido:',
            id: 'id_func_emails',
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
        text: 'Reciclar',
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
                          title: 'Responder',
                          modal: true,
                          width: 700,
                          height: 270,
                          items: {
                              xtype: 'enviaresposta'
                          }
                      });
                      myWin.show();
                  }
              }
          },
          {
              text: 'Atribuir Funcionário',
              glyph: 43,
              listeners: {
                  click: function(){
                      var myWin = Ext.create("Ext.window.Window", {
                          title: 'Atribuir novo Funcionário',
                          modal: true,
                          items: {
                              xtype: 'atribuifuncionario'
                          }
                      });
                      myWin.show();
                  }
              }
          },{
              text: 'Mudar Departamento',
              glyph: 43,
              listeners: {
                  click: function(){
                      var myWin = Ext.create("Ext.window.Window", {
                          title: 'Mudar Departamento do Ticket',
                          modal: true,
                          items: {
                              xtype: 'registahisDep'
                          }

                      });
                      myWin.show();
                  }
              }
          },
          {
              text: 'Mudar Estado de resolução ',
              glyph: 43,
              listeners: {
                  click: function(){
                      var myWin = Ext.create("Ext.window.Window", {
                          title: 'Mudar Estado de resolução do Ticket',
                          modal: true,
                          width: 400,
                          items: {
                              xtype: 'registahisestado'
                          }

                      });
                      myWin.show();
                  }
              }
          }


      ],


  }
  });
