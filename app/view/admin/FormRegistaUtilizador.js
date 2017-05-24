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
            id: 'user',
            name: 'user'
=======
            id: 'username',
            name: 'username'
>>>>>>> a6a4fdd9abaeff79e5b6ab4f2fd3c9ccd07d6901

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