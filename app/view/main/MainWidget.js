Ext.define('TrackIT.view.main.MainWidget', {
    extend: 'Ext.tab.Panel',
    xtype: 'mainwidget',

    activeTab: 0,
    items: [
        {
            title: 'Gestão de Tickets',
            bodyPadding: 10,
            xtype: 'GestaoTicketprincipal'
        },

        {
            title: 'Administração de Departamentos',
            bodyPadding: 10,
            xtype: 'departamentoprincipal'
        },

        {
            bodyPadding: 10,
            title: 'Administração de Utilizadores',
            xtype: 'adminprincipal'
        },
        ]


});