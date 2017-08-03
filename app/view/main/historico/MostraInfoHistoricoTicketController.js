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

        function hide_message() {
            Ext.defer(function () {
                Ext.MessageBox.hide();
                Ext.getCmp('grid2').getStore().load();
            }, 1500);

        }
        hide_message();

        var grid = Ext.ComponentQuery.query('gridticket')[0]
      grid.getStore().load();

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

      function hide_message() {
          Ext.defer(function() {
              Ext.MessageBox.hide();
              var grid = Ext.ComponentQuery.query('gridticket')[0]
              grid.getStore().load();

              Ext.getCmp('grid2').getStore().load();
          }, 1200);
      }
      hide_message();

    }
  })
}

});
