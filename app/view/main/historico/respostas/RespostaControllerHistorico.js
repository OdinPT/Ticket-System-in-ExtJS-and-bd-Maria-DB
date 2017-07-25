Ext.define('TrackIT.view.main.historico.respostas.RespostaControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostaconthistorico',

onClickApagarResposta: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/apagaresposta.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('title','Sucesso');
  Ext.getCmp('grid4').getStore().load();
}
})
}

});
