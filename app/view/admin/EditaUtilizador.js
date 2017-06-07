Ext.define('TrackIT.view.admin.EditaUtilizador', {
    extend: 'Ext.form.Panel',
    xtype: 'editautilizador',
    controller: 'editautilizador',
    requires: [
        'TrackIT.view.admin.EditaUtilizadorController'
    ],
    id: 'formeditautilizador',
    frame: true,
    width: 500,
    height: 300,
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
            id: 'user2',
            name: 'user2'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Password:',
            inputType: 'password',
            id: 'password2',
            name: 'pass2'

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
            emptyText: 'Seleciona  departamento...',
            id: 'id_departamento2',
            submitValue:true,
            hiddenName : 'id_departamento',
            allowBlank: false,
            blankText: 'Selecione um departamento'

        },

        {
            xtype: 'combobox',
            fieldLabel: 'Tipo :',
            store: {
                type: 'TipoF'
            },
            valueField: 'ID_TipoUtilizador',
            displayField: 'Descricao_TipoUtilizador',
            typeAhead: true,
            queryMode: 'local',
            emptyText: 'Select a state...',
            id: 'tipo_funcionario2',
            submitValue:true,
            hiddenName : 'ID_TipoUtilizador',
            allowBlank: false,
            blankText: 'Selecione um departamento'

        }
    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Editar',
                glyph: 43,
                listeners: {
                    click: 'onClickEditaUtilizador'
                }
            }
        ]
    }
});