Ext.define('TrackIT.store.respostas.RespostaSeleccionada', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Respostas',
    alias: 'store.respostaseleccionada',
    xtype: 'respostaseleccionada',
	storeId: 'respostaseleccionada',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadrespostaseleccionada.php',
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
