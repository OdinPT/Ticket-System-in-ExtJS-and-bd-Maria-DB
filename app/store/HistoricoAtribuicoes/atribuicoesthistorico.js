Ext.define('TrackIT.store.HistoricoAtribuicoes.atribuicoesthistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Historicoatribuicao',
    alias: 'store.Historicoatribuicaohistorico',
	storeId: 'Staging',
	autoLoad: true,

    pageSize: 400,
    currentPage: 1,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaAtribuicaoSelecHistorico.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded atribuicao selecionada historico');
    	}
    }
});
