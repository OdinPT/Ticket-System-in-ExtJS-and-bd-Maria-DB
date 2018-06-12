Ext.define('TrackIT.store.tickets.CarregaInfoTicket', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketseleccionado1',
    xtype: 'ticketseleccionado1',
	storeId: 'ticketseleccionado1',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/carregamstores/carregainfoticket.php',
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
