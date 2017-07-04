Ext.Loader.setPath('Ext.ux', '../ux/');

Ext.define('TrackIT.view.main.tickets.ListaTickets', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.gridticket',
    xtype: 'mainlisttickets',

    height: 600,
    requires: [
        'TrackIT.store.tickets.Tickets',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.tickets.MostraTicket',
        'TrackIT.store.tickets.TicketSelected',
        'TrackIT.view.main.tickets.enviaemail.FormEnviaEmail',
        'TrackIT.view.main.tickets.MockMostraTicket'
    ],
    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },

    title: 'Tickets',

    store: {
        type: 'tickets'
    },
    plugins: [{
        ptype: 'gridfilters'
    }],

    columns: [
        {text: 'ID ',  dataIndex: 'id', flex: 0.10,filter: {
            type: 'string'
        }},
        { text: 'Remetente',  dataIndex: 'fromaddress', flex: 1.7,
            filter: {
                type: 'string'
            }},
        { text: 'ASSUNTO', dataIndex: 'subject', flex: 2.2,
            filter: {
                type: 'string'
            }},
        { text: 'DATA', dataIndex: 'datea', flex: 1.4,
            filter: {
                type: 'string'
            }
        },
        { text: 'Corpo', dataIndex: 'body', flex: 2.5,
            filter: {
                type: 'string'
            }},
        { text: 'Estado', dataIndex: 'Descricao_Estado',flex: 1.0,
            filter: {
                type: 'string'
            },
            editor: {
                allowBlank: false,
                maxLength: 49
            }
        },
        { text: 'Resolução', dataIndex: 'DesTipoRes',flex: 1.0,
            filter: {
                type: 'string'
            },
            editor: {
                allowBlank: false,
                maxLength: 49
            }
        },
        {
            text: 'Atribuido a : ', dataIndex: 'id_func_emails', flex: 1.0,
            filter: {
                type: 'string'
            },
            editor: {
                allowBlank: false,
                maxLength: 49
            }
        },
        { text: 'Departamento', dataIndex: 'nome_departamento', flex: 1.2,
            filter: {
                type: 'string'
            },
            editor: {
                allowBlank: false,
                maxLength: 49
            }}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Atualizar',
                handler: function() {
                    Ext.MessageBox.wait('A carregar tickets...');
                    myRequest = Ext.Ajax.request({
                        url: 'app/php/filterimap.php',
                        method: 'POST',
                        success: function(response, opts) {
                            Ext.MessageBox.updateProgress(1);
                            Ext.MessageBox.hide();
                            var grid = Ext.ComponentQuery.query('gridticket')[0]
                            grid.getStore().load();
                        }
                    })
                }
            },
            {
                text: 'Limpar',
                renderTo: Ext.getBody(),
                handler: function() {
                    var grid = Ext.ComponentQuery.query('gridticket')[0];
                    grid.getStore().removeAll();
                }
            },
            {
                text: 'Escrever Email',
                glyph: 43,
                listeners: {
                    click: function(){
                        var myWin = Ext.create("Ext.window.Window", {
                            title: 'Escrever Email',
                            modal: true,
                            width: 700,
                            height: 320,
                            items: {
                                xtype: 'enviaemail'
                            }
                        });
                        myWin.show();
                    }
                }
            }

        ]
    },

    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id');
            Ext.util.Cookies.set('cookieID', id);
            var ide = index+1;
            Ext.util.Cookies.set('cookieIDe', ide);
            myRequest4 = Ext.Ajax.request({
                url: 'app/php/admin/verificauso.php',
                success: function (response, opts) {
                    var myWin = Ext.create("Ext.window.Window", {
                        title: 'Tickets',
                        modal: true,

                         width: 1100,
                         height: 550,

                        items: [{
                            xtype: 'maintabtickets'
                        }],
                        listeners: {
                            afterrender: function() {
                                var store = Ext.getStore('ticketseleccionado2');
                                store.load({
                                    callback: function(records, operation, success) {
                                        var record=store.getAt(0);
                                        var a =  Ext.getCmp('idd').setValue(record.data.id);
                                        var b =  Ext.getCmp('emaill').setValue(record.data.email);
                                        var b =  Ext.getCmp('subjectt').setValue(record.data.subject);
                                        var c = Ext.getCmp('bodyy').setValue(record.data.body);
                                        var d = Ext.getCmp('dateaa').setValue(record.data.datea);
                                        var e = Ext.getCmp('Descricao_Estado').setValue(record.data.Descricao_Estado);
                                        var f = Ext.getCmp('nome_departamentoo').setValue(record.data.nome_departamento);
                                        var h = Ext.getCmp('DesTipoRes').setValue(record.data.DesTipoRes);
                                        var i = Ext.getCmp('id_func_emails').setValue(record.data.id_func_emails);

                                        var gridt = Ext.ComponentQuery.query('gridticket')[0];
                                        gridt.getStore().load();
                                    }
                                });

                            }

                        }

                    });
                    myWin.show();
                    myWin.on("close", function() {
                        myRequest5 = Ext.Ajax.request({
                            url: 'app/php/Admin/mudaestado.php',
                            method: 'POST',
                            success: function(response, opts) {
                                var gridtt = Ext.ComponentQuery.query('gridticket')[0];
                                gridtt.getStore().load();
                            }
                        })
                    });

                },
                failure: function () {
                    alert('Sendo resolvido ...');
                    var gridtt = Ext.ComponentQuery.query('gridticket')[0];
                    gridtt.getStore().load();
                }


            })
        },
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id');
            Ext.util.Cookies.set('cookieID', id);
            var ide = index+1;
            Ext.util.Cookies.set('cookieIDe', ide);
            myRequest4 = Ext.Ajax.request({
                url: 'app/php/admin/verificauso.php',
                success: function (response, opts) {
                    var myWin = Ext.create("Ext.window.Window", {
                        title: 'Tickets',
                        modal: true,

                        height: 600,
                        items: [{
                            xtype: 'maintabtickets'
                        }],
                        listeners: {
                            afterrender: function() {
                                var store = Ext.getStore('ticketseleccionado2');
                                store.load({
                                    callback: function(records, operation, success) {
                                        var record=store.getAt(0);
                                        var a =  Ext.getCmp('idd').setValue(record.data.id);
                                        var b =  Ext.getCmp('emaill').setValue(record.data.email);
                                        var b =  Ext.getCmp('subjectt').setValue(record.data.subject);
                                        var c = Ext.getCmp('bodyy').setValue(record.data.body);
                                        var d = Ext.getCmp('dateaa').setValue(record.data.datea);
                                        var e = Ext.getCmp('Descricao_Estado').setValue(record.data.Descricao_Estado);
                                        var e = Ext.getCmp('id_func_emails').setValue(record.data.id_func_emails);

                                        var h = Ext.getCmp('DesTipoRes').setValue(record.data.DesTipoRes);
                                        var f = Ext.getCmp('nome_departamentoo').setValue(record.data.nome_departamento);

                                        var gridt = Ext.ComponentQuery.query('gridticket')[0];
                                        gridt.getStore().load();
                                    }
                                });

                            }

                        }

                    });
                    myWin.show();
                    myWin.on("close", function() {
                        myRequest5 = Ext.Ajax.request({
                            url: 'app/php/Admin/mudaestado.php',
                            method: 'POST',
                            success: function(response, opts) {
                                var gridtt = Ext.ComponentQuery.query('gridticket')[0];
                                gridtt.getStore().load();
                            }
                        })
                    });

                },
                failure: function () {

                    var MockmyWin = Ext.create("Ext.window.Window", {
                        title: 'Tickets',
                        modal: true,
                        width: 1100,
                        height: 600,
                        items: [{
                            xtype: 'mockmaintabtickets'
                        }]

                    });
                    MockmyWin.show();
                }


            })
        }
    },
    GridAfterRender: function(gridticket){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});
