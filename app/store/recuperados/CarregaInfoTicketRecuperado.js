Ext.define('TrackIT.store.recuperados.CarregaInfoTicketRecuperado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.ticketrecuperadoseleccionado1',
    xtype: 'ticketrecuperadoseleccionado1',
	storeId: 'ticketrecuperadoseleccionado1',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/carregamstores/carregainfoticketrecuperado.php',
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
