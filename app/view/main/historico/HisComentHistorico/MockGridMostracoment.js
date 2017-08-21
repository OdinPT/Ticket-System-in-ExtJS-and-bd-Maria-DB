Ext.define('TrackIT.view.main.historico.HisComentHistorico.MockGridMostracoment', {
    extend: 'Ext.grid.Panel',
    id: 'gridhiscoment020historico',

    xtype: 'mockmainlisthistoricocomenthistorico',
    requires: [
        'TrackIT.store.HistoricoComentariosHistorico.Comentario',
        'Ext.toolbar.Paging'],



    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'},
        title: 'Comentários',
        width: 1050

    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'HistoricoComentariosHistorico'
    },

    columns: [
        { text: 'ID Comentario',  dataIndex: 'ID_Comentario', flex: 0.5, hidden:true},
        { text: 'ID do Ticket ',  dataIndex: 'ID_Ticket', flex: 0.5, hidden:true},
        { text: 'Data', dataIndex: 'Data_comentario', flex: 0.6},
        { text: 'Comentário', dataIndex: 'Comentario', flex: 2.0},
        { text: 'Nome de utilizador', dataIndex: 'ID_Utilizador', flex: 0.5}

    ],


    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('ID_Comentario');
            Ext.util.Cookies.set('cookieIDComent', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Comentários',
                modal: true,
                width: 1102,
                //height: 550,
                height: 395,
                items: [{
                    xtype: 'mockmaintabcomenthistorico'
                }]
            });
            myWin.show();
        }
    },

    onGridAfterRender: function(gridhiscoment020historico){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});