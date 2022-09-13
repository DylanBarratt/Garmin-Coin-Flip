using Toybox.Lang;
using Toybox.WatchUi;

using Toybox.Math;

class CoinFlipAppDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent) {
        // Start button is pressed
        if (keyEvent.getKey().equals(4)) {
            Application.Storage.setValue("flipResult", coinFlip());
            WatchUi.requestUpdate();
        } if (keyEvent.getKey().equals(5)) {
            System.exit();
        }
        return true;
    }

    function coinFlip() {
        if ((Math.rand() % 2).equals(0)) {
            return "Heads";
        } else {
            return "Tails";
        }
    }

    // Used to test randomness
    // Doesn't seem particularly weighted in either outcome but is not completely random
    // function coinFlipTest() {
    //     var tailsCount = 0;
    //     var headsCount = 0;

    //     for (var i = 0; i < 100; i++) {
    //         if (coinFlip().equals("Heads")) {
    //             headsCount++;
    //         } else {
    //             tailsCount++;
    //         }
    //     }

    //     System.println("Heads: " + headsCount + " Tails: " + tailsCount);
    // }


}