Ext.define('TrackIT.view.main.historico.TicketControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.ticketzzz',

    onClickDeleteForever: function() {
        myRequest1 = Ext.Ajax.request({
          url: 'app/php/Apagar/HistoricoDeleteOne.php',
    method: 'POST'
  })
  Ext.MessageBox.alert('Ticket Movido',' com Sucesso');
  Ext.getCmp('grid2').getStore().load();
  Ext.getCmp('grid2').getStore().load();
},

    onClickMoveBack: function() {
      myRequest2 = Ext.Ajax.request({
        url: 'app/php/Mover/AlterarEstado.php',
  method: 'POST'
  })
  Ext.MessageBox.alert('titles','Sucesso');
  var grid = Ext.ComponentQuery.query('gridticket')[0]
  grid.getStore().load();
  Ext.getCmp('grid2').getStore().load();
}


});
