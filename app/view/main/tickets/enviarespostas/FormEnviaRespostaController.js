Ext.define('TrackIT.view.main.tickets.enviarespostas.FormEnviaRespostaController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.enviarespostacontroller',

    onClickEnviaResposta: function() {
        method:"POST",
        myRequest1 = Ext.Ajax.request({
            url: 'app/view/main/tickets/enviarespostas/EnviaMail/mandarmail.php',
            success: function (response, opts){Ext.MessageBox.alert('Sucesso','Enviado!');},
            failure: function (){alert('Erro...');},
            params: { assuntoresposta: Ext.getCmp('assuntoresposta').getValue(), conteudoresposta: Ext.getCmp('conteudoresposta').getValue()}
        });

    }

});
