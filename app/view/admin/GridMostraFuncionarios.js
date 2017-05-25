
Ext.define('TrackIT.view.admin.GridMostraFuncionarios', {
    extend: 'Ext.grid.Panel',
    id: 'gridfuncionarios',
    xtype: 'mainlistfuncionarios',
    requires: [
        'TrackIT.store.admin.Funcionarios',
        'Ext.toolbar.Paging',
        'TrackIT.view.admin.MostraFuncionario',
        'TrackIT.store.admin.FuncionarioSeleccionado'
    ],
    config: {
        autoLoad: true,
        scroll:false,
        style:{overflow: 'auto',overflowX: 'hidden'}
    },
    layout: {
        align: 'fit',
        type: 'form'
    },
    store: {
        type: 'funcionarios'
    },

    columns: [
        { text: 'ID',  dataIndex: 'id_funcionario', flex: 0.1},
        { text: 'Username',  dataIndex: 'usernamefunc', flex: 1},
        { text: 'Nº Departamento', dataIndex: 'id_departamento_funcionarios', flex: 0.4},
        { text: 'Tipo de Funcionário', dataIndex: 'Tipo_Funcionario', flex: 0.4}
    ],

    tbar: {
        defaultButtonUI: 'default',

        items: [
            {
                text: 'Refresh!',
                handler: function() {
                    Ext.getCmp('gridfuncionarios').store.reload();
                }
            }]
    },
    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_funcionario');
            Ext.util.Cookies.set('cookieIDfuncionario', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Funcionário',
                modal: true,
                // html: '<iframe src="app/php/mostraTicket.php" width="100%" height="100%" ></iframe>',
                width: 500,
                height: 345,
                items: [{
                    xtype: 'fieldfuncionario'
                }]
            });
            myWin.show();
        }

    },




    onGridAfterRender: function(gridticket){
        setInterval(function(){
            grid.store.load();
        }, 1);
    }
});