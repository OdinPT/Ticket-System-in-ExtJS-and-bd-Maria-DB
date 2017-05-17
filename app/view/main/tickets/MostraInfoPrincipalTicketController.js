Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infoticketprincipal',


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
