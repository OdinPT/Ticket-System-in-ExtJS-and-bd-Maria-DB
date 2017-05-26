Ext.define('TrackIT.view.main.cliente.MostraClienteController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.funcionariocont',

    onClickObterCliente: function() {
        var store = Ext.getStore('clienteseleccionado');
        store.load({
            callback: function(records, operation, success) {
                var record=store.getAt(0);
                var a = Ext.getCmp('Id_Cliente').setValue(record.data.Id_Cliente);
                var b = Ext.getCmp('Nome_Cliente').setValue(record.data.Nome_Cliente);
                var c = Ext.getCmp('Email_Cliente').setValue(record.data.Email_Cliente);

                var d = Ext.getCmp('Tipo_Funcionario').setValue(record.data.Tipo_Funcionario);

            }
        });

    },


    onClickApagarFuncionario: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagarfuncionario.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('title','Sucesso');
                Ext.getCmp('gridfuncionarios').getStore().load();
            }
        })
    },
    onClickEditaFuncionario: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Funcionário',
            modal: true,
            // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
            width: 500,
            height: 345,
            items: [{
                xtype: 'editautilizador'
            }]
        });
        myWin2.show();
    }

});