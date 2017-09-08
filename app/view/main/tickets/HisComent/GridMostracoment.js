
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
        title: 'Comentários',
        width: 1050

    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'HistoricoComentarios'
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
                width: 1100,
                //height: 550,
                height: 400,
                items: [{
                    xtype: 'maintabcoment'
                }]
            });
            myWin.show();
        }


    },
    onGridAfterRender: function(gridhiscoment2){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});