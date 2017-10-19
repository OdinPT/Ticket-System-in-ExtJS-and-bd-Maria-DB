Ext.define('TrackIT.view.admin.departamento.EditaDepartamentoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.editadepartamento',


    onClickEditaDepartamento: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/Editar/editadepartamento.php',

                success: function (response, opts) {
                    Ext.MessageBox.alert('Departamento Editado ', 'com Sucesso');

                    function hide_message() {
                        Ext.defer(function () {
                            Ext.MessageBox.hide();

                            Ext.getCmp('griddepartamentos').getStore().load();
                            Ext.getCmp('gridGT').getStore().load();
                        }, 1200);
                    }

                    hide_message();
                },

                failure: function (){alert('Erro...');
                    Ext.MessageBox.alert('Departamento Editado ','Sem Sucesso');
                },
                params: {nome_departamento2: Ext.getCmp('nome_departamento2').getValue()}
            });
    }

});