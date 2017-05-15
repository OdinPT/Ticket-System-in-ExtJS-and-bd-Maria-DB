Ext.define('TrackIT.view.main.tickets.MostraOutrasInfoTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.outrainfoticket',

    onClickObterOutrasInfoTicket: function() {
      var store = Ext.getStore('ticketseleccionado1');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('id').setValue(record.data.id);
         var b = Ext.getCmp('datea').setValue(record.data.datea);
         var c = Ext.getCmp('state').setValue(record.data.state);
         var d = Ext.getCmp('department').setValue(record.data.department);
       }
      });

},

onClickLimpaOutrasInfoTicket: function()
{
  var aa =  Ext.getCmp('id').setValue("");
  var bb = Ext.getCmp('datea').setValue("");
  var cc = Ext.getCmp('state').setValue("");
  var dd = Ext.getCmp('department').setValue("");
}

});
