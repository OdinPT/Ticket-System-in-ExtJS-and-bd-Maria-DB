Ext.define('TrackIT.view.main.tickets.HisDep.FormRegistaHisDepController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.TipoDepartamentoMD',


    onClickRegistardep: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/HistDep/registaHisDep.php',

                success: function (response, opts) {
                    Ext.MessageBox.alert('Sucesso', 'alteraçao Registada');
                    Ext.getCmp('gridhisdep').store.reload();
                },



                failure: function () {
                    alert('Erro...');
                },
                params: {

                    id_departamento: Ext.getCmp('id_departamento2').getValue()

                }



            })
    }

    });

