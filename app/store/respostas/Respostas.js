Ext.define('TrackIT.store.respostas.Respostas', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Respostas',
    alias: 'store.respostas',
	storeId: 'StagingRespostas',
	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadrespostas.php',
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
