/**
 * The main application class. An instance of this class is created by app.js when it
 * calls Ext.application(). This is the ideal place to handle application launch and
 * initialization details.
 */
Ext.define('TrackIT.Application', {
    extend: 'Ext.app.Application',

    name: 'TrackIT',

    stores: [

        'TrackIT.store.respostas.RespostaSeleccionadaHistorico',
        'TrackIT.store.respostas.RespostaSeleccionada',
        'TrackIT.store.respostas.RespostasHistorico',
        'TrackIT.store.respostas.Respostas',
        'TrackIT.store.tickets.CarregaInfoTicket',
        'TrackIT.store.tickets.CarregaInfoPrincipalTicket',
        'TrackIT.store.historico.CarregaInfoHistoricoTicket',
        'TrackIT.store.historico.CarregaInfoHistorico',
        'TrackIT.store.admin.FuncionarioSeleccionado',
        'TrackIT.store.admin.Funcionarios',
        'TrackIT.store.anexos.Anexos',
        'TrackIT.store.admin.DepartamentoSeleccionado',
        'TrackIT.store.TipoDepartamento.TipoD',
        'TrackIT.store.TipoDepartamentoMD.TipoDepartamentoMD',
        'TrackIT.store.funcionario.FuncionariosDep',
        'TrackIT.store.HistoricoComentarios.Comentario',
        'TrackIT.store.HistoricoComentariosHistorico.Comentario',
        'TrackIT.store.HistoricoAtribuicoes.atribuicoesticket',
        'TrackIT.store.HistoricoComentarios.ComentarioSeleccionado'
    ],
    views: [
      'TrackIT.view.login.Login',
        'TrackIT.view.main.Main'
    ],
    launch: function () {
      var loggedIn;

      // Check to see the current value of the localStorage key
      loggedIn = localStorage.getItem("TrackITLoggedIn");

      // This ternary operator determines the value of the TutorialLoggedIn key.
      // If TutorialLoggedIn isn't true, we display the login window,
      // otherwise, we display the main view
      Ext.create({
          xtype: loggedIn ? 'app-main' : 'login'
      });
    },

    onAppUpdate: function () {
        Ext.Msg.confirm('Application Update', 'This application has an update, reload?',
            function (choice) {
                if (choice === 'yes') {
                    window.location.reload();
                }
            }
        );
    }
});
