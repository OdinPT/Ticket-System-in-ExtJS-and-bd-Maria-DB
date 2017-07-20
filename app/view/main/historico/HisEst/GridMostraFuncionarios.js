
Ext.define('TrackIT.view.main.historico.HisEst.GridMostraFuncionarios', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisest',
    xtype: 'mainlisthistoricoesthist',
    requires: [
        'TrackIT.store.HistoricoEstados.HistoricoEstadohistorico',
        'Ext.toolbar.Paging'],

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'},
        width: 1070,
        height: 550
    },
    layout: {
        align: 'fit',
        type: 'form',
        margin: 1
    },

    store: {
        type: 'HistoricoEstadohistorico'
    },

    columns: [
        { text: 'ID',  dataIndex: 'idHistoricoEstados', flex: 0.1, hidden:true},
        { text: 'ID do Ticket', dataIndex: 'IdTicketEstado', flex: 0.1, hidden:true},
        { text: 'Hora de atribuição ',  dataIndex: 'HoraAtribuicaoEstado', flex: 0.2},
        { text: 'Estado', dataIndex: 'Descricao_Estado', flex: 0.2},
        { text: 'Nome de utilizador', dataIndex: 'username', flex: 0.2},
        { text: 'Estado de Resoluçao', dataIndex: 'DesTipoRes', flex: 0.5}
    ],

    onGridAfterRender: function(gridhisest){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});