Ext.define('TrackIT.view.main.cliente.MostraClienteController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.Clientecont',

    onClickObterCliente: function() {
        var store = Ext.getStore('clienteseleccionado');
        store.load({
            callback: function (records, operation, success) {
                var record = store.getAt(0);
                var a = Ext.getCmp('Id_Clientee').setValue(record.data.Id_Cliente);
                var b = Ext.getCmp('Nome_Clientee').setValue(record.data.Nome_Cliente);
                var c = Ext.getCmp('Email_Clientee').setValue(record.data.Email_Cliente);
                var d = Ext.getCmp('DataNasc_Clientee').setValue(record.data.DataNasc_Cliente);
                var e = Ext.getCmp('Contribuinte_Clientee').setValue(record.data.Contribuinte_Cliente);
            }
        });

    },


    onClickApagarCliente: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagarcliente.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('title','Sucesso');
                Ext.getCmp('gridCliente').getStore().load();
            }
        })
    },
    onClickEditacliente: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'cliente',
            modal: true,

            width: 500,
            height: 345,
            items: [{
                xtype: 'editacliente'
            }]
        });
        myWin2.show();
    }

});