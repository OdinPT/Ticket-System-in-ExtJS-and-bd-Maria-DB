Ext.define('TrackIT.view.main.recuperados.respostas.MainTabRespostaRecuperada', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabrespostarecuperada',
    controller: 'respostacontrecuperada',
    requires: [
        'TrackIT.store.respostas.RespostaSeleccionadaRecuperada',
        'TrackIT.view.main.recuperados.respostas.RespostaControllerRecuperada',
        'TrackIT.view.main.recuperados.respostas.MostraRespostaRecuperada'
    ],
    width: 1100,
    height: 600,

    store: {
        type: 'respostaseleccionadarecuperada'
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
                  xtype: 'fieldrespostarecuperada'
}
    }
]
});
