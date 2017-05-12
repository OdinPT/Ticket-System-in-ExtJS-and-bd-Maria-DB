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
        { text: 'ID', dataIndex: 'id', flex: 1,
            editor: {
                allowBlank: false,
                maxLength: 49
            }},
        { text: 'DE', dataIndex: 'fromaddress', flex: 1,
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
      { text: 'DEPARTAMENTO', dataIndex: 'nome_departamento', flex: 1,
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
var grid = Ext.ComponentQuery.query('gridticket')[0];
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
    }]

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
                        width: 1100,
                        height: 550,
                        items: [{
                            xtype: 'maintabtickets'
                        }],
                        listeners: {
                            afterrender: function() {
                                    var store = Ext.getStore('ticketseleccionado2');
                                    store.load({
                                        callback: function(records, operation, success) { // carrega dados para os respétivos campos
                                            var record=store.getAt(0);
                                            var a =  Ext.getCmp('subject').setValue(record.data.subject);
                                            var b = Ext.getCmp('fromaddress').setValue(record.data.fromaddress);
                                            var c = Ext.getCmp('body').setValue(record.data.body);
                                            var d =  Ext.getCmp('id').setValue(record.data.id);
                                            var e = Ext.getCmp('datea').setValue(record.data.datea);
                                            var f = Ext.getCmp('state').setValue(record.data.state);
                                            var g = Ext.getCmp('nome_departamento').setValue(record.data.nome_departamento);
                                        }
                                    });

                                }
                            }

                    });
                    myWin.show();
 }
    }
});
