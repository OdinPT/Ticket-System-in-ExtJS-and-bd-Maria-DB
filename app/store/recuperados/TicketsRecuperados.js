
Ext.define('TrackIT.store.recuperados.TicketsRecuperados', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketsrecuperados',
	storeId: 'StagingRecuperados',
	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadticketsrecuperados.php',
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
