Ext.define('TrackIT.store.historico.CarregaInfoHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Ticket',
    alias: 'store.historicoseleccionado1',
    xtype: 'historicoseleccionado1',
	storeId: 'historicoseleccionado1',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/carregamstores/carregainfohistorico.php',
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
