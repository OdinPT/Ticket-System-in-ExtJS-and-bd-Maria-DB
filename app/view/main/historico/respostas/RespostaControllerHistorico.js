Ext.define('TrackIT.view.main.historico.respostas.RespostaControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostaconthistorico',

    onClickObterResposta: function() {
      var store = Ext.getStore('respostaseleccionadahistorico');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('ide').setValue(record.data.ID);
         var b =Ext.getCmp('subjecte').setValue(record.data.subject);
         var c = Ext.getCmp('answere').setValue(record.data.answer);
         var d = Ext.getCmp('IDtickete').setValue(record.data.IDticket);
       }
      });

},
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
