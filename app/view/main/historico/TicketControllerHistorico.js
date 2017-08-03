Ext.define('TrackIT.view.main.historico.TicketControllerHistorico', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.ticketzzz',

    onClickDeleteForever: function() {
        myRequest1 = Ext.Ajax.request({
          url: 'app/php/Apagar/HistoricoDeleteOne.php',
             method: 'POST'
            })
  Ext.MessageBox.alert('Ticket Movido',' com Sucesso');

        function hide_message() {
            Ext.defer(function () {
                Ext.MessageBox.hide();
                Ext.getCmp('grid2').getStore().load();

            }, 1500);
        }
        hide_message();

},
    onClickMoveBack: function() {
      myRequest2 = Ext.Ajax.request({
        url: 'app/php/Mover/AlterarEstado.php',
        method: 'POST'  })
        Ext.MessageBox.alert('titles','Sucesso');

        function hide_message() {
            Ext.defer(function () {
                Ext.MessageBox.hide();
                var grid = Ext.ComponentQuery.query('gridticket')[0]
                Ext.getCmp('grid2').getStore().load();
            }, 1500);
        }
        hide_message();

  grid.getStore().load();
},

    onClickApagarResposta: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagaresposta.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('Resposta apagada',' com Sucesso');

                function hide_message() {
                    Ext.defer(function () {
                        Ext.MessageBox.hide();
                        Ext.getCmp('grid5').getStore().load();
                    }, 1500);

                }
                hide_message();

            }
        })
    }


});
