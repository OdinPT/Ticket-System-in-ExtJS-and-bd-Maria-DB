
Ext.define('TrackIT.store.tickets.Tickets', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.tickets',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregatickets.php',
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
