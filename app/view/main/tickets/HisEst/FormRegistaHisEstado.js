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
            fieldLabel: 'Atribuir novo Estado',
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
            emptyText: 'Seleccione um novo estado...'

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

/*

 listeners: {
 load: function () {
 //this sets the default value to USA after the store loads
 var combo = Ext.getCmp('countrySearchBox');
 combo.setValue("USA");
 }
 }

 */