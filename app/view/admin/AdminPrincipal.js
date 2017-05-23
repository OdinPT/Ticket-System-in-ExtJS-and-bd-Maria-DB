Ext.define('TrackIT.view.admin.AdminPrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        'TrackIT.view.admin.FormRegistaUtilizador',
        'TrackIT.view.admin.GridMostraFuncionarios'

    ],
    xtype: 'adminprincipal',
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
            title: 'Formulário de Registo',
            flex: 2,
            margin: '0 10 0 0',
            items: [{
                xtype: 'registautilizador'
            }]
        },
        {
            title: 'Lista de funcionários',
            flex: 2,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                xtype: 'mainlistfuncionarios'
            }]
        },
        {
            title: 'Panel 3',
            flex: 2,
            margin: '0 10 0 0'
        }
    ]

});