Ext.define('TrackIT.view.main.historico.respostas.RespostaControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.respostaconthistorico',

    onClickObterResposta: function() {
      var store = Ext.getStore('respostaseleccionadahistorico');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
            var a =  Ext.getCmp('id_resp').setValue(record.data.id_resp);
            var b =Ext.getCmp('body_resp').setValue(record.data.body_resp);
            var c = Ext.getCmp('datea_resp').setValue(record.data.datea_resp);
            var d = Ext.getCmp('id_email').setValue(record.data.id_email);
       }
      });
/*
$row_array['ID_resp'] = $row['ID_resp'];
$row_array['body_resp'] = $row['body_resp'];
$row_array['datea_resp'] = $row['datea_resp'];
$row_array['IdEmail'] = $row['IdEmail'];

*/
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
