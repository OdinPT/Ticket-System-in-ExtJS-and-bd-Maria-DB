Ext.define('TrackIT.view.admin.FormAtribuiFuncionario', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'atribuifuncionario',
    id: 'formregistahisFuncionario',
    controller: 'atribuifunc',
    requires: [
        'TrackIT.store.funcionario.FuncionariosDep'
    ],
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
            fieldLabel: 'Funcionários do Departamento',
            store: {
                type: 'FuncionariosDep'
            },
            valueField: 'usernamefunc',
            displayField: 'usernamefunc',
            typeAhead: true,
            queryMode: 'local',
            emptyText: 'Seleccione um utilizador ...',
            id: 'id_funcionario',
            submitValue:true,
            hiddenName : 'id_funcionario',
            allowBlank: false,
            blankText: 'Selecione um funcionário'

        }



    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Atribuir',
                glyph: 43,
                formBind: true,
                listeners: {

                    click: 'onClickAtribuirFuncionario'
                }

            }
        ]
    }
});