Ext.define('TrackIT.view.main.tickets.HisComent.ComentController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.comentcont',

    onClickObterResposta: function() {
        var store = Ext.getStore('comentarioselecionado');
        store.load({
            callback: function (records, operation, success) {
                var record = store.getAt(0);
                var a = Ext.getCmp('ID_Comentario').setValue(record.data.ID_Comentario);
                var b = Ext.getCmp('ID_Ticket').setValue(record.data.ID_Ticket);
                var c = Ext.getCmp('Data_comentario').setValue(record.data.Data_comentario);
                var d = Ext.getCmp('Comentario').setValue(record.data.Comentario);
                var e = Ext.getCmp('ID_Utilizador').setValue(record.data.ID_Utilizador);
            }
        });
    },

    //onClickEditacoment


    onClickEditacoment: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editacomentario.php',

                success: function (response, opts) {
                    Ext.MessageBox.alert('Comentário Editado ', 'com Sucesso');

                    function hide_message() {
                        Ext.defer(function () {
                            Ext.MessageBox.hide();

                            Ext.getCmp('gridhiscoment2').getStore().load();
                        }, 1000);
                    }

                    hide_message();
                },

                failure: function (){alert('Erro...');
                    Ext.MessageBox.alert('Comentário Editado ','Sem Sucesso');
                    function hide_message() {
                        Ext.defer(function () {
                            Ext.MessageBox.hide();

                            Ext.getCmp('gridhiscoment2').getStore().load();
                        }, 1000);
                    }
                },
                params: {Comentario: Ext.getCmp('Comentario').getValue()}
            });
    }



});
