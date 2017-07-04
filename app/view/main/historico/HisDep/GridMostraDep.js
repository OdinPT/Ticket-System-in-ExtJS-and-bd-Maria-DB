
Ext.define('TrackIT.view.main.historico.HisDep.GridMostraDep', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisdep',
    xtype: 'mainlisthistoricoDep',
    requires: [
        'TrackIT.store.TipoDepartamentoMD.Departamentoshistorico',
        'Ext.toolbar.Paging'],

    autoLoad: true,
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
        type: 'Departamentosh'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoDep', flex: 0.1},
        { text: 'ID ticket ',  dataIndex: 'IdTicketDep', flex: 1.3},
        { text: 'Hora de atribuição', dataIndex: 'HoraAtribuicaoDep', flex: 2.4},
        { text: 'ID Departamento', dataIndex: 'nome_departamento', flex: 2.1},
        { text: 'ID funcionario', dataIndex: 'username', flex: 4}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('gridhisdep').store.reload();
                }
            }]
    },


    onGridAfterRender: function(gridhisest){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});