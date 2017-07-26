Ext.define('TrackIT.view.main.historico.HisComentHistorico.MockMainTabComent', {
    extend: 'Ext.tab.Panel',
    xtype: 'mockmaintabcomenthistorico',
    controller: 'comentcont',
    requires: [
        'TrackIT.store.HistoricoComentariosHistorico.ComentarioSeleccionado',
        'TrackIT.view.main.historico.HisComentHistorico.ComentController',
        'TrackIT.view.main.historico.HisComentHistorico.MostraComent'
    ],

    width: 1100,
    height: 408,

    store: {
        type: 'comentarioselecionadohistorico'
    },

    defaults: {
        //bodyPadding: 1,
        scrollable: false,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: {
                  xtype: 'mockfieldComenthistorico'
}
    }
]
});
