
Ext.define('TrackIT.view.main.tickets.HisComent.MostraComent', {
    extend: 'Ext.form.Panel',
    xtype: 'fieldComent',
    controller: 'respostacont',
    requires: [
        'TrackIT.store.HistoricoComentarios.ComentarioSeleccionado',
        'TrackIT.view.main.tickets.HisComent.ComentController'
    ],

    id: 'staticPageForm',
    frame: true,
    title: 'Comentario',
    width: 1080,
    height: 450,
    bodyPadding: 10,
    autoLoad: true,

    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form',
            margin: 20
        },

    config:{stores: ['comentarioselecionado']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID Comentario:',
            id: 'ID_Comentario'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID Ticket:',
            id: 'ID_Ticket'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data :',
            id: 'Data_comentario'
        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Comentário:',
            id: 'Comentario'
        },
        {
            xtype: 'textfield',
            fieldLabel: 'Nome Utilizador: ',
            id: 'username'
        }
    ],

    listeners: {
        afterrender: function () {
            var store = Ext.getStore('comentarioselecionado');
            store.load({
                callback: function (records, operation, success) {
                    var record = store.getAt(0);
                    var a = Ext.getCmp('ID_Comentario').setValue(record.data.ID_Comentario);
                    var b = Ext.getCmp('ID_Ticket').setValue(record.data.ID_Ticket);
                    var c = Ext.getCmp('Data_comentario').setValue(record.data.Data_comentario);
                    var d = Ext.getCmp('Comentario').setValue(record.data.Comentario);
                    var e = Ext.getCmp('username').setValue(record.data.username);
                }
            });
        }
    },
   /* dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Apagar',
                glyph: 43,
                listeners: {
                    click: 'onClickApagacoment'
                }

            }
        ]
    }*/

  });
