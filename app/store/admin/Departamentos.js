Ext.define('TrackIT.store.admin.Departamentos', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Departamento',
    alias: 'store.departamentos',
    storeId: 'Staging',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loaddepartamentos.php',
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