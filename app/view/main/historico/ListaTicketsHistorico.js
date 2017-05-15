Ext.define('TrackIT.view.main.historico.ListaTicketsHistorico', {
    extend: 'Ext.grid.Panel',
    id: 'grid2',
    xtype: 'mainlisthistorico',
    requires: [
        'TrackIT.store.TicketsHistorico',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.historico.MostraTicketHistorico',
        'TrackIT.view.main.historico.TicketControllerHistorico'
    ],

    title: 'Tickets Historico',

    store: {
        type: 'ticketshistorico'
    },

    columns: [
      {text: 'ID', dataIndex: 'id', flex: 1},
      { text: 'DE',  dataIndex: 'fromaddress', flex:  1 },
      { text: 'ASSUNTO', dataIndex: 'subject', flex: 1 },
      { text: 'DATA', dataIndex: 'datea', flex: 1 },
      { text: 'CORPO', dataIndex: 'body', flex: 1 },
      { text: 'ESTADO', dataIndex: 'state', flex: 1 },
      { text: 'DEPARTAMENTO', dataIndex: 'nome_departamento', flex: 1 }
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
              text: 'Refresh!',
              handler: function() {
                Ext.MessageBox.wait('A carregar tickets...');
          myRequest = Ext.Ajax.request({
            url: 'app/php/CarregamStores/carregaticketshistorico.php',
      method: 'POST',
      success: function(response, opts) {
        Ext.MessageBox.updateProgress(1);
Ext.MessageBox.hide();
      Ext.getCmp('grid2').store.reload();
    }
    })
}
    },
    {
      text: 'Limpar!',
      handler: function(){
        myRequest = Ext.Ajax.request({
          url: 'app/php/Limpar/limpaticketshistorico.php',
          method: 'POST'
        }),
        Ext.getCmp('grid2').store.reload();
      }
    }
        ]
    },

    listeners: {
 itemclick: function(view, record, item, index, e) {
  var id = record.get('id');
  Ext.util.Cookies.set('cookieIDhistorico', id);
    Ext.util.Cookies.set('cookieParticao','historico');
                    var myWin = Ext.create("Ext.window.Window", {
                            title: 'Historico do Ticket',
                            modal: true,
                            width: 1100,
                            height: 550,
                            items: [{
                                xtype: 'maintabsss'
                            }], // add funcion ther
                            listeners: {
                                afterrender: function () {
                                    var store = Ext.getStore('tickethistoricoseleccionado');
                                    store.load({
                                        callback: function (records, operation, success) {
                                            var record = store.getAt(0);
                                            var c =  Ext.getCmp('idee').setValue(record.data.id);
                                            var a = Ext.getCmp('subjectee').setValue(record.data.subject);
                                            var b = Ext.getCmp('bodyyy').setValue(record.data.body);
                                            var d = Ext.getCmp('dateaaa').setValue(record.data.datea);
                                            var e = Ext.getCmp('stateee').setValue(record.data.state);
                                            var d = Ext.getCmp('departmenttt').setValue(record.data.nome_departamento);
                                        }
                                    });

                                }
                            }
                        });
     myWin.show();

}
    }
});
