Ext.define('TrackIT.view.admin.departamento.MostraDepartamentoController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.departamentocont',

    onClickApagarDepartamento: function()
    {
        myRequest1 = Ext.Ajax.request({
            url: 'app/php/Apagar/apagardepartamento.php',
            method: 'POST',
            success: function(response, opts) {
                Ext.MessageBox.alert('title','Sucesso');
                Ext.getCmp('griddepartamentos').getStore().load();
            },

            failure: function (){alert('Erro...');},
            params: {id_departamento3: Ext.getCmp('id_departamento3').getValue()}
        })
    },
    onClickEditaDepartamento: function()
    {
        var myWin2 = Ext.create("Ext.window.Window", {
            title: 'Departamento',
            modal: true,
            // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
            width: 500,
            height: 345,
            items: [{
                xtype: 'editadepartamento'
            }]
        });
        myWin2.show();
    }

});