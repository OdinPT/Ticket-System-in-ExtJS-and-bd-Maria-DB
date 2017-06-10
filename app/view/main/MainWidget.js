Ext.define('TrackIT.view.main.MainWidget', {
    extend: 'Ext.tab.Panel',
    xtype: 'mainwidget',

    activeTab: 0,
    items: [{
        bodyPadding: 10,
        title: 'Painel Principal de Administração',
        xtype: 'adminprincipal'
    }, {
        title: 'Child Tab 2',
        bodyPadding: 10,
            /*items: [{
                xtype: 'registahisestado'
            }]*/
        }
    ]

});