
Ext.define('TrackIT.store.HistoricoComentarios.Comentario', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Comentarios',
    alias: 'store.HistoricoComentarios',
	storeId: 'Staging',
	autoLoad: true,

    pageSize: 400,
    currentPage: 1,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/carregaComentarios.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded historico comentario');
    	}
    }
});
