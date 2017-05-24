Ext.define('TrackIT.store.Estados', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Estados',
    alias: 'store.Estados',

	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaEstados.php',
        reader: {
        	type: 'json',
        	root: 'root'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded Estados');
    	}
    }
});
/*

 *     });







 */