
Ext.define('TrackIT.view.main.historico.respostas.MockMostraRespostaHistorico', {
    extend: 'Ext.form.Panel',
    xtype: 'Mockfieldrespostahistorico',
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
                }
            });
        }
    }

  });
