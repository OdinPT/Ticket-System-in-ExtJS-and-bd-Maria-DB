Ext.define('TrackIT.view.main.recuperados.TicketControllerRecuperado', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.ticketzzzz',

    onClickDeleteForever: function() {
        myRequest1 = Ext.Ajax.request({
          url: 'app/php/ApagaUmRecuperado.php',
    method: 'POST'
  })
  Ext.MessageBox.alert('title','Sucesso');
  Ext.getCmp('grid3').getStore().load();
  Ext.getCmp('grid3').getStore().load();
}

});
