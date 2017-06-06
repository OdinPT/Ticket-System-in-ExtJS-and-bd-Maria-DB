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
            emptyText : 'Insira o departamento',
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'id_departamento'
        },


        {

            emptyText : 'Insira o tipo de funcionario',
            xtype: 'textfield',
            fieldLabel: 'Tipo de funcionário:',
            id: 'tipo_funcionario'
            /*fieldLabel: 'ID Tipo utilizador:',
            displayField: 'Descricao_TipoUtilizador',

            store: {
                type: 'TipoF'
            },

            minChars: 0,
            queryMode: 'local',
            typeAhead: true,
            id: 'tipo_funcionario'*/
        }

            /*  emptyText : 'Insira o tipo de funcionario',
              xtype: 'textfield',
              fieldLabel: 'Tipo de funcionário:',
              id: 'tipo_funcionario'*/

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