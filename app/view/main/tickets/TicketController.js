Ext.define('TrackIT.view.main.tickets.TicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.ticketzz',

    onClickMoveToHistorico: function() {
        // Ext.Msg.alert('Status', 'Changes saved successfully.');
        // interval: 60000,
        // window.location.assign('/testetrackit/app/php/delete.php');
        myRequest1 = Ext.Ajax.request({
          url: 'app/php/Apagar/delete.php',
    method: 'POST'
  })
  Ext.MessageBox.alert('title','Sucesso');
  Ext.getCmp('grid1').getStore().load();
  Ext.getCmp('grid2').getStore().load();

}

});
