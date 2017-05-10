Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infoticketprincipal',
  

  // ir a procura de quando a janela e aberta ele carrega esta funçção.
    onClickObterInfoPrincipalTicket: function() {
      var store = Ext.getStore('ticketseleccionado2');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('subject').setValue(record.data.subject);
         var b = Ext.getCmp('body').setValue(record.data.body);
       }
      });

},
//onClickObterInfoPrincipalTicket
onClickMoveParaHistorico: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/delete.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('title','Sucesso');
  var grid = Ext.ComponentQuery.query('gridticket')[0];
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
}

});
