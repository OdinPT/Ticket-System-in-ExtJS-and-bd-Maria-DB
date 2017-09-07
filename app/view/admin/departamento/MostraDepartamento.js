Ext.define('TrackIT.view.admin.departamento.MostraDepartamento', {
    extend: 'Ext.form.Panel',
    xtype: 'fielddepartamento',
    controller: 'departamentocont',
    requires: [
        'TrackIT.store.admin.DepartamentoSeleccionado',
        'TrackIT.view.admin.departamento.MostraDepartamentoController'
    ],
    id: 'staticDepartamentoForm',

    frame: true,
    width: 660,
    height: 120,
    bodyPadding: 10,

    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 20
    },
    config:{stores: ['departamentoseleccionado']},


    items: [
        {
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'id_departamento3',
        readOnly: true,
        hidden: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Nome de Departamento:',
            id: 'nome_departamento3',
            readOnly: true
        }
    ],

    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Apagar Departamento',
                glyph: 43,
                listeners: {
                    click: 'onClickApagarDepartamento'
                }

            },
            {
                text: 'Editar Dados',
                glyph: 43,
                listeners: {
                    click: 'onClickEditaDepartamento'
                }

            },
            {
                text: 'Funcionários do Departamento',
                glyph: 43,
                listeners: {
                    click: 'onClickMostraFuncDep'
                }

            }
        ]
    },
    listeners: {
        afterrender: function () {
            var store = Ext.getStore('departamentoseleccionado');
            store.load({
                callback: function(records, operation, success) {
                    var record=store.getAt(0);
                    var a = Ext.getCmp('id_departamento3').setValue(record.data.id_departamento);
                    var b = Ext.getCmp('nome_departamento3').setValue(record.data.nome_departamento);
                }
            });
        }
    }
});