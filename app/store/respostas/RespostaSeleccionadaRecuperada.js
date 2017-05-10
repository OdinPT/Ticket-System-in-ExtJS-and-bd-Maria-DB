Ext.define('TrackIT.store.respostas.RespostaSeleccionadaRecuperada', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Respostas',
    alias: 'store.respostaseleccionadarecuperada',
    xtype: 'respostaseleccionadarecuperada',
	storeId: 'respostaseleccionadarecuperada',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadrespostaseleccionadarecuperada.php',
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
