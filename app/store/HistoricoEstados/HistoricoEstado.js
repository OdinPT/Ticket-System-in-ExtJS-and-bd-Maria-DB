
Ext.define('TrackIT.store.HistoricoEstados.HistoricoEstado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.HistoricoEstados',
    alias: 'store.HistoricoEstados',
	storeId: 'Staging',
	autoLoad: true,
    pagesize:200,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregahistoricoestado.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded historico estado');
    	}
    }
});
