Ext.define('TrackIT.view.tickets.HisComent.FormRegistaComent', {
    extend: 'Ext.form.Panel',
    extend:'Ext.panel.Panel',
    xtype: 'registacoment',
    id: 'formregistacoment',
    controller: 'regisctacoment',
    frame: false,

    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {

        layout: 'form',
        margin: 20,
        border: 'true'
    },

    items: [

        {
            xtype: 'textfield',
            fieldLabel: 'Comentário:',
            id: 'comentario',
            allowBlank: false,
            blankText: 'Insira um assunto'
        }



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

                    click: 'onClickRegistaComent'
                }

            }
        ]
    }
});