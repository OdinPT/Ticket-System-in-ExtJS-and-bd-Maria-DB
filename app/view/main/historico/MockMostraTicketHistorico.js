Ext.define('TrackIT.view.main.historico.MockMostraTicketHistorico', {
    extend: 'Ext.tab.Panel',
    xtype: 'mockmaintab',

    controller: 'ticketzzz',
    requires: [
        'TrackIT.store.historico.CarregaInfoHistoricoTicket',
        'TrackIT.view.main.historico.MostraInfoHistoricoTicketController',
        'TrackIT.view.main.historico.respostas.ListaRespostasHistorico'
    ],
    width: 1100,
    height: 610,

    store: {
        type: 'tickethistoricoseleccionado'
    },

    defaults: {
        bodyPadding: 0,
        scrollable: true,
        closable: true,
        margin:0
    },

    items: [{
        title: 'Conteúdo do Ticket',
        items: [
            {
                xtype: 'mockinfotickethistorico'
            },
            {
                xtype: 'mockmainlisthistoricocomenthistorico'
            },
            {
                xtype: 'mainlistanexoshistorico'
            },
            {
                xtype: 'Mockmainlistrespostashistorico'
            }

        ]
    },
        {
            title: 'Histórico dos Estados',
            items: [
                {
                    xtype: 'mainlisthistoricoesthist'
                }
            ]

        },

        {
            title: 'Histórico dos Departamentos',
            items: [
                {
                    xtype: 'mainlisthistoricoDep'
                }
            ]

        },
        {
            title: 'Histórico Atribuição',
            items: [
                {
                    xtype: 'mainlisthistoricoatribuicahis'
                }
            ]

        }
    ],
    listeners: {
        afterrender: function () {
            var store = Ext.getStore('tickethistoricoseleccionado');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var record = store.getAt(0);
                    var a = Ext.getCmp('idd').setValue(record.data.id);
                    var b = Ext.getCmp('emaill').setValue(record.data.email);
                    var b = Ext.getCmp('subjectt').setValue(record.data.subject);
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
