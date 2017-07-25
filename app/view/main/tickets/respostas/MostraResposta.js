
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
    autoLoad: true,
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

    listeners: {
        afterrender: function () {
            var store = Ext.getStore('respostaseleccionada');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var a = Ext.getCmp('id_resp').setValue(record.data.id_resp);
                    var b = Ext.getCmp('body_resp').setValue(record.data.body_resp);
                    var c = Ext.getCmp('datea_resp').setValue(record.data.datea_resp);
                    var d = Ext.getCmp('id_email').setValue(record.data.id_email);
                    var e = Ext.getCmp('subject_resp').setValue(record.data.subject_resp);
                }
            });
        }
    }
  });
