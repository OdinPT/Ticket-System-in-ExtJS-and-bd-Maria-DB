Ext.define('TrackIT.store.HistoricoComentarios.ComentarioSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Comentarios',
    alias: 'store.comentarioselecionado',
    xtype: 'comentarioselecionado',
	storeId: 'comentarioselecionado',
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
    		console.log('loaded comentario selecionado');
    	}
    }
});
