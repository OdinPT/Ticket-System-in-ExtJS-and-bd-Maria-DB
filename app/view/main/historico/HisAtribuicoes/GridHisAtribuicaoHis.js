
Ext.define('TrackIT.view.main.historico.HisAtribuicoes.GridHisAtribuicaoHis', {
    extend: 'Ext.grid.Panel',
    id: 'gridhisatribuicao3',
    xtype: 'mainlisthistoricoatribuicahis',
    requires: [
        'TrackIT.store.HistoricoAtribuicoes.atribuicoesthistorico',
        'Ext.toolbar.Paging'],

    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'},
        width: 1090
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'Historicoatribuicaohistorico'
    },

    columns: [
        { text: 'ID Atribuição',  dataIndex: 'ID_Atribuicao', flex: 0.5, hidden:true},
        { text: 'Nome Remetente ',  dataIndex: 'ID_Func_Atribuidor', flex: 0.5},
        { text: 'Data de atribuição', dataIndex: 'DataAtribuicao', flex: 0.6},
        { text: 'Departamento do remetente', dataIndex: 'ID_DepAtribuicao', flex: 2.0},
        { text: 'Nome Destinatário', dataIndex: 'ID_Func_Atribuido', flex: 0.5}

    ],
    onGridAfterRender: function(gridhisatribuicao3){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});
