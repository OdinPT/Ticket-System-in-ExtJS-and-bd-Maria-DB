Ext.Loader.setPath('Ext.ux', '../ux/');

Ext.define('TrackIT.view.main.cliente.ListaClientes', {
    extend: 'Ext.grid.Panel',
    alias: 'widget.gridCliente',
    xtype: 'mainlistCliente',

    height: 600,
    requires: [
        'TrackIT.store.cliente.Clientes',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.cliente.ListaClientes'
        //'TrackIT.store.tickets.TicketSelected'
    ],
    config: {
        autoLoad: true,
        scroll:true,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    title: 'Clientes',

    store: {
        type: 'clientes'
    },

    columns: [
      {text: 'ID Cliente',  dataIndex: 'Id_Cliente', flex: 0.5},
      { text: 'Nome Cliente',  dataIndex: 'Nome_Cliente', flex: 1.2},
      { text: 'Email Cliente', dataIndex: 'Email_Cliente', flex: 1.5},
      { text: 'DATA ANscimento', dataIndex: 'DataNasc_Cliente', flex: 1.5},
      { text: 'Contribuinte', dataIndex: 'Contribuinte_Cliente', flex: 5}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {

                text: 'Refresh!',
                handler: function() {
                    Ext.MessageBox.wait('A carregar tickets...');
                    myRequest = Ext.Ajax.request({
                        url: 'app/php/CarregamStores/loadClientes.php',
                        method: 'POST',
                        success: function(response, opts) {
                            Ext.MessageBox.updateProgress(1);
                            Ext.MessageBox.hide();
                            var grid = Ext.ComponentQuery.query('gridCliente')[0]
                            grid.getStore().load();
                        }
                    })
                }

            }]
    },

    onGridAfterRender: function(gridCliente){
       setInterval(function(){
          grid.store.load();
       }, 1);
   }
});
