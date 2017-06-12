Ext.define('TrackIT.view.admin.departamento.EditaDepartamento', {
    extend: 'Ext.form.Panel',
    xtype: 'editadepartamento',
    controller: 'editadepartamento',
    requires: [
        'TrackIT.view.admin.departamento.EditaDepartamentoController'
    ],
    id: 'formeditadepartamento',
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
            fieldLabel: 'ID(opcional):',
            id: 'id_departamento2',
            name: 'id_departamento2',
            allowBlank: true

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Nome de Departamento:',
            id: 'nome_departamento2',
            name: 'nome_departamento2',
            allowBlank: false,
            blankText: 'Campo obrigatório'

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
                    click: 'onClickEditaDepartamento'
                }
            }
        ]
    }
});