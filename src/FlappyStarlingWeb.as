package
{
    {
    import openfl.display.Sprite;

    import starling.core.Starling;
    import starling.events.Event;
    import starling.assets.AssetManager;
    

    
    public class FlappyStarlingWeb extends Sprite
    {
        private var _starling:Starling;

        public function FlappyStarlingWeb()
        {
            _starling = new Starling(Game, stage);
            _starling.addEventListener(Event.ROOT_CREATED, function():void
            {
                loadAssets(startGame);
            });
            _starling.start();
        }

        private function loadAssets(onComplete:Function):void
        {
            var assets:AssetManager = new AssetManager();

            assets.enqueue([
                "assets/textures/1x/atlas.png",
                "assets/textures/1x/atlas.xml",
                "assets/fonts/1x/bradybunch.png",
                "assets/fonts/1x/bradybunch.fnt",
                "assets/sounds/crash.mp3",
                "assets/sounds/flap.mp3",
                "assets/sounds/pass.mp3"
]           );
            assets.loadQueue(onComplete);
            }

        private function startGame(assets:AssetManager):void
        {
            var game:Game = _starling.root as Game;
            game.start(assets)
        }
    }
}
}