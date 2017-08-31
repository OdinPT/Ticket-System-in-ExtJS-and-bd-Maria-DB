Ext.define('TrackIT.store.admin.FuncDep', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.FuncDepartamento',
    alias: 'store.funcdepartamento',
    storeId: 'Staging',
    autoLoad: true,
    autoSync: true,
    pageSize: 400,
    currentPage: 1,
    proxy: {
        type: 'ajax',
        url: 'app/php/CarregamStores/MostraFuncdepartamentos.php',
        reader: {
            type: 'json',
            rootProperty: 'data'
        }
    },
    listeners: {
        load: function(){
            console.log('loaded funcionários dos departamentos');
        }
    }
});