Ext.define('TrackIT.view.main.historico.MostraOutraInfoHistoricoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.outrainfohistorico',

   onClickObterOutrasInfoHistorico: function() {
      var store = Ext.getStore('historicoseleccionado1');
      store.load({
        callback: function(records, operation, success) {
         var record=store.getAt(0);
         var a =  Ext.getCmp('idee').setValue(record.data.id);
         var b = Ext.getCmp('dateaaa').setValue(record.data.datea);
         var c = Ext.getCmp('stateee').setValue(record.data.state);
         var d = Ext.getCmp('departmenttt').setValue(record.data.nome_departamento);
       }
      });

},

onClickLimpaOutrasInfoHistorico: function()
{
  var aa =  Ext.getCmp('idee').setValue("");
  var bb = Ext.getCmp('dateaaa').setValue("");
  var cc = Ext.getCmp('stateee').setValue("");
  var dd = Ext.getCmp('departmenttt').setValue("");
}

});
