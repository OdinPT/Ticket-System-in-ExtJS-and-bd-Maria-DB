
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

    width: 1050,
    height: 500,

    autoScroll: true,


    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 1
    },


    config:{stores: ['tickethistoricoseleccionado']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID:',
            id: 'idd',
            readOnly: true,
             hidden:true

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
            fieldLabel: 'Tipo Resolução:',
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
        text: 'Apagar',
        glyph: 43,
        listeners: {
          click: 'onClickApagaTicketDoHistorico'
        }
      },
      {
      text: 'Mover para Ticket',
      glyph: 43,
      listeners: {
        click: 'onClickMoveParaTickets'
            }
      },
          {
              text: 'Apagar Todas as Respostas',
              id: 'apagar2',
              handler: function(){
                  myRequest = Ext.Ajax.request({
                      url: 'app/php/Limpar/limparespostas.php',
                      method: 'POST',
                      success: function(response, opts) {
                          Ext.getCmp('grid5').store.reload();
                      }
                  })
              }
          },
          {
              text: 'Apagar Todos os comentários',
              id: 'apagar3',
              handler: function(){
                  myRequest = Ext.Ajax.request({
                      url: 'app/php/Limpar/limpacomentarios.php',
                      method: 'POST',
                      success: function(response, opts) {
                          Ext.getCmp('gridhiscoment2historico').store.reload();
                      }
                  })
              }
          }
    ]
  }
  });
