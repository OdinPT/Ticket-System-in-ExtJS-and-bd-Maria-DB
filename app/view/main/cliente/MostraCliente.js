Ext.define('TrackIT.view.main.cliente.MostraCliente', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldCliente',
    controller: 'Clientecont',
    requires: [
        'TrackIT.store.cliente.ClienteSeleccionado',
        'TrackIT.view.main.cliente.MostraClienteController'
    ],
    id: 'staticClienteForm',
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

    config:{stores: ['ClienteSeleccionado']},


    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'Id_Clientee'
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'Nome_Clientee'
        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Email:',
            id: 'Email_Clientee'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data de Nascimento:',
            id: 'DataNasc_Clientee'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Contribuinte:',
            id: 'Contribuinte_Clientee'
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
                    click: 'onClickObterCliente'
                }

            }
            /*{
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
            */
        ]
    }
});