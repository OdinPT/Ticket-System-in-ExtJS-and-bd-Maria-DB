Ext.define('TrackIT.view.admin.GestaoTickets.GridGestaoTickets', {
    extend: 'Ext.grid.Panel',
    id: 'gridGT',
    xtype: 'GridGTMax',

    config: {
        autoLoad: true,
        scroll:true
       // style:{overflow: 'auto',}
    },

    layout: {
        align: 'fit',
        type: 'form',
        width: 50,
        height: 400

    },
    store: {
        type: 'MT'
    },

    columns: [
        { text: 'Max Developpers',  dataIndex: 'MaxDev', flex: 1.1},
        { text: 'Max ND',  dataIndex: 'MaxND', flex: 1.4},
        { text: 'Max Operações', dataIndex: 'MaxOp', flex: 1.4},
        { text: 'Max Call center ', dataIndex: 'MaxCcenter', flex: 1.4}
    ],

    onGridAfterRender: function(gridGT){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});



