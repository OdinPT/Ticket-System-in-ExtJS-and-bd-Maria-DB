
Ext.define('TrackIT.store.recuperados.TicketsSeleccionadosRecuperados', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.Ticketrecuperadoseleccionado1',
    //xtype: 'ticketselectedddd',
    xtype: 'ticketrecuperadoseleccionado1',
	storeId: 'ticketrecuperadoseleccionado1',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadticketSeleccionadoRecuperado.php',
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
