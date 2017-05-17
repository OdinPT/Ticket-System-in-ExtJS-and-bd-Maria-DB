Ext.define('TrackIT.view.main.historico.MostraInfoHistoricoTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infotickethistorico',

    onClickObterInfoHistorico: function() {
      var store = Ext.getStore('tickethistoricoseleccionado');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
            var a =  Ext.getCmp('idd').setValue(record.data.id);
            var b = Ext.getCmp('dateaaa').setValue(record.data.datea);
            var c = Ext.getCmp('stateee').setValue(record.data.state);
            var d = Ext.getCmp('departmenttt').setValue(record.data.nome_departamento);
            var e =  Ext.getCmp('subjectt').setValue(record.data.subject);
            var f = Ext.getCmp('bodyy').setValue(record.data.body);

       }
      });

},

onClickApagaTicketDoHistorico: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/HistoricoDeleteOne.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('title','Sucesso');
  var grid = Ext.ComponentQuery.query('gridticket')[0]
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
},

onClickMoveParaRecuperados: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Mover/AlterarEstado.php',
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
