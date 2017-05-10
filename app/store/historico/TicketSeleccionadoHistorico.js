
Ext.define('TrackIT.store.TicketSeleccionadoHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.TicketSelectedd',
    xtype: 'ticketselecteddd',
	storeId: 'ticketselecteddd',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadticketSeleccionadoHistorico.php',
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
