Ext.define('TrackIT.store.TipoFuncionario.TipoF', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoF',
    alias: 'store.TipoF',
    storeId: 'Tipofuncionario',

    data: [
        [1, "teste"],
        [2, 'teste32']
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