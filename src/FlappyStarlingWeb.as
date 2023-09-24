package
{
    import openfl.utils.Assets;
    import openfl.display.Sprite;
    import starling.assets.AssetManager;
    import starling.core.Starling;
    import starling.events.Event;

    
    public class FlappyStarlingWeb extends Sprite
    {
        private var _starling:Starling;

        public function FlappyStarlingWeb()
        {
            _starling = new Starling(Game, stage);
            _starling.addEventListener(Event.ROOT_CREATED, onRootCreated);
            _starling.start();
        }

        private function onRootCreated(event:Event, game:Game):void
        {
            var _assets:AssetManager = new AssetManager();
            _assets.enqueue([
                Assets.getPath("assets/textures/1x/atlas.xml"),
                Assets.getPath("assets/textures/1x/atlas.png"),
                Assets.getPath("assets/fonts/1x/bradybunch.fnt"),
                Assets.getPath("assets/fonts/1x/bradybunch.png"),
                Assets.getPath("assets/sounds/flap.mp3"),
                Assets.getPath("assets/sounds/pass.mp3"),
                Assets.getPath("assets/sounds/crash.mp3")
                ]);
            _assets.loadQueue(
                function onComplete():void
                {
                    game.start(_assets);
                },
                function onError(error:String):void
                {
                    trace("Error while loading assets: " + error);
                });
        }
    }
}
