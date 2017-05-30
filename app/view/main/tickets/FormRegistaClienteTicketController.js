Ext.define('TrackIT.view.main.tickets.FormRegistaClienteTicketController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registaClienteTicket',


    onClickRegistarClienteTicket: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarClientesTicket.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Registado!');},
                failure: function (){alert('Erro...');},
                params: { Nome_Cliente: Ext.getCmp('Nome_Clientet').getValue(), Email_Cliente: Ext.getCmp('Email_Clientet').getValue(), DataNasc_Cliente: Ext.getCmp('DataNasc_Clientet').getValue(), Contribuinte_Cliente: Ext.getCmp('Contribuinte_Clientet').getValue()}
            });

    }

});

