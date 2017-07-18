
Ext.define('TrackIT.view.main.tickets.HisComentHistorico.GridMostracoment', {
    extend: 'Ext.grid.Panel',
    id: 'gridhiscoment2historico',
    xtype: 'mainlisthistoricocomenthistorico',
    requires: [
        'TrackIT.store.HistoricoComentariosHistorico.Comentario',
        'Ext.toolbar.Paging'],



    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'},
        title: 'Comentarios',
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
        { text: 'ID Comentario',  dataIndex: 'ID_Comentario', flex: 0.5},
        { text: 'ID do Ticket ',  dataIndex: 'ID_Ticket', flex: 0.5},
        { text: 'Data', dataIndex: 'Data_comentario', flex: 0.6},
        { text: 'Comentário', dataIndex: 'Comentario', flex: 2.0},
        { text: 'Nome de utilizador', dataIndex: 'ID_Utilizador', flex: 0.5}

    ],
    onGridAfterRender: function(gridhiscoment2historico){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});