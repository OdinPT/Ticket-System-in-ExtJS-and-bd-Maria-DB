Ext.define('TrackIT.view.main.recuperados.MostraInfoPrincipalTicketRecuperadoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infoticketrecuperadoprincipal',

    onClickObterInfoPrincipalTicketRecuperado: function() {
      var store = Ext.getStore('ticketrecuperadoseleccionado2');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('subject').setValue(record.data.subject);
         var b = Ext.getCmp('body').setValue(record.data.body);
       }
      });

},

onClickApagaRecuperado: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/deleterecuperado.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('title','Sucesso');
  var grid = Ext.ComponentQuery.query('grid3')[0]
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
},

onClickMoveParaHistoricoRecuperado: function()
{
  myRequest2 = Ext.Ajax.request({
    url: 'app/php/Mover/MoveDeRecuperadosParaHistorico.php',
    method: 'POST',
    success: function(response, opts){
      Ext.MessageBox.alert('title','Sucesso');
      var grid = Ext.ComponentQuery.query('grid3')[0]
      grid.getStore().load();
      Ext.getCmp('grid2').getStore().load();
    }
  })
}

});
