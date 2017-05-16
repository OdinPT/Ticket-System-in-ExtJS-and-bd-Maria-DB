Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infoticketprincipal',

    onClickObterInfoPrincipalTicket: function() {
      var store = Ext.getStore('ticketseleccionado2');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('idd').setValue(record.data.id);
         var b =  Ext.getCmp('subjectt').setValue(record.data.subject);
         var c = Ext.getCmp('bodyy').setValue(record.data.body);
         var d = Ext.getCmp('dateaa').setValue(record.data.datea);
         var e = Ext.getCmp('statee').setValue(record.data.state);
         var f = Ext.getCmp('nome_departamentoo').setValue(record.data.nome_departamento);
       }
      });

},

onClickMoveParaHistorico: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/delete.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('title','Sucesso');
  var grid = Ext.ComponentQuery.query('gridticket')[0]
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
}

});
