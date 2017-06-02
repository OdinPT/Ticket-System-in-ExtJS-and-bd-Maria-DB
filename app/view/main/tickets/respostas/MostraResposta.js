
Ext.define('TrackIT.view.main.tickets.respostas.MostraResposta', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldresposta',
    controller: 'respostacont',
    requires: [
      'TrackIT.store.respostas.RespostaSeleccionada',
      'TrackIT.view.main.tickets.respostas.RespostaController'
    ],
    id: 'staticPageForm',
    frame: true,
    title: 'Resposta',
    width: 1080,
    height: 450,
    bodyPadding: 10,
    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 20
        },

    config:{stores: ['respostaseleccionada']},


    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'id_resp'
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Assunto:',
            id: 'subject_resp'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'datea_resp'
        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Corpo:',
            id: 'body_resp'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID Ticket:',
            id: 'id_email'
        }
    ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Carregar',
        glyph: 43,
        listeners: {
           click: 'onClickObterResposta'
        }

      },
      {
        text: 'Apagar',
        glyph: 43,
        listeners: {
          click: 'onClickApagarResposta'
        }

      }
    ]
  }
  });
