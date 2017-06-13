Ext.define('TrackIT.store.TipoEstado.TipoEstado', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoEstado',
    alias: 'store.TipoEstado',
    storeId: 'TipoEstados',

    data: [
        [1, "Aberto"],
        [2, 'Lido'],
        [4, 'Atribuido'],
        [5, 'Fechado'],
        [5, 'Reaberto']
    ]
});
