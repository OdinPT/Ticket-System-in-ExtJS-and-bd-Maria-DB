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
<<<<<<< HEAD
            id: 'username',
            name: 'username'

=======
            id: 'user',
            name: 'user',
            id: 'username',
            name: 'username'
>>>>>>> 6a773c80fc8a7c46b814e70cefb7b9b5e5603a8e

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Password:',
            inputType: 'password',
            id: 'pass',
            name: 'pass'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'id_departamento'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Tipo de funcionário:',
            id: 'tipo_funcionario'
        }
    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Registar',
                glyph: 43,
                listeners: {
                    click: 'onClickRegistarUtilizador'
                }
            }
        ]
    }
});