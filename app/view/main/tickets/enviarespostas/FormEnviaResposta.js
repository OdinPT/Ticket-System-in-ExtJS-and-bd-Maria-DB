Ext.define('TrackIT.view.main.tickets.EnviaRespostas.FormEnviaResposta', {
    extend: 'Ext.form.Panel',
    xtype: 'enviaresposta',
    controller: 'enviarespostacontroller',
    requires: [
        'TrackIT.view.main.tickets.enviarespostas.FormEnviaRespostaController'
    ],
    id: 'formenviaresposta',
    frame: false,
    width: 700,
    height: 220,
    border: false,


    layout: {
        type: 'form',
        align: 'fit'
    },
    defaults: {
        layout: 'form',
        margin: 0,
        border: 'false'
    },

    items: [
        {
            xtype: 'textfield',
            fieldLabel: 'Assunto:',
            id: 'assuntoresposta',
            allowBlank: false,
            blankText: 'Insira um assunto'

        },
        {
            xtype: 'textareafield',
            fieldLabel: 'Corpo:',
            id: 'conteudoresposta',
            autoScroll: true,
            allowBlank: false,
            blankText: 'Insira a resposta'

        },
        {
            xtype: 'fileuploadfield',
            name: 'anexo',
            emptyText: 'Select a document to upload...',
            fieldLabel: 'File',
            buttonOnly: true,
            hideLabel: true,
            glyph: 43,
            formBind: true
        }
    ],
    dockedItems: {
        dock: 'bottom',
        xtype: 'toolbar',
        items: [
            {
                text: 'Enviar',
                glyph: 43,
                formBind: true,

                    handler: function(){
                            form_action=1;
                            Ext.getCmp('formenviaresposta').getForm().submit({
                                url: 'app/view/main/tickets/enviarespostas/EnviaMail/mandarmail.php',
                                //waitMsg: 'Enviando...',
                                params: {
                             assuntoresposta: Ext.getCmp('assuntoresposta').getValue(),
                                conteudoresposta: Ext.getCmp('conteudoresposta').getValue()
                        }});
                            Ext.MessageBox.alert('Sucesso','Enviado!');
                            function hide_message() {
                                Ext.defer(function() {
                                    Ext.MessageBox.hide();
                             }, 230);
                        }
                        hide_message();
                }
            }
        ]
    }
});