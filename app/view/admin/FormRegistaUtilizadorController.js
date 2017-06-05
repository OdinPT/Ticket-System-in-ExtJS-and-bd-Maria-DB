Ext.define('TrackIT.view.admin.FormRegistaUtilizadorController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.registautilizador',


    onClickRegistarUtilizador: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Registar/registarutilizador.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Registado!');},

                failure: function (){alert('Erro...');},
                params: { user: Ext.getCmp('user').getValue(), pass: Ext.getCmp('pass').getValue(), id_departamento: Ext.getCmp('id_departamento').getValue(), tipo_funcionario: Ext.getCmp('tipo_funcionario').getValue()}
<<<<<<< HEAD
=======

>>>>>>> 83065482215da4116a5f11e6f801f93ef7eb5155
            });

        /*

         {
         xtype: 'textfield',
         fieldLabel: 'Username:',
         id: 'user',
         name: 'user'

         },
         {
         xtype: 'textfield',
         fieldLabel: 'Password:',
         inputType: 'password',
         id: 'pass',
         name: 'pass'

         },
         {
         xtype: 'textfield',
         fieldLabel: 'ID do Departamento:',
         id: 'id_departamento'
         },
         {
         xtype: 'textfield',
         fieldLabel: 'Tipo de funcionário:',
         id: 'tipo_funcionario'
         }



         */
    }

});