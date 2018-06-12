Ext.define('TrackIT.view.main.tickets.respostas.MockMainTabResposta', {
    extend: 'Ext.tab.Panel',
    xtype: 'Mockmaintabresposta',
    controller: 'respostacont',
    requires: [
        'TrackIT.store.respostas.RespostaSeleccionada',
        'TrackIT.view.main.tickets.respostas.RespostaController',
        'TrackIT.view.main.tickets.respostas.MostraResposta'
    ],

    width: 1100,
    height: 610,

    store: {
        type: 'respostaseleccionada'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo da Resposta ',
        items: {
                  xtype: 'Mockfieldresposta'
}
    }
]
});
