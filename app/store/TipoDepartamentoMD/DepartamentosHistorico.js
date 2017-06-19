
Ext.define('TrackIT.store.TipoDepartamentoMD.DepartamentosHistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.GridHistorico',
    alias: 'store.DepartamentosHistorico',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/TipDepartamento/loadgriddepartamentohistorico.php',
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
