Ext.define('TrackIT.view.admin.FormRegistaUtilizador', {
    extend: 'Ext.form.Panel',
    xtype: 'registautilizador',
    controller: 'registautilizador',
    requires: [
        'TrackIT.view.admin.FormRegistaUtilizadorController'
    ],
    id: 'formregistautilizador',
    frame: false,
    height: 320,
    border: false,


    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {
        layout: 'form',
        margin: 0,
        border: 'false'
    },

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'user',
            name: 'user',
            emptyText : 'Insira o nome de utilizador',
            allowBlank: false,
            blankText: 'Campo obrigatório'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Password:',
            inputType: 'password',
            id: 'pass',
            name: 'pass',
            emptyText : 'Insira a password',
            allowBlank: false,
            blankText: 'Campo obrigatório'
        },
        {
            xtype: 'combobox',
            fieldLabel: 'Tipo de departamento',
            store: {
                type: 'TipoD'
            },
            valueField: 'id_departamento',
            displayField: 'Descricao_TipoUtilizador',
            typeAhead: true,
            queryMode: 'local',
            emptyText: 'Select a state...',
            id: 'id_departamento',
            submitValue:true,
            hiddenName : 'id_departamento'


            /*  emptyText : 'Insira o departamento',
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'id_departamento'*/
        },


        {
            xtype: 'combobox',
            fieldLabel: 'Tipo de funcionario',
            store: {
                type: 'TipoF'
            },
            valueField: 'tipo_funcionario',
            displayField: 'Descricao_TipoUtilizador',
            typeAhead: true,
            queryMode: 'local',
            emptyText: 'Select a state...',
            id: 'tipo_funcionario',
            submitValue:true,
            hiddenName : 'tipo_funcionario'


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
                    click: 'onClickRegistarUtilizador'
                }
            }
        ]
    }
});