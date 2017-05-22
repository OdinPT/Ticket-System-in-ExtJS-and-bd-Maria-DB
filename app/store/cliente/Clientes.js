Ext.define('TrackIT.store.cliente.Clientes', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Clientes',
    alias: 'store.clientes',

	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaClientes.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded Clientes');
    	}
    }
});
