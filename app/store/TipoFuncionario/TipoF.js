Ext.define('TrackIT.store.TipoFuncionario.TipoF', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoF',
    alias: 'store.TipoF',
    storeId: 'Tipofuncionario',

    data: [
        [1, "Normal"],
        [2, 'Admin'],
        [3, 'SuperUser']
    ]
});

