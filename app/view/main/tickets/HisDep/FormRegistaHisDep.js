Ext.define('TrackIT.view.main.tickets.HisDep.FormRegistaHisDep', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registahisDep',
    controller: 'TipoDepartamentoMD',
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
            valueField: 'id_departamento',
            displayField: 'nome_departamento',
            typeAhead: true,
            queryMode: 'local',
            id: 'id_departamento2',
            submitValue:true,
            hiddenName : 'id_departamento',
            allowBlank: false,
            emptyText: 'Seleccione um novo estado...'

        }
        /*{
            xtype: 'textfield',
            fieldLabel: 'ID departamento:',

            id: 'id_departamentos',
            name: 'pass',
            emptyText : 'Insira a password',
            allowBlank: false,
            blankText: 'Campo obrigatório'
        },*/

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