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
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        // var index = Ext.StoreMgr.lookup("ticketselectedd").findExact('id',id);
        items: {
                  xtype: 'fieldrespostahistorico'
}
    }
]
});
