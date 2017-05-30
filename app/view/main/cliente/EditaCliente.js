Ext.define('TrackIT.view.main.cliente.EditaCliente', {
    extend: 'Ext.form.Panel',
    xtype: 'editacliente',
    controller: 'editacliente',
    requires: [
        'TrackIT.view.main.cliente.EditaClienteController'
    ],
    id: 'formeditcliente',
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
            fieldLabel: 'Username:',
            id: 'Nome_Cliente2',
            name: 'Nome_Cliente2'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'email:',
            id: 'Email_Cliente2',
            name: 'Email_Cliente2'

        },
        {
            xtype: 'datefield',
            format: 'd/m/Y',
            submitFormat: 'Y/m/d ',
            fieldLabel: 'Data Nascimento:',
            id: 'DataNasc_Cliente2'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Contribuinte:',
            id: 'Contribuinte_Cliente2'
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
                    click: 'onClickEditaclientes'
                }
            }
        ]
    }
});