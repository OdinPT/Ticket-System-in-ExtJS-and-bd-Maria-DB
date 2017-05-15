
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
    title: 'Resposta ',
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
        id: 'body_resp'
    },
    {
        xtype: 'textareafield',
        fieldLabel: 'Data:',
        id: 'datea_resp'
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
        text: 'Carregar Resposta',
        glyph: 43,
        listeners: {
           click: 'onClickObterResposta'
        }

      }
    ]
  },
    listeners: {
        itemclick: function (view, record, item, index, e) {
            var id = record.get('id');
            Ext.util.Cookies.set('cookieID', id);
            var ide = index + 1;
            Ext.util.Cookies.set('cookieIDe', ide);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'RSP',
                modal: true,
                width: 1100,
                height: 550,
                items: [{
                    xtype: 'fieldresposta'
                }],
                listeners: {
                    afterrender: function () {
                        var store = Ext.getStore('respostaseleccionada');
                        store.load({
                            callback: function (records, operation, success) { // carrega dados para os respétivos campos
                                var record = store.getAt(0);
                                var a = Ext.getCmp('id_resp').setValue(record.data.id_resp);
                                var b = Ext.getCmp('body_resp').setValue(record.data.body_resp);
                                var c = Ext.getCmp('datea_resp').setValue(record.data.datea_resp);
                                var d = Ext.getCmp('id_email').setValue(record.data.id_email);

                            }
                        });

                    }
                }

            });
            myWin.show();
        }
    }
  });
