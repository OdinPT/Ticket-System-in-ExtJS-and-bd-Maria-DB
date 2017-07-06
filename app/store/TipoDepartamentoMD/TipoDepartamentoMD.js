Ext.define('TrackIT.store.TipoDepartamentoMD.TipoDepartamentoMD', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.Departamento',
    alias: 'store.TipoDepartamentoMD',
    storeId: 'TipoDepartamentoMD',
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
