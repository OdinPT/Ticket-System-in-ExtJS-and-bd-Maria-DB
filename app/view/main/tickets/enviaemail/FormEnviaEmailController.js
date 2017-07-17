Ext.define('TrackIT.view.main.tickets.enviaemail.FormEnviaEmailController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.enviaemailcontroller',

    onClickEnviaResposta: function() {
        method:"POST",
            form_action = 1;

        Ext.getCmp('fileuploadform').getForm().submit();
            myRequest1 = Ext.Ajax.request({
                url: 'app/view/main/tickets/enviarespostas/EnviaMail/mandarmail.php',

                success: function (response, opts) {

                    Ext.MessageBox.alert('Sucesso', 'Enviado!');

                    function hide_message() {
                        Ext.defer(function() {
                            Ext.MessageBox.hide();
                            //Ext.getCmp('gridticket').getStore().load();
                        }, 1200);
                    }
                    hide_message();
                //},
                },
                failure: function () {
                    alert('Erro...');
                },
                params: {
                    assuntoresposta: Ext.getCmp('assuntoresposta').getValue(),
                    conteudoresposta: Ext.getCmp('conteudoresposta').getValue()
                }
            });

    }

});
