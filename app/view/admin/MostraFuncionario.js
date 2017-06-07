Ext.define('TrackIT.view.admin.MostraFuncionario', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldfuncionario',
    controller: 'funcionariocont',
    requires: [
        'TrackIT.store.admin.FuncionarioSeleccionado',
        'TrackIT.view.admin.MostraFuncionarioController'
    ],
    id: 'staticFuncionarioForm',
    frame: true,
    width: 500,
    height: 300,
    bodyPadding: 10,

    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 20
    },

    config:{stores: ['funcionarioseleccionado']},


    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'id_funcionario',
        readOnly: true
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'usernamefunc',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID do Departamento:',
            id: 'nome_departamento',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Tipo de funcionário:',
            id: 'Descricao_TipoUtilizador',
            readOnly: true
        }
    ],


    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Carregar Funcionário',
                glyph: 43,
                listeners: {
                    click: 'onClickObterResposta'
                }

            },
            {
                text: 'Apagar Funcionário',
                glyph: 43,
                listeners: {
                    click: 'onClickApagarFuncionario'
                }

            },
            {
                text: 'Editar Dados',
                glyph: 43,
                listeners: {
                    click: 'onClickEditaFuncionario'
                }

            }
        ]
    }
});