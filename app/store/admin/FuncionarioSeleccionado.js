Ext.define('TrackIT.store.admin.FuncionarioSeleccionado', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Funcionario',
    alias: 'store.funcionarioseleccionado',
    xtype: 'funcionarioseleccionado',
    storeId: 'funcionarioseleccionado',
    autoLoad: true,
    autoSync: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadfuncionarioseleccionado.php',
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