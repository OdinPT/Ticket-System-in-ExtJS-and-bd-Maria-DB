/**
 * This view is an example list of people.
 */
Ext.define('TrackIT.view.main.tickets.ListaTickets', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.gridticket',
    xtype: 'mainlisttickets',
    height: 600,
    requires: [
        'TrackIT.store.tickets.Tickets',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.tickets.MostraTicket',
        'TrackIT.store.tickets.TicketSelected'
    ],

    title: 'Tickets',

    store: {
        type: 'tickets'
    },

    columns: [
      {text: 'ID', xtype: 'rownumberer', flex: 1},
      { text: 'DE',  dataIndex: 'fromaddress', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'ASSUNTO', dataIndex: 'subject', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'DATA', dataIndex: 'datea', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'CORPO', dataIndex: 'body', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'ESTADO', dataIndex: 'state', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }},
      { text: 'DEPARTAMENTO', dataIndex: 'department', flex: 1,
    editor: {
        allowBlank: false,
        maxLength: 49
    }}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
              text: 'Refresh!',
              handler: function() {
                Ext.MessageBox.wait('A carregar tickets...');
          myRequest = Ext.Ajax.request({
            url: 'app/php/filterimap.php',
      method: 'POST',
      success: function(response, opts) {
        Ext.MessageBox.updateProgress(1);
Ext.MessageBox.hide();
var grid = Ext.ComponentQuery.query('gridticket')[0]
grid.getStore().load();
    }
    })
}
    },
    {
      text: 'Limpar!',
      renderTo: Ext.getBody(),
    handler: function() {
      var grid = Ext.ComponentQuery.query('gridticket')[0];
      grid.getStore().removeAll();
    }
    }

//     {
//       text: 'Reload Store',
//       handler: function(){
//             document.location.href = "app/php/example.php";
//         }
// }

        ]
    },

    listeners: {
 itemclick: function(view, record, item, index, e) {
  var id = record.get('id');
  Ext.util.Cookies.set('cookieID', id);
  var ide = index+1;
  Ext.util.Cookies.set('cookieIDe', ide);
  Ext.util.Cookies.set('cookieParticao','ticket');
                    var myWin = Ext.create("Ext.window.Window", {
                        title: 'Tickets',
                        modal: true,
                        // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                        width: 1100,
                        height: 550,
                        items: [{
                            xtype: 'maintabtickets'
                        }]
                    });
                    myWin.show();
  // console.log(record);
 }
    },
    onGridAfterRender: function(gridticket){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
