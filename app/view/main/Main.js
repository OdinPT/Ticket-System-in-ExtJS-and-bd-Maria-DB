
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
        'TrackIT.view.main.recuperados.ListaTicketsRecuperados'
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
                text: '{name}'
            },
            flex: 0
        },
        iconCls: 'fa-cloud',
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
        iconCls: 'fa-eye',
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
            iconCls: 'fa-eye',
            items : [
                Ext.widget('tabpanel', {
                    activeTab: 0,
                    items : [{
                        bodyPadding: 10,
                        title: 'Painel Principal de Administração',
                        xtype: 'adminprincipal'
                    },{
                        title: 'Child Tab 2',
                        bodyPadding: 10,
                        html : "My content of Child Tab 2 here"
                    }]
                })
            ]
        },
        {
            title: 'Lista Clientes',
            iconCls: 'fa-eye',
            items: [{
                xtype: 'mainlistCliente'
            }]
        }
        ]
});
