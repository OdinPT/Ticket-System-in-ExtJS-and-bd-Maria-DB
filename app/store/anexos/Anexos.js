Ext.define('TrackIT.store.anexos.Anexos', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Anexos',
    alias: 'store.anexos',
    storeId: 'StagingAnexos',
    autoLoad: false,
    proxy: {
        type: 'ajax',
        url: 'app/php/ObterAnexos/src/loadanexos.php',
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