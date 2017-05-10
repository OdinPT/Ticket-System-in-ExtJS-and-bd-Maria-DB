Ext.define('TrackIT.store.recuperados.CarregaInfoPrincipalTicketRecuperado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketrecuperadoseleccionado2',
    xtype: 'ticketrecuperadoseleccionado2',
	storeId: 'ticketrecuperadoseleccionado2',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/carregamstores/carregainfoprincipalticketrecuperado.php',
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
