Ext.define('TrackIT.store.TipoDepartamento.TipoD', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.Departamento',
    alias: 'store.TipoD',
    storeId: 'TipoDepartamento',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/carregamStores/carregadepartamentos.php',
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