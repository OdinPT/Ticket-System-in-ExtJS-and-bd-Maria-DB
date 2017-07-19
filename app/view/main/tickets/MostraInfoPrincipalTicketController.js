Ext.define('TrackIT.view.main.tickets.MostraInfoPrincipalTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.infoticketprincipal',


onClickMoveParaHistorico: function()
{
  myRequest1 = Ext.Ajax.request({
    url: 'app/php/Apagar/delete.php',
    method: 'POST',
        success: function(response, opts) {

        Ext.MessageBox.alert('Ticket Movido ',' com Sucesso');

            function hide_message() {
                Ext.defer(function() {
                    Ext.MessageBox.hide();

                    var grid = Ext.ComponentQuery.query('gridticket')[0]
                    grid.getStore().load();
                    Ext.getCmp('grid2').getStore().load();
                    Ext.getCmp('gridhisdep').getStore().load();
                }, 1200);
            }
            hide_message();
    }
})
}

});
