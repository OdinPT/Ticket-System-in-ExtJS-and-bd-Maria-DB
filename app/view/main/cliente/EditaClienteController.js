Ext.define('TrackIT.view.main.cliente.EditaClienteController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.editacliente',


    onClickEditaclientes: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editacliente.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Editado!');},
                failure: function (){alert('Erro...');},
                params: { Nome_Cliente: Ext.getCmp('Nome_Cliente2').getValue(), Email_Cliente: Ext.getCmp('Email_Cliente2').getValue(),DataNasc_Cliente: Ext.getCmp('DataNasc_Cliente2').getValue(),Contribuinte_Cliente: Ext.getCmp('Contribuinte_Cliente2').getValue()}
            });


    }

});