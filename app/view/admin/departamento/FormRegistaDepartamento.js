Ext.define('TrackIT.view.admin.departamento.FormRegistaDepartamento', {
    extend: 'Ext.form.Panel',
    xtype: 'registadepartamento',
    controller: 'registadepartamento',
    requires: [
        'TrackIT.view.admin.departamento.FormRegistaDepartamentoController'
    ],
    id: 'formregistadepartamento',
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
            fieldLabel: 'ID(opcional):',
            id: 'id_departamento4',
            name: 'id_departamento4',
            emptyText : 'Insira o ID do departamento',
            allowBlank: true

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Nome de Departamento:',
            id: 'nome_departamento4',
            name: 'nome_departamento4',
            emptyText : 'Insira o nome de departamento',
            allowBlank: false,
            blankText: 'Campo obrigatório'

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
                    click: 'onClickRegistarDepartamento'
                }

            }
        ]
    }
});