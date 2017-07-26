Ext.define('TrackIT.view.main.tickets.respostas.MainTabRespostaHistorico', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabrespostahistorico',
    controller: 'respostaconthistorico',
    requires: [
        'TrackIT.store.respostas.RespostaSeleccionadaHistorico',
        'TrackIT.view.main.historico.respostas.RespostaControllerHistorico',
        'TrackIT.view.main.historico.respostas.MostraRespostaHistorico'
    ],
    width: 1100,
    height: 600,

    store: {
        type: 'respostaseleccionadahistorico'
    },

    defaults: {
        //bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: {
                  xtype: 'fieldrespostahistorico'
}
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
