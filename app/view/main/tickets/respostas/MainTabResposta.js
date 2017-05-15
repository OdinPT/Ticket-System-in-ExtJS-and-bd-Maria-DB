Ext.define('TrackIT.view.main.tickets.respostas.MainTabResposta', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabresposta',
    controller: 'respostacont',
    requires: [
        'TrackIT.store.respostas.RespostaSeleccionada',
        'TrackIT.view.main.tickets.respostas.RespostaController',
        'TrackIT.view.main.tickets.respostas.MostraResposta'
    ],
    width: 1100,
    height: 600,

    store: {
        type: 'respostaseleccionada'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: {
                  xtype: 'fieldresposta'
}
    }
],
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
