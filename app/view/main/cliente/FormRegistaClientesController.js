Ext.define('TrackIT.view.main.cliente.FormRegistaClientesController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registaCliente',


    onClickRegistarClientes: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/CarregamStores/registarClientes.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Registado!');},
                failure: function (){alert('Erro...');},
                params: { Nome_Cliente: Ext.getCmp('Nome_Cliente').getValue(), Email_Cliente: Ext.getCmp('Email_Cliente').getValue(), DataNasc_Cliente: Ext.getCmp('DataNasc_Cliente').getValue(), Contribuinte_Cliente: Ext.getCmp('Contribuinte_Cliente').getValue()}
            });

    }

});

