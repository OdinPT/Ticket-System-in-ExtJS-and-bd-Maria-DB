/**
 * This class is the controller for the main view for the application. It is specified as
 * the "controller" of the Main view class.
 *
 * TODO - Replace this content of this view to suite the needs of your application.
 */
Ext.define('TrackIT.view.main.MainController', {
    extend: 'Ext.app.ViewController',

    alias: 'controller.main',

    onItemSelected: function (sender, record) {
        Ext.Msg.confirm('Confirm', 'Are you sure?', 'onConfirm', this);
    },

    onConfirm: function (choice) {
        if (choice === 'yes') {
            //
        }
    },
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

    }
});
