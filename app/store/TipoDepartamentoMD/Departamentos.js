
Ext.define('TrackIT.store.TipoDepartamentoMD.Departamentos', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.GridHistorico',
    alias: 'store.Departamentos',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/TipoDepartamento/loadgriddepartamento.php',
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
