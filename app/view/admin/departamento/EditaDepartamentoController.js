Ext.define('TrackIT.view.admin.departamento.EditaDepartamentoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.editadepartamento',


    onClickEditaDepartamento: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editadepartamento.php',
                success: function (response, opts){Ext.MessageBox.alert('Sucesso','Departamento Editado!');Ext.getCmp('griddepartamentos').getStore().load();},
                failure: function (){alert('Erro...');},
                params: { id_departamento2: Ext.getCmp('id_departamento2').getValue(), nome_departamento2: Ext.getCmp('nome_departamento2').getValue()}
            });
    }

});