Ext.define('TrackIT.view.admin.FormRegistaHisEstado', {
    extend: 'Ext.form.Panel',
    xtype: 'registahisestado',
    controller: 'registahisestado',
    requires: [
        'TrackIT.view.admin.FormRegistaHisEstadoController',

    ],
    id: 'formregistahisEstado',
    frame: false,

    height: 400,

    border: false,
    title: 'Alterar Estado ',

    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {
        layout: 'form',
        margin: 0,
        border: 'false'
    },
/*
 horaatribuicao: Ext.getCmp('horaatribuicao').getValue(),
 IdTicketEstado: Ext.getCmp('IdTicketEstado').getValue(),
 IDEstadoEstado: Ext.getCmp('IDEstadoEstado').getValue(),
 DataAlteracaoEstado: Ext.getCmp('DataAlteracaoEstado').getValue(),
 IDNovoEstado: Ext.getCmp('IDNovoEstado').getValue(),
 IDFuncEstado: Ext.getCmp('$IDFuncEstado').getValue()

 */

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'Hora atribuicao:',
            id: 'horaatribuicao',
            name: 'horaatribuicao'

        },

        {
            xtype: 'textfield',
            fieldLabel: 'id  estado :',
            id: 'IDEstadoEstado',
            name: 'IDEstadoEstado'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Data Alteração :',
            id: 'DataAlteracaoEstado',
            name: 'DataAlteracaoEstado'

        },
        {
            xtype: 'textfield',
            fieldLabel: 'Novo estado :',
            id: 'IDNovoEstado',
            name: 'IDNovoEstado'

        },

    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Registar',
                glyph: 43,
                formBind: true,
                listeners: {
                    click: 'onClickRegistarEstado'
                }

            }
        ]
    }
});