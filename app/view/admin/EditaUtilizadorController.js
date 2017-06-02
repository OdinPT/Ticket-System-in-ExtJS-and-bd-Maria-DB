Ext.define('TrackIT.view.admin.EditaUtilizadorController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.editautilizador',


    onClickEditaUtilizador: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editautilizador.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Utilizador Editado!');},
                failure: function (){alert('Erro...');},
                params: { user: Ext.getCmp('user2').getValue(), pass: Ext.getCmp('password2').getValue(), id_departamento: Ext.getCmp('id_departamento2').getValue(), tipo_funcionario: Ext.getCmp('tipo_funcionario2').getValue()}
            });

        /*


        */
    }

});