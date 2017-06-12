Ext.define('TrackIT.view.main.MainWidget', {
    extend: 'Ext.tab.Panel',
    xtype: 'mainwidget',

    activeTab: 0,
    items: [{
        bodyPadding: 10,
        title: 'Administração de Utilizadores',
        xtype: 'adminprincipal'
    }, {
        title: 'Administração de Departamentos',
        bodyPadding: 10,
        xtype: 'departamentoprincipal'
    }]

});