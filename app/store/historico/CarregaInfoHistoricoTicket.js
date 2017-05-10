Ext.define('TrackIT.store.historico.CarregaInfoHistoricoTicket', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.tickethistoricoseleccionado',
    xtype: 'tickethistoricoseleccionado',
	storeId: 'tickethistoricoseleccionado',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregainfohistoricoticket.php',
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
