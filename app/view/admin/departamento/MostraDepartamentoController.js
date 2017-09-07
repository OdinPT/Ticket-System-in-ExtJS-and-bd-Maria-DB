Ext.define('TrackIT.view.admin.departamento.MostraDepartamentoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.departamentocont',

    onClickApagarDepartamento: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagardepartamento.php',
            method: 'POST',
            success: function(response, opts) {

                Ext.MessageBox.alert('Departamento Apagado',' com Sucesso');

                function hide_message() {
                    Ext.defer(function () {
                        Ext.MessageBox.hide();
                        Ext.getCmp('griddepartamentos').getStore().load();
                    }, 1200);
                }
                hide_message();

            },

            failure: function (){alert('Erro...');},
            params: {id_departamento3: Ext.getCmp('id_departamento3').getValue()}
        })
    },

    //onClickMostraFuncDep
    onClickMostraFuncDep: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Funcionários do  Departamento',
            modal: true,
            width: 750,
            height: 300,
            items: [{
                xtype: 'mainlistfuncdepartamentos'
            }]
        });
        myWin2.show();
    },

    onClickEditaDepartamento: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Departamento',
            modal: true,

            width: 660,
            height: 140,
            items: [{
                xtype: 'editadepartamento'
            }]
        });
        myWin2.show();
    }

});