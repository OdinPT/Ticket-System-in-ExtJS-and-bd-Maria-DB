
Ext.define('TrackIT.view.main.historico.HisEst.GridMostraEst', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisest',
    xtype: 'mainlisthistoricoesthist',
    requires: [
        'TrackIT.store.HistoricoEstados.HistoricoEstadohistorico',
        'Ext.toolbar.Paging'],

    //width: 630,
    width: 1000,
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
        type: 'HistoricoEstadohistorico'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoEstados', flex: 0.1},
        { text: 'Hora de atribuição ',  dataIndex: 'HoraAtribuicaoEstado', flex: 0.5},
        { text: 'Id Ticket', dataIndex: 'IdTicketEstado', flex: 0.2},
        { text: 'Estado', dataIndex: 'Descricao_Estado', flex: 0.3},
        { text: 'Nome de utilizador', dataIndex: 'username', flex: 0.7}
    ],


    onGridAfterRender: function(gridhisest){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});