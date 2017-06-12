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
<<<<<<< HEAD
        xtype: 'departamentoprincipal'
    }]
=======
            /*items: [{
                xtype: 'registahisestado'
            }]*/
        }
    ]
>>>>>>> af3e644f43ab66531f9497bbfd5ac9cf4b8a9c82

});