Ext.define('TrackIT.store.TipoDepartamento.TipoD', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoD',
    alias: 'store.TipoD',
    storeId: 'TipoDepartamento',

    data: [
        [1, "Call Center"],
        [2, 'Operations'],
        [3, 'ND'],
        [4, 'Devellopers']
    ]
});
