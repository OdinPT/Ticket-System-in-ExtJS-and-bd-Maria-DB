/**
 * This view is an example list of people.
 */
Ext.define('TrackIT.view.main.recuperados.ListaTicketsRecuperados', {
    extend: 'Ext.grid.Panel',
    id: 'grid3',
    xtype: 'mainlistrecuperados',
    requires: [
        'TrackIT.store.recuperados.TicketsRecuperados',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.recuperados.MostraTicketRecuperado',
        'TrackIT.view.main.recuperados.TicketControllerRecuperado'
    ],

    title: 'Tickets Recuperados',

    store: {
        type: 'ticketsrecuperados'
    },

    columns: [
      {text: 'ID', xtype: 'rownumberer', flex: 1},
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
          Ext.getCmp('grid3').store.reload();
      }
    },
    {
      text: 'Limpar!',
      handler: function(){
        myRequest = Ext.Ajax.request({
          url: 'app/php/Limpar/limpaticketsrecovered.php',
          method: 'POST'
        }),
        Ext.getCmp('grid3').store.reload();
      }
    }

        ]
    },

    listeners: {
 itemclick: function(view, record, item, index, e) {
  var id = record.get('id');
  Ext.util.Cookies.set('cookieIDrecovered', id);
    Ext.util.Cookies.set('cookieParticao','recuperado');
                    var myWin = Ext.create("Ext.window.Window", {
                        title: 'Historico do ticket recuperado',
                        modal: true,
                        // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                        width: 1100,
                        height: 550,
                        items: [{
                            xtype: 'maintabssss'
                        }]
                    });
                    myWin.show();
}
    }
});
