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

    config:{stores: ['clienteseleccionado']},


    items: [{
        xtype: 'textfield',
        fieldLabel: 'ID:',
        id: 'Id_Cliente'
    },
        {
            xtype: 'textfield',
            fieldLabel: 'Username:',
            id: 'Nome_Cliente'
        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Email:',
            id: 'Email_Cliente'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data de Nascimento:',
            id: 'DataNasc_Cliente'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Contribuinte:',
            id: 'Contribuinte_Cliente'
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