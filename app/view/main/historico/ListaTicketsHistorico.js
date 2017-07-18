Ext.define('TrackIT.view.main.historico.ListaTicketsHistorico', {
    extend: 'Ext.grid.Panel',
    id: 'grid2',
    xtype: 'mainlisthistorico',
    requires: [
        'TrackIT.store.TicketsHistorico',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.historico.MostraTicketHistorico',
        'TrackIT.view.main.historico.TicketControllerHistorico'
    ],

    height: 700,
    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    title: 'Historico',

    store: {
        type: 'ticketshistorico'
    },

    plugins: [{
        ptype: 'gridfilters'
    }],
    columns: [
        {text: 'ID ',  dataIndex: 'id', flex: 0.4,filter: {
            type: 'string'
        }},
        { text: 'Remetente',  dataIndex: 'fromaddress', flex: 1.6,
            filter: {
                type: 'string'
            }},
        { text: 'ASSUNTO', dataIndex: 'subject', flex: 2.2,
            filter: {
                type: 'string'
            }},
        { text: 'DATA', dataIndex: 'datea', flex: 1.5,
            filter: {
                type: 'string'
            }},
        { text: 'Corpo', dataIndex: 'body', flex: 3.7,
            filter: {
                type: 'string'
            }},{ text: 'Estado', dataIndex: 'Descricao_Estado',flex: 1.0,
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
            url: 'app/php/CarregamStores/carregaticketshistorico.php',
      method: 'POST',
      success: function(response, opts) {
        Ext.MessageBox.updateProgress(1);
Ext.MessageBox.hide();
      Ext.getCmp('grid2').store.reload();
    }
    })
}
    },
    {
      text: 'Limpar',
      handler: function(){
        myRequest = Ext.Ajax.request({
          url: 'app/php/Limpar/limpaticketshistorico.php',
          method: 'POST'
        }),
        Ext.getCmp('grid2').store.reload();
      }
    }
        ]
    },

    listeners: {
        itemclick: function (view, record, item, index, e) {
            var id = record.get('id');
            Ext.util.Cookies.set('cookieIDhistorico', id);
            Ext.util.Cookies.set('cookieParticao', 'historico');
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Historico do Ticket',
                modal: true,
                width: 1100,
                height: 650,
                items: [{
                    xtype: 'maintabsss'
                }], // add funcion ther
                listeners: {
                    afterrender: function () {
                        var store = Ext.getStore('tickethistoricoseleccionado');
                        store.load({
                            callback: function(records, operation, success) {
                                var record=store.getAt(0);
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


                            }
                        });

                    }
                }
            });
            myWin.show();

        }
    }
});
