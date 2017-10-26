Ext.define('TrackIT.view.admin.GestaoTickets.GridGestaoTickets', {
    extend: 'Ext.grid.Panel',
    id: 'gridGT',
    xtype: 'GridGTMax',

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    frame: false,

    border: false,



    defaults: {
        layout: 'form',
        margin: 0,
        border: 'false'

    },
    store: {
        type: 'MT'
    },

    columns: [

        { text: 'Nome Departamento', dataIndex: 'nome_departamento', flex: 1.4},
        { text: 'Id Departamento', dataIndex: 'id_departamento', flex: 1.4, hidden:true},

        { text: 'Novo', dataIndex: 'E_Novo', flex: 1.4},
        { text: 'Lido', dataIndex: 'E_Lido', flex: 1.4},
        { text: 'Sendo Lido', dataIndex: 'E_SLido', flex: 1.4},
        { text: 'Atribuido', dataIndex: 'E_Atribuido', flex: 1.4},
        { text: 'Fechado', dataIndex: 'E_Fechado', flex: 1.4},
        { text: 'Reaberto', dataIndex: 'E_Reaberto', flex: 1.4},

        { text: 'Max Tickets Departamentos ', dataIndex: 'MaxTicketsDep', flex: 1.9},

],

});
//timer
Ext.TaskManager.start({
    run: function(){
        Ext.getCmp('gridGT').getStore().load();
    },
    interval: 10000
});


