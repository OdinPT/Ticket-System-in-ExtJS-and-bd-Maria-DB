Ext.define('TrackIT.view.admin.utilizador.AdminPrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        'TrackIT.view.admin.utilizador.FormRegistaUtilizador',
        'TrackIT.view.admin.utilizador.GridMostraFuncionarios'

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
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'registautilizador'
            }]
        },
        {
            title: 'Lista de funcionários',
            flex: 1,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                xtype: 'mainlistfuncionarios'
            }]
        }
    ]

});