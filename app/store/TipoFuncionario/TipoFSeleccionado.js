
Ext.define('TrackIT.store.cliente.ClienteSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Cliente',
    alias: 'store.clienteseleccionado',
    xtype: 'clienteseleccionado',
    storeId: 'clienteseleccionado',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadClienteseleccionado.php',
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