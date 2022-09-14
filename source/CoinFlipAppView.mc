using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Attention;

class CoinFlipAppView extends WatchUi.View {

    hidden var startText;
    hidden var headsText;
    hidden var tailsText;

    function initialize() {
        View.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        startText = new WatchUi.Text({
            :text=>"Press start \n for your fate!",
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_MEDIUM,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });
        startText.setJustification(Graphics.TEXT_JUSTIFY_CENTER);

        headsText = new WatchUi.Text({
            :text=>"HEADS",
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });
        headsText.setJustification(Graphics.TEXT_JUSTIFY_CENTER);

        tailsText = new WatchUi.Text({
            :text=>"TAILS",
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });
        tailsText.setJustification(Graphics.TEXT_JUSTIFY_CENTER);

        Application.Storage.setValue("flipResult", "null");
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        startText.draw(dc);

        if (Application.Storage.getValue("flipResult").equals("Heads")) {
            vibrateFunc();
            dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
            dc.clear();

            dc.fillCircle(dc.getWidth() / 2, dc.getHeight() / 2, 75);
            headsText.draw(dc);
        } else if (Application.Storage.getValue("flipResult").equals("Tails")) {
            vibrateFunc();
            dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_BLACK);
            dc.clear();

            dc.fillCircle(dc.getWidth() / 2, dc.getHeight() / 2, 75);
            tailsText.draw(dc);
        }
    }

    function vibrateFunc() {
        var vibeData =
            [
                new Attention.VibeProfile(100, 100),
            ];
        Attention.vibrate(vibeData);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        Application.Storage.clearValues();
    }
}

