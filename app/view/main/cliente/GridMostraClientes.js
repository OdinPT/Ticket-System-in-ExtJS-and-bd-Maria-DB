
Ext.define('TrackIT.view.main.cliente.GridMostraClientes', {
    extend: 'Ext.grid.Panel',
    id: 'gridCliente',
    xtype: 'mainlistclientes',
    requires: [
        'TrackIT.store.cliente.Clientes',
        'Ext.toolbar.Paging',
        'TrackIT.view.main.cliente.MostraCliente',
        'TrackIT.store.cliente.ClienteSeleccionado'
    ],
    config: {
        autoLoad: true,
        scroll:false,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'clientes'
    },

    columns: [
        { text: 'ID',  dataIndex: 'Id_Cliente', flex: 0.1},
        { text: 'Username',  dataIndex: 'Nome_Cliente', flex: 0.5},
        { text: 'E-mail', dataIndex: 'Email_Cliente', flex: 0.4},
        { text: 'DN', dataIndex: 'DataNasc_Cliente', flex: 0.4},
        { text: 'Contribuinte', dataIndex: 'Contribuinte_Cliente', flex: 0.3}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('gridCliente').store.reload();
                }
            }]
    },
    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('Id_Cliente');
            Ext.util.Cookies.set('cookieIDCliente', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Cliente',
                modal: true,
                // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                width: 500,
                height: 505,
                items: [{
                    xtype: 'fieldCliente'
                }]
            });
            myWin.show();
        }

    },




    onGridAfterRender: function(gridticket){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});