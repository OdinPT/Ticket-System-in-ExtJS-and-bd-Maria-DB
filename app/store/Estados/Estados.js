Ext.define('TrackIT.store.TipoFuncionario.Estados', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoE',
    alias: 'store.TipoE',
    storeId: 'Tipoestado',

    data: [
        [1, "Aberto"],
        [2, 'Lido'],
        [3, 'Atribuido'],
        [4, 'Fechado'],
        [5, 'Reaberto']
    ]
});

