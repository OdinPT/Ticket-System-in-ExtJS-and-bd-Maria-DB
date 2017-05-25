Ext.define('TrackIT.view.main.cliente.FormRegistaClientesController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registaCliente',


    onClickRegistarClientes: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/CarregamStores/registarClientes.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Registado!');},
                failure: function (){alert('Erro...');},
                params: { user4: Ext.getCmp('user').getValue(), email3: Ext.getCmp('email').getValue()/*, DataNasc: Ext.getCmp('DataNasc').getValue(), contribuinte: Ext.getCmp('contribuinte').getValue()*/}
            });

    }
/*

 {
 xtype: 'textfield',
 fieldLabel: 'Username:',
 id: 'user',
 name: 'user'

 },
 {
 xtype: 'textfield',
 fieldLabel: 'email:',
 //inputType: 'email',
 id: 'email',
 name: 'email'

 },
 {
 xtype: 'textfield',
 fieldLabel: 'Data de Nascimento',
 id: 'DataNasc'
 },
 {
 xtype: 'textfield',
 fieldLabel: 'Contruibuinte:',
 id: 'contribuinte'
 }



 */
});

