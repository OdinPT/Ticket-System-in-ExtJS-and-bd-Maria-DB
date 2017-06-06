Ext.define('TrackIT.view.main.TicketWidget', {
    extend: 'Ext.tab.Panel',
    xtype: 'ticketwidget',

    activeTab: 0,
    items: [{
        bodyPadding: 10,
        title: 'Painel Principal',
        xtype: 'ticketsprincipal'
    }, {
        title: 'Child Tab 2',
        bodyPadding: 10,
        html: "My content of Child Tab 2 here"
    }]

});