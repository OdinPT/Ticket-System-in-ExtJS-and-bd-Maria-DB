Ext.define('TrackIT.store.TipoFuncionario.TipoF', {
    extend: 'Ext.data.Store',
    model: 'TrackIT.model.TipoF',
    alias: 'store.TipoFunc',
    storeId: 'funcionario',

    data: [
        [1, 'teste'],
        [2, 'teste']
    ]
});


    //fields: ['ID_TipoUtilizador', 'Descricao_TipoUtilizador']

/*var tipo = new Ext.data.JsonStore({
fields:[
    {name: ID_TipoUtilizador},
    {name: Descricao_TipoUtilizador}
],
root:'rows',
    autoDestroy:true,
    autoLoad:true,
    proxy:new Ext.data.HttpProxy({
        url:'TipoFuncionario/MostraEstado.php'
    }),
});*/