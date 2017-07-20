Ext.define('TrackIT.view.main.tickets.HisComent.ComentController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.comentcont',

    onClickObterResposta: function() {
        var store = Ext.getStore('comentarioselecionado');
        store.load({
            callback: function (records, operation, success) {
                var record = store.getAt(0);
                var a = Ext.getCmp('ID_Comentario').setValue(record.data.ID_Comentario);
                var b = Ext.getCmp('ID_Ticket').setValue(record.data.ID_Ticket);
                var c = Ext.getCmp('Data_comentario').setValue(record.data.Data_comentario);
                var d = Ext.getCmp('Comentario').setValue(record.data.Comentario);
                var e = Ext.getCmp('ID_Utilizador').setValue(record.data.ID_Utilizador);
            }
        });
    },

    /*listeners: {
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
*/
});
