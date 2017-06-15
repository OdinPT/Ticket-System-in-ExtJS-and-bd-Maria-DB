Ext.define('TrackIT.store.TipoDepartamentoMD.TipoDepartamentoMD', {
    extend: 'Ext.data.ArrayStore',
    model: 'TrackIT.model.TipoDepartamento',
    alias: 'store.TipoDepartamentoMD',
    storeId: 'TipoDepartamentoMD',

    data: [
        [1, "call center"],
        [2, 'Operations']


    ]


});
