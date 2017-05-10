Ext.define('TrackIT.store.tickets.CarregaInfoPrincipalTicket', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketseleccionado2',
    xtype: 'ticketseleccionado2',
	storeId: 'ticketseleccionado2',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/carregamstores/carregainfoprincipalticket.php',
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
