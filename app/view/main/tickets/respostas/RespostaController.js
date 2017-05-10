Ext.define('TrackIT.view.main.tickets.respostas.RespostaController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostacont',

    onClickObterResposta: function() {
      var store = Ext.getStore('respostaseleccionada');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('ide').setValue(record.data.ID);
         var b =Ext.getCmp('body_resp').setValue(record.data.body_resp);
         var c = Ext.getCmp('datea_resp').setValue(record.data.datea_resp);
         var d = Ext.getCmp('id_email').setValue(record.data.id_email);
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
