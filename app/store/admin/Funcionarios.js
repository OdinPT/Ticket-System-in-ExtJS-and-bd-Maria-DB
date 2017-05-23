Ext.define('TrackIT.store.admin.Funcionarios', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.Funcionario',
    alias: 'store.funcionarios',
    storeId: 'Staging',
    autoLoad: false,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/loadfuncionarios.php',
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