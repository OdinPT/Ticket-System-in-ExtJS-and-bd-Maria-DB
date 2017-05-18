Ext.define('TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta', {
    extend: 'Ext.form.Panel',
    xtype: 'enviaresposta',
    controller: 'enviarespostacontroller',
    requires: [
        'TrackIT.view.main.tickets.enviarespostas.FormEnviaRespostaController'
    ],
    id: 'formenviaresposta',
    frame: true,
    title: 'Formulário de envio de respostas',
    width: 1080,
    height: 400,
    bodyPadding: 10,
    layout: {
        type: 'form',
        align: 'stretch'
    },
    defaults: {
        layout: 'form',
        margin: 20
    },

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'Assunto:',
            id: 'assuntoresposta'
        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Conteúdo:',
            id: 'conteudoresposta'
        }
    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Enviar',
                glyph: 43,
                listeners: {
                    click: 'onClickEnviaResposta'
                }
            }
        ]
    }
});