
Ext.define('TrackIT.view.main.tickets.HisDep.GridMostraDep', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisdep',
    xtype: 'mainlisthistoricoDep',
    requires: [
        'TrackIT.store.TipoDepartamentoMD.Departamentos',
        'Ext.toolbar.Paging'],


    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'Departamentos'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoDep', flex: 0.1},
        { text: 'ID ticket ',  dataIndex: 'IdTicketDep', flex: 1.3},
        { text: 'Hora de atribuição', dataIndex: 'HoraAtribuicaoDep', flex: 2.4},
        { text: 'Nome do departamento Atribuido', dataIndex: 'IDDepartamentoDep', flex: 2.3},
        { text: 'Nome do funcionario', dataIndex: 'IDFuncEstado', flex: 4}
    ],

    onGridAfterRender: function(gridhisest){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});