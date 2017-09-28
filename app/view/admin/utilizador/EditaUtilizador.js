Ext.define('TrackIT.view.admin.utilizador.EditaUtilizador', {
    extend: 'Ext.form.Panel',
    xtype: 'editautilizador',
    controller: 'editautilizador',
    requires: [
        'TrackIT.view.admin.utilizador.EditaUtilizadorController'
    ],
    id: 'formeditautilizador',
    frame: true,
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
            displayField: 'nome_departamento',
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
            emptyText: 'Select tipo funcionário...',
            id: 'tipo_funcionario2',
            submitValue:true,
            hiddenName : 'ID_TipoUtilizador',
            allowBlank: false,
            blankText: 'Selecione um departamento'
        },
        {
            fieldLabel: 'Permitir login no SI :',
            xtype: 'checkbox',
            name: 'system',
            iputValue: 'production',
            id:'login2',

            listeners: {
                check: function (checkbox, isChecked) {
                    var sample = Ext.getCmp('login2');
                }

            }
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