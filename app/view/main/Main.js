Ext.define('TrackIT.view.main.Main', {
    extend: 'Ext.tab.Panel',
    xtype: 'app-main',
    requires: [
        'Ext.plugin.Viewport',
        'Ext.window.MessageBox',

        'TrackIT.view.main.MainController',
        'TrackIT.view.main.MainModel',
        'TrackIT.view.main.tickets.ListaTickets',
        'TrackIT.view.main.historico.ListaTicketsHistorico',
        'TrackIT.view.main.MainWidget'
    ],

    controller: 'main',
    viewModel: 'main',
    plugins: 'viewport',
    ui: 'navigation',

    tabBarHeaderPosition: 1,
    titleRotation: 0,
    tabRotation: 0,

    header: {
        layout: {
            align: 'stretchmax'
        },
        title: {
            bind: {
            },
            flex: 0
        },
        html:'<img src="http://www.trackit.pt/images/logo.png" height="100" width="180"/>',
        items: [{
            xtype: 'button',
            text: 'Logout',
            margin: '10 0',
            handler: 'onClickButton'
        }]
    },

    tabBar: {
        flex: 1,
        layout: {
            align: 'stretch',
            overflowHandler: 'none'
        }
    },

    responsiveConfig: {
        tall: {
            headerPosition: 'top'
        },
        wide: {
            headerPosition: 'left'
        }
    },

    defaults: {
        bodyPadding: 20,
        tabConfig: {
            plugins: 'responsive',
            responsiveConfig: {
                wide: {
                    iconAlign: 'left',
                    textAlign: 'left'
                },
                tall: {
                    iconAlign: 'top',
                    textAlign: 'center',
                    width: 120
                }
            }
        }
    },

    items: [{
        title: 'Tickets',
        iconCls: 'fa-home',
        items: [{
            xtype: 'mainlisttickets'
        }]
    }, {
        title: 'Historico',
        iconCls: 'fa-eye',
        items: [{
            xtype: 'mainlisthistorico'
        }]
    },
        {
            title: 'Administração',
            id: 'admin',
            iconCls: 'fa-eye',
            items: [{
                xtype: 'mainwidget'
            }]
}],
    listeners: {
        'afterrender': function () {
            {
                method:'POST',
                    myRequest1 = Ext.Ajax.request({
                        url: 'app/php/Admin/verificaadmin.php',
                        success: function (response, opts){Ext.getCmp('admin').setDisabled(false);},
                        failure: function (){Ext.getCmp('admin').setDisabled(true);}
                    });
            }

        }
    }
});