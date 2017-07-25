
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
        id: 'id_resp'
    },
    {
        xtype: 'textfield',
        fieldLabel: 'Assunto:',
        id: 'subject_resp'
    },

    {
        xtype: 'textfield',
        fieldLabel: 'Corpo:',
        id: 'body_resp'
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'datea_resp'
        }
  ],
  dockedItems: {
      dock: 'bottom',
      xtype: 'toolbar',
      items: [
      {
        text: 'Apagar Resposta',
        glyph: 43,
        listeners: {
          click: 'onClickApagarResposta'
        }

      }
    ]
  },

    listeners: {
        afterrender: function () {
            var store = Ext.getStore('respostaseleccionadahistorico');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var a = Ext.getCmp('id_resp').setValue(record.data.id_resp);
                    var b = Ext.getCmp('body_resp').setValue(record.data.body_resp);
                    var cc = Ext.getCmp('subject_resp').setValue(record.data.subject_resp);
                    var c = Ext.getCmp('datea_resp').setValue(record.data.datea_resp);
                    var d = Ext.getCmp('id_email').setValue(record.data.id_email);
                }
                //subject_resp
            });
        }
    }

  });
