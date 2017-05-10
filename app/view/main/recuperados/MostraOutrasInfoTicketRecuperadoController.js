Ext.define('TrackIT.view.main.recuperados.MostraOutrasInfoTicketRecuperadoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.outrainfoticketrecuperado',

    onClickObterOutrasInfoTicketRecuperado: function() {
      var store = Ext.getStore('ticketrecuperadoseleccionado1');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('id').setValue(record.data.id);
         var b = Ext.getCmp('datea').setValue(record.data.datea);
         var c = Ext.getCmp('state').setValue(record.data.state);
         var d = Ext.getCmp('nome_departamento').setValue(record.data.nome_departamento);
       }
      });

},

onClickLimpaOutrasInfoTicketRecuperado: function()
{
  var aa =  Ext.getCmp('id').setValue("");
  var bb = Ext.getCmp('datea').setValue("");
  var cc = Ext.getCmp('state').setValue("");
  var dd = Ext.getCmp('nome_departamento').setValue("");
}

});
