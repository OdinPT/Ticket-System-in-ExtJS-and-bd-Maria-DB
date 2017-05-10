
Ext.define('TrackIT.view.main.historico.respostas.MostraRespostaHistorico', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldrespostahistorico',
    controller: 'respostaconthistorico',
    requires: [
      'TrackIT.store.respostas.RespostaSeleccionadaHistorico',
      'TrackIT.view.main.historico.respostas.RespostaControllerHistorico'
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

    config:{stores: ['respostaseleccionadahistorico']},

    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'ide'
    },
    /*
    $row_array['ID_resp'] = $row['ID_resp'];
    $row_array['body_resp'] = $row['body_resp'];
    $row_array['datea_resp'] = $row['datea_resp'];
    $row_array['IdEmail'] = $row['IdEmail'];

    */
    {
        xtype: 'textfield',
        fieldLabel: 'Assunto:',
        id: 'body_resp'
    },
    {
        xtype: 'textareafield',
        fieldLabel: 'Resposta:',
        id: 'datea_resp'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'IDTicket:',
        id: 'id_email'
    }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Carregar Resposta',
        glyph: 43,
        listeners: {
           click: 'onClickObterResposta'
        }

      },
      {
        text: 'Apagar Resposta',
        glyph: 43,
        listeners: {
          click: 'onClickApagarResposta'
        }

      }
    ]
  }
  });
