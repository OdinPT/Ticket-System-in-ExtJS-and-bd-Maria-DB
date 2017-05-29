Ext.define('TrackIT.view.main.cliente.ClientePrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        'TrackIT.view.main.cliente.FormRegistaCliente',
        'TrackIT.view.main.cliente.GridMostraClientes'

    ],
    xtype: 'Clienteprincipal',
    width: 500,
    height: 400,

    layout: {
        type: 'hbox',
        pack: 'start',
        align: 'stretch'
    },

    bodyPadding: 10,

    defaults: {
        frame: true,
        bodyPadding: 10
    },

    items: [
        {
            title: 'Formulário de Registo de Clientes',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'registaCliente'
            }]
        },
        {
            title: 'Lista de funcionários',
            flex: 1,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                xtype: 'mainlistclientes'
            }]
        }
    ]

});