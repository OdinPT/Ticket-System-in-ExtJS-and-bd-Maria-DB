Ext.define('TrackIT.store.anexos.Anexoshistorico', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Anexos',
    alias: 'store.anexoshistorico',
    storeId: 'Staging',
    autoLoad: false,
    proxy: {
        type: 'ajax',
        url: 'app/php/ObterAnexoshistorico/src/loadanexos.php',
        reader: {
            type: 'json',
            rootProperty: 'data'
        }
    },
    listeners: {
        load: function(){
            console.log('loaded anexos historico');
        }
    }
});