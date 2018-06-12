
Ext.define('TrackIT.store.TipoDepartamentoMD.Departamentoshistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.GridHistorico',
    alias: 'store.Departamentosh',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/TipoDepartamento/loadgriddepartamentohistorico.php',
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
