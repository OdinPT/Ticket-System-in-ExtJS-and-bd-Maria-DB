Ext.define('TrackIT.view.main.MainWidget', {
    extend: 'Ext.tab.Panel',
    xtype: 'mainwidget',

    activeTab: 0,
    items: [{
        bodyPadding: 10,
        title: 'Painel Principal de Administração',
        xtype: 'adminprincipal'
<<<<<<< HEAD
    }, {
        title: 'Child Tab 2',
        bodyPadding: 10,
        html: "My content of Child Tab 2 here"
=======
>>>>>>> a2c9ddbb2da01c57ede24ad8a2a037112ec37c4d
    }]

});