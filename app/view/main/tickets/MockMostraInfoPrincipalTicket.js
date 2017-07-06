Ext.define('TrackIT.view.main.tickets.MockMostraInfoPrincipalTicket', {
    extend: 'Ext.form.Panel',
    xtype: 'mockinfoticketprincipal',

    requires: [
        'TrackIT.store.tickets.CarregaInfoPrincipalTicket',
        'TrackIT.view.main.tickets.MostraInfoPrincipalTicketController',
        'TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta'
    ],
    id: 'mockpaginainfoprincipalticket',
    title: 'Informação Principal',

<<<<<<< HEAD
    //width: 1100,

    width: 1000,
    height: 450,
=======
    width: 1000,
    height: 550,
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
    autoScroll: true,


    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 0
    },

    config:{stores: ['ticketseleccionado2']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID:',
            id: 'idd',
            readOnly: true

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Email:',
            id: 'emaill',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data:',
            id: 'dateaa',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Estado:',
            id: 'Descricao_Estado',
            readOnly: true
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Departamento:',
            id: 'nome_departamentoo',
            readOnly: true
        },
        {
            xtype: 'textfield',
<<<<<<< HEAD
            fieldLabel: 'Tipo Resolução mock:',
=======
            fieldLabel: 'Tipo Resolução :',
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
            id: 'DesTipoRes',
            readOnly: true
        },
        {
            xtype: 'textfield',
<<<<<<< HEAD
=======
            fieldLabel: 'Funcionário Atribuido:',
            id: 'id_func_emails',
            readOnly: true
        },
        {
            xtype: 'textfield',
>>>>>>> a24fcc125feea59199f412789f438675a17b8613
            fieldLabel: 'Assunto:',
            id: 'subjectt',
            readOnly: true
        },
        {
            xtype: 'textareafield',
            id: 'bodyy',
            fieldLabel: 'Corpo:',
            readOnly: true
        }
    ],
    listeners: {
        afterrender: function () {
            var store = Ext.getStore('ticketseleccionado2');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var a = Ext.getCmp('idd').setValue(record.data.id);
                    var h = Ext.getCmp('emaill').setValue(record.data.email);
                    var c = Ext.getCmp('dateaa').setValue(record.data.datea);
                    var d = Ext.getCmp('Descricao_Estado').setValue(record.data.Descricao_Estado);
                    var e = Ext.getCmp('DesTipoRes').setValue(record.data.DesTipoRes);
                    var e = Ext.getCmp('nome_departamentoo').setValue(record.data.nome_departamento);
                    var e = Ext.getCmp('subjectt').setValue(record.data.subject);
                    var e = Ext.getCmp('bodyy').setValue(record.data.body);
<<<<<<< HEAD
=======
                    var l = Ext.getCmp('id_func_emails').setValue(record.data.id_func_emails);

>>>>>>> a24fcc125feea59199f412789f438675a17b8613
                }
            });
        }
    }
});