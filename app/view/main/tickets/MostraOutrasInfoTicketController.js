Ext.define('TrackIT.view.main.tickets.MostraOutrasInfoTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.outrainfoticket',

    onClickObterOutrasInfoTicket: function() {
      var store = Ext.getStore('ticketseleccionado1');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var d = Ext.getCmp('nome_departamento').setValue(record.data.nome_departamento);
       }
      });

},

onClickLimpaOutrasInfoTicket: function()
{
  var aa =  Ext.getCmp('id').setValue("");
  var bb = Ext.getCmp('datea').setValue("");
  var cc = Ext.getCmp('state').setValue("");
  var dd = Ext.getCmp('nome_departamento').setValue("");
}

});
