
Ext.define('TrackIT.view.main.historico.MockMostraInfoTicketHistorico', {
    extend: 'Ext.form.Panel',

    xtype: 'mockinfotickethistorico',
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
      text: 'Mover para Ticket',
      glyph: 43,
      listeners: {
        click: 'onClickMoveParaTickets'
      }
    }
    ]
  }
  });
