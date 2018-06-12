Ext.define('TrackIT.store.respostas.RespostasHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Respostas',
    alias: 'store.respostashistorico',
	storeId: 'StagingRespostasHistorico',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadrespostashistorico.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded');
    	}
    }
});
