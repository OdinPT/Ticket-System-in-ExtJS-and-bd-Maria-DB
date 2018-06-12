Ext.define('TrackIT.view.main.tickets.HisDep.FormRegistaHisDepController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.TipoDepartamentoMD',


    onClickRegistardep: function() {
        method:'POST',
            myRequest1 = Ext.Ajax.request({
                url: 'app/php/HistDep/registaHisDep.php',

                success: function (response, opts) {
                    Ext.MessageBox.alert('Sucesso', 'Departamento alterado');

                    Ext.getCmp('gridhisdep').store.reload();
                    Ext.getCmp('gridGT').getStore().load();

                function hide_message() {
                        Ext.defer(function() {
                        Ext.MessageBox.hide();
                            }, 2500);
                    }
                    hide_message();

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

