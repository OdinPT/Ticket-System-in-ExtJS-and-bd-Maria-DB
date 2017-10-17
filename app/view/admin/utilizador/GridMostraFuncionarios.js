
Ext.define('TrackIT.view.admin.utilizador.GridMostraFuncionarios', {
    extend: 'Ext.grid.Panel',
    id: 'gridfuncionarios',
    xtype: 'mainlistfuncionarios',
    requires: [
        'TrackIT.store.admin.Funcionarios',
        'Ext.toolbar.Paging',
        'TrackIT.view.admin.utilizador.MostraFuncionario',
        'TrackIT.store.admin.FuncionarioSeleccionado'
    ],
    config: {
        autoLoad: true,
        scroll:true,
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
        { text: 'ID',  dataIndex: 'id_funcionario', flex: 0.1, hidden:true},
        { text: 'Username',  dataIndex: 'usernamefunc', flex: 1.4},
        { text: 'Departamento', dataIndex: 'nome_departamento', flex: 0.8},
        { text: 'Tipo de Funcionário', dataIndex: 'Descricao_TipoUtilizador', flex: 1.3},
        { text: 'Login ?', dataIndex: 'Des_acesso', flex: 0.6}
    ],

    listeners: {
        itemclick: function(view, record, item, index, e) {
            var id = record.get('id_funcionario');
            Ext.util.Cookies.set('cookieIDfuncionario', id);
            var myWin = Ext.create("Ext.window.Window", {
                title: 'Funcionário',
                modal: true,
                width: 500,
                height: 250,
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