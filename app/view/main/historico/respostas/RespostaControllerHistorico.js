Ext.define('TrackIT.view.main.historico.respostas.RespostaControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostaconthistorico',

onClickApagarResposta: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/apagaresposta.php',
    method: 'POST',
    success: function(response, opts) {
    Ext.MessageBox.alert('Resposta apagada',' com Sucesso');

        function hide_message() {
            Ext.defer(function () {
                Ext.MessageBox.hide();
                Ext.getCmp('grid5').getStore().load();
            }, 1500);

        }
        hide_message();


}
})
}

});
