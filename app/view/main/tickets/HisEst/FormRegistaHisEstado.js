Ext.define('TrackIT.view.admin.FormRegistaHisEstado', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registahisestado',
    controller: 'registahisestado',
    requires: [
        'TrackIT.view.admin.FormRegistaHisEstadoController'

    ],
    id: 'formregistahisEstado',
    frame: false,

    height: 130,
    border: false,
    //title: 'Alterar Estado ',

    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {
        layout: 'form',
        margin: 20,
        border: 'true'
    },

    items: [

        {

            xtype: 'combobox',
            fieldLabel: 'Alterar Estado',
            store: {
                type: 'TipoEstado'
            },
            valueField: 'ID_Estado',
            displayField: 'Descricao_Estado',
            typeAhead: true,
            queryMode: 'local',
            id: 'ID_Estado',
            submitValue:true,
            hiddenName : 'ID_Estado',
            allowBlank: false,
            blankText: 'Selecione um Estado',
            emptyText: 'Seleciona o novo Estado...'


        }

    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Registar',
                glyph: 43,
                formBind: true,
                listeners: {
                    click: 'onClickRegistarEstado'
                }

            }
        ]
    }
});