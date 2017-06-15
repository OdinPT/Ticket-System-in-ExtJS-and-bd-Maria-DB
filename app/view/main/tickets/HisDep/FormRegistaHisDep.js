Ext.define('TrackIT.view.main.tickets.HisDep.FormRegistaHisDep', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registahisDep',
    controller: 'registahisDep',
    requires: [
        'TrackIT.view.main.tickets.HisDep.FormRegistaHisDepController'
    ],
    id: 'formregistahisDep',
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
            fieldLabel: 'Atribuir novo Departamento',
            store: {
                type: 'TipoDepartamentoMD'
            },
            valueField: 'id_departamentos',
            displayField: 'nome_departamentos',
            typeAhead: true,
            queryMode: 'local',
            id: 'id_departamentos',
            submitValue:true,
            hiddenName : 'id_departamentos',
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

                    click: 'onClickRegistardep'
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