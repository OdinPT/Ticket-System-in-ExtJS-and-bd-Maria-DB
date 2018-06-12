Ext.define('TrackIT.view.main.MainController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.main',

    onClickButton: function () {
        // Remove the localStorage key/value
        localStorage.removeItem('TrackITLoggedIn');

        // Remove Main View
        this.getView().destroy();

        // Add the Login Window
        Ext.create({
            xtype: 'login'
        });

        Ext.util.Cookies.clear('password');
        Ext.util.Cookies.clear('email');
        Ext.util.Cookies.clear('cookieID');
        Ext.util.Cookies.clear('cookieIDhistorico');
        Ext.util.Cookies.clear('cookieIDanswer');
        Ext.util.Cookies.clear('cookieIDemail');
        Ext.util.Cookies.clear('cookieIDemail');
        Ext.util.Cookies.clear('cookieIDfuncionario');
        Ext.util.Cookies.clear('cookieIDdepartamento');

    }
});
