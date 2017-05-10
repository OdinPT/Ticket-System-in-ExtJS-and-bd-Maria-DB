Ext.define('TrackIT.store.respostas.RespostaSeleccionadaHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Respostas',
    alias: 'store.respostaseleccionadahistorico',
    xtype: 'respostaseleccionadahistorico',
	storeId: 'respostaseleccionadahistorico',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadrespostaseleccionadahistorico.php',
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
