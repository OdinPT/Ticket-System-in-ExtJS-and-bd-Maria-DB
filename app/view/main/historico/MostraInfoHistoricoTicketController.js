Ext.define('TrackIT.view.main.historico.MostraInfoHistoricoTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infotickethistorico',

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
