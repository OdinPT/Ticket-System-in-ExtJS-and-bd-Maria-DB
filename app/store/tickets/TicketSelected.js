
Ext.define('TrackIT.store.tickets.TicketSelected', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.TicketSelected',
    xtype: 'ticketselectedd',
	storeId: 'ticketselectedd',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaTicketSeleccionado.php',
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
