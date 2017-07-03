Ext.define('TrackIT.store.TipoEstado.TipoEstado', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoEstado',
    alias: 'store.TipoEstado',
    storeId: 'TipoEstados',

    data: [
        [1, "Not solved"],
        [2, 'duplicate'],
        [3, 'Incomplete'],
        [4, 'Not applicable'],
        [5, 'Can not be solved']
    ]
});
