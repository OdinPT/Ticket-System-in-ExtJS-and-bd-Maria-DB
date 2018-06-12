Ext.define('TrackIT.store.TipoFuncionario.TipoF', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoF',
    alias: 'store.TipoF',
    storeId: 'Tipofuncionario',
    autoLoad: true,
    proxy: {
        type: 'ajax',
        url: 'app/php/carregamStores/carregatipofuncionarios.php',
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
