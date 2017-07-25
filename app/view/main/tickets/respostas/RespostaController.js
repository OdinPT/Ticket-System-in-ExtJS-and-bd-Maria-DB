Ext.define('TrackIT.view.main.tickets.respostas.RespostaController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostacont',

    onClickObterResposta: function() {
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
    },
        onClickApagarResposta: function () {
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Apagar/apagaresposta.php',
                method: 'POST',
                success: function (response, opts) {
                    Ext.MessageBox.alert('title', 'Sucesso');
                    Ext.getCmp('grid4').getStore().load();
                }
            })
        },
    onClickApagacoment: function () {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagarcoment.php',
            method: 'POST',
            success: function (response, opts) {
                Ext.MessageBox.alert('title', 'Sucesso');
                Ext.getCmp('gridhiscoment2historico').getStore().load();
            }
        })
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
                                var e = Ext.getCmp('subject_resp').setValue(record.data.subject_resp);

                            }
                        });

                    }
                }

            });
            myWin.show();
        }
    }

});
