Ext.define('TrackIT.view.main.historico.HisComentHistorico.MockMostraComent', {
    extend: 'Ext.form.Panel',
    xtype: 'mockfieldComenthistorico',
    controller: 'respostacont',
    requires: [
        'TrackIT.store.HistoricoComentariosHistorico.ComentarioSeleccionado',
        'TrackIT.view.main.historico.HisComentHistorico.ComentController'
    ],

    id: 'staticPageForm',
    frame: true,
    title: 'Comentário',

    width: 1100,
    height: 308,
    autoLoad: true,

    layout: {
            type: 'form',
            align: 'stretch'
        },
        defaults: {
            layout: 'form'
        },

    config:{stores: ['comentarioselecionadohistorico']},

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'ID Comentario:',
            id: 'ID_Comentario',
            hidden:true,
        },
        {
            xtype: 'textfield',
            fieldLabel: 'ID do Ticket do comentário :',
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
            fieldLabel: 'Nome Utilizador que efetuou comentário: ',
            id: 'username'
        }
    ],

    listeners: {
        afterrender: function () {
            var store = Ext.getStore('comentarioselecionadohistorico');
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

  });
