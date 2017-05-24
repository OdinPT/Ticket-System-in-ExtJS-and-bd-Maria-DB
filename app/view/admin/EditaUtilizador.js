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
            inputType: 'password2',
            id: 'password2',
            name: 'pass2'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'id_departamento2'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Tipo de funcionário:',
            id: 'tipo_funcionario2'
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