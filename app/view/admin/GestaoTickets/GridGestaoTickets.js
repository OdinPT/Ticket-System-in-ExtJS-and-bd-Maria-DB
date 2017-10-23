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
    height: 200,
    width: 500,

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
        { text: 'Total de Tickets do Departamento',  dataIndex: 'MaxTicketsDep', flex: 1.1},
        { text: 'Max ND',  dataIndex: 'MaxDepartamentos', flex: 1.4, hidden:true},
        { text: 'Id Departamento', dataIndex: 'id_departamento', flex: 1.4, hidden:true},
        { text: 'Nome Departamento ', dataIndex: 'nome_departamento', flex: 1.4}
    ],

    onGridAfterRender: function(gridGT){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});



