Ext.define('TrackIT.store.funcionario.FuncionariosDep', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.Funcionario',
    alias: 'store.FuncionariosDep',
    storeId: 'FuncionariosDep',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/carregamStores/carregafuncionariosdep.php',
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