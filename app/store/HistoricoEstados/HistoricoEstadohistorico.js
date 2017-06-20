
Ext.define('TrackIT.store.HistoricoEstados.HistoricoEstadohistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.HistoricoEstados',
    alias: 'store.HistoricoEstadohistorico',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregahistoricoestahistorico.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded historico estado historico');
    	}
    }
});
