Ext.define('TrackIT.store.admin.DepartamentoSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Departamento',
    alias: 'store.departamentoseleccionado',
    xtype: 'departamentoseleccionado',
    storeId: 'departamentoseleccionado',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loaddepartamentoseleccionado.php',
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