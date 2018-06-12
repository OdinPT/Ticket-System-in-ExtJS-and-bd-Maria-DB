Ext.define('TrackIT.view.admin.utilizador.MostraFuncionario', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldfuncionario',
    controller: 'funcionariocont',
    requires: [
        'TrackIT.store.admin.FuncionarioSeleccionado',
        'TrackIT.view.admin.utilizador.MostraFuncionarioController'
    ],
    id: 'staticFuncionarioForm',
    frame: true,
    width: 500,
    height: 210,
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
        readOnly: true,
        hidden:true
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'usernamefunc',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Nome do Departamento:',
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
    },
    listeners: {
        afterrender: function () {
            var store = Ext.getStore('funcionarioseleccionado');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var a = Ext.getCmp('id_funcionario').setValue(record.data.id_funcionario);
                    var b = Ext.getCmp('usernamefunc').setValue(record.data.usernamefunc);
                    var c = Ext.getCmp('nome_departamento').setValue(record.data.nome_departamento);
                    var d = Ext.getCmp('Descricao_TipoUtilizador').setValue(record.data.Descricao_TipoUtilizador);
                }
            });
        }
    }

});