
Ext.define('TrackIT.store.HistoricoDepartamento.HistoricoDepartamento', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.HistoricoDepartamentos',
    alias: 'store.HistoricoDepartamentos',
	storeId: 'Staging',
	autoLoad: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregahistoricoDepartamento.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded historico Departamento');
    	}
    }
});
