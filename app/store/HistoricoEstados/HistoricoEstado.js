
Ext.define('TrackIT.store.HistoricoEstados.HistoricoEstado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.HistoricoEstados',
    alias: 'store.HistoricoEstados',
	storeId: 'Staging',
	autoLoad: true,
<<<<<<< HEAD
=======
    pagesize:200,
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
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
