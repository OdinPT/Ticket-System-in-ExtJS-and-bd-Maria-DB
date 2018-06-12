Ext.define('TrackIT.view.admin.GestaoTickets.GridGestaoEstTicket', {
    extend: 'Ext.grid.Panel',
    id: 'gridfuncdep2',
    xtype: 'mainlistgestesticket',

    /*
    requires: [
        'TrackIT.store.admin.FuncDep'
    ],
    */

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },

    layout: {
        align: 'fit',
        type: 'form'
    },

    /*
    store: {
        type: 'funcdepartamento'
    },

    columns: [
        { text: 'username',  dataIndex: 'username', flex: 1},
        { text: 'Tipo Utilizador',  dataIndex: 'Descricao_TipoUtilizador', flex: 1},
        { text: 'Nome Departamento',  dataIndex: 'nome_departamento', flex: 1}
    ],*/

    onGridAfterRender: function(gridfuncdep){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});