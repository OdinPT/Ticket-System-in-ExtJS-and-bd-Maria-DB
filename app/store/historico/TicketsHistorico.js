Ext.define('TrackIT.store.TicketsHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketshistorico',
	storeId: 'StagingHistorico',
	autoLoad: false,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaticketshistorico.php',
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
