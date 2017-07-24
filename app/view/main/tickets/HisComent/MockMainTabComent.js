Ext.define('TrackIT.view.main.tickets.HisComent.MockMainTabComent', {
    extend: 'Ext.tab.Panel',
    xtype: 'Mockmaintabcoment',
    controller: 'comentcont',
    requires: [
        'TrackIT.store.HistoricoComentarios.ComentarioSeleccionado',
        'TrackIT.view.main.tickets.HisComent.ComentController',
        'TrackIT.view.main.tickets.HisComent.MostraComent'
    ],

    width: 1100,
    height: 610,

    store: {
        type: 'comentarioselecionado'
    },

    defaults: {
        bodyPadding: 10,
        scrollable: true,
        closable: true
    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: {
                  xtype: 'MockfieldComent'
}
    }
]
});
