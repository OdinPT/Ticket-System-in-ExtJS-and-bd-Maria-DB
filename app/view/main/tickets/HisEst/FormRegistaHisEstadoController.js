Ext.define('TrackIT.view.admin.FormRegistaHisEstadoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registahisestado',


    onClickRegistarEstado: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/HistEstado/registaHisEstado.php',

                success: function (response, opts) {
                    Ext.MessageBox.alert('Sucesso', 'Estado Registado!');
                    Ext.getCmp('gridhisest2').store.reload();

                    function hide_message() {
                        Ext.defer(function() {
                            Ext.MessageBox.hide();
                        }, 1300);
                    }
                    hide_message();
                },



                failure: function () {
                    alert('Erro...');
                },
                params: {

                    IdTipoRes: Ext.getCmp('IdTipoRes').getValue()

                }



            })
    }

    });

