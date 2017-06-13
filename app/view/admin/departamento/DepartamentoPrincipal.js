Ext.define('TrackIT.view.admin.departamento.DepartamentoPrincipal', {
    extend: 'Ext.panel.Panel',
    requires: [
        'Ext.layout.container.HBox',
        'TrackIT.view.admin.departamento.FormRegistaDepartamento',
        'TrackIT.view.admin.departamento.GridMostraDepartamentos'

    ],
    xtype: 'departamentoprincipal',
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
            title: 'Registo de Departamento',
            flex: 1,
            margin: '0 10 0 0',
            items: [{
                xtype: 'registadepartamento'
            }]
        },
        {
            title: 'Lista de Departamentos',
            flex: 1,
            margin: '0 10 0 0',
            autoScroll: true,
            items: [{
                xtype: 'mainlistdepartamentos'
            }]
        }
    ]

});