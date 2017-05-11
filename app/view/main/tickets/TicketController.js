Ext.define('TrackIT.view.main.tickets.TicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.ticketzz',

    onClickMoveToHistorico: function() {
        myRequest1 = Ext.Ajax.request({
          url: 'app/php/Apagar/delete.php',
    method: 'POST'
  }),
  Ext.MessageBox.alert('title','Sucesso');
  Ext.getCmp('grid1').getStore().load();
  Ext.getCmp('grid2').getStore().load();

}

});
