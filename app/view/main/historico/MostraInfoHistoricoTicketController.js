Ext.define('TrackIT.view.main.historico.MostraInfoHistoricoTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infotickethistorico',

onClickApagaTicketDoHistorico: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/HistoricoDeleteOne.php',
    method: 'POST',
    success: function(response, opts) {
      Ext.MessageBox.alert('Ticket Apagado','Com Sucesso');
      var grid = Ext.ComponentQuery.query('gridticket')[0]
      grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
},

onClickMoveParaTickets: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Mover/AlterarEstado.php',
method: 'POST',
success: function(response, opts) {
  Ext.MessageBox.alert('Ticket Movido','Com Sucesso');
  var grid = Ext.ComponentQuery.query('gridticket')[0]
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}
})
}
});
