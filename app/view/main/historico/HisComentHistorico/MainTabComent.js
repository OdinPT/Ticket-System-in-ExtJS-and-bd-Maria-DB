Ext.define('TrackIT.view.main.historico.HisComentHistorico.MainTabComent', {
    extend: 'Ext.tab.Panel',
    xtype: 'maintabcomenthistorico',
    controller: 'comentcont',
    requires: [
        'TrackIT.store.HistoricoComentariosHistorico.ComentarioSeleccionado',
        'TrackIT.view.main.historico.HisComentHistorico.ComentController',
        'TrackIT.view.main.historico.HisComentHistorico.MostraComent'
    ],

    width: 1100,
    //height: 510,
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
                  xtype: 'fieldComenthistorico'
}
    }
]
});
