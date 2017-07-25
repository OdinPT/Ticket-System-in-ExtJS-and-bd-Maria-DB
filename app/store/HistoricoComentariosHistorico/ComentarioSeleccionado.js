Ext.define('TrackIT.store.HistoricoComentariosHistorico.ComentarioSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Comentarios',
    alias: 'store.comentarioselecionadohistorico',
    xtype: 'comentarioselecionadohistorico',
	storeId: 'comentarioselecionadohistorico',
	autoLoad: true,
  autoSync: true,
	proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadComentarioSeleccionado.php',
        reader: {
        	type: 'json',
        	rootProperty: 'data'
        }
    },
    listeners: {
    	load: function(){
    		console.log('loaded comentario selecionado HISTORICO');
    	}
    }
});
