
Ext.define('TrackIT.store.cliente.ClienteSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Clientes',
    alias: 'store.clienteoseleccionado',
    xtype: 'ClienteSeleccionado',
    storeId: 'Clienteseleccionado',
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