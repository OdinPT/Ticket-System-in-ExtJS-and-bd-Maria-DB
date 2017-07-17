
Ext.define('TrackIT.view.main.tickets.HisComent.GridMostracoment', {
    extend: 'Ext.grid.Panel',
    id: 'gridhiscoment2',
    xtype: 'mainlisthistoricocoment',
    requires: [
        'TrackIT.store.HistoricoComentarios.Comentario',
        'Ext.toolbar.Paging'],


    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'},
        title: 'Comentarios',
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'HistoricoComentarios'
    },

    columns: [
        { text: 'ID Comentario',  dataIndex: 'ID_Comentario', flex: 0.5},
        { text: 'ID do Ticket ',  dataIndex: 'ID_Ticket', flex: 0.5},
        { text: 'Data', dataIndex: 'Data_comentario', flex: 0.6},
        { text: 'Comentário', dataIndex: 'Comentario', flex: 2.0},
        { text: 'Nome de utilizador', dataIndex: 'ID_Utilizador', flex: 0.5}

    ],
    onGridAfterRender: function(gridhiscoment2){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});