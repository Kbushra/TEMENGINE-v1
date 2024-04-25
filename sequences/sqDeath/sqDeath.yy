{
  "$GMSequence":"",
  "%Name":"sqDeath",
  "autoRecord":true,
  "backdropHeight":480,
  "backdropImageOpacity":0.5,
  "backdropImagePath":"",
  "backdropWidth":640,
  "backdropXOffset":0.0,
  "backdropYOffset":0.0,
  "events":{
    "$KeyframeStore<MessageEventKeyframe>":"",
    "Keyframes":[],
    "resourceType":"KeyframeStore<MessageEventKeyframe>",
    "resourceVersion":"2.0",
  },
  "eventStubScript":null,
  "eventToFunction":{},
  "length":80.0,
  "lockOrigin":false,
  "moments":{
    "$KeyframeStore<MomentsEventKeyframe>":"",
    "Keyframes":[],
    "resourceType":"KeyframeStore<MomentsEventKeyframe>",
    "resourceVersion":"2.0",
  },
  "name":"sqDeath",
  "parent":{
    "name":"Sequences",
    "path":"folders/Sequences.yy",
  },
  "playback":0,
  "playbackSpeed":40.0,
  "playbackSpeedType":0,
  "resourceType":"GMSequence",
  "resourceVersion":"2.0",
  "showBackdrop":true,
  "showBackdropImage":false,
  "spriteId":null,
  "timeUnits":1,
  "tracks":[
    {"$GMGraphicTrack":"","%Name":"sprSoulHalfs","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<AssetSpriteKeyframe>":"","Keyframes":[
          {"$Keyframe<AssetSpriteKeyframe>":"","Channels":{
              "0":{"$AssetSpriteKeyframe":"","Id":{"name":"sprSoulHalfs","path":"sprites/sprSoulHalfs/sprSoulHalfs.yy",},"resourceType":"AssetSpriteKeyframe","resourceVersion":"2.0",},
            },"Disabled":false,"id":"064be502-bc48-4639-a33d-619ce6c634c2","IsCreationKey":false,"Key":30.0,"Length":50.0,"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"2.0","Stretch":false,},
        ],"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"sprSoulHalfs","resourceType":"GMGraphicTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[
        {"$GMColourTrack":"","%Name":"blend_multiply","builtinName":10,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<ColourKeyframe>":"","Keyframes":[
              {"$Keyframe<ColourKeyframe>":"","Channels":{
                  "0":{"$ColourKeyframe":"","AnimCurveId":null,"Colour":0,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Colour Multiply","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"alpha","colour":4294967295,"name":"alpha","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.625,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"red","colour":4278190335,"name":"red","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                        {"$GMAnimCurveChannel":"","%Name":"green","colour":4278255360,"name":"green","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                        {"$GMAnimCurveChannel":"","%Name":"blue","colour":4294901760,"name":"blue","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                      ],"function":0,"name":"Colour Multiply","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"resourceType":"ColourKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"0ba3d944-d1d3-4e82-a52a-f3d8d7aaee53","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<ColourKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"blend_multiply","resourceType":"GMColourTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"image_index","builtinName":18,"events":[],"inheritsTrackColour":true,"interpolation":0,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"947ba6e8-d3f1-40f1-9404-dc7eec9c718b","IsCreationKey":false,"Key":30.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"image_index","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"54c0ad3c-871e-42a5-ba53-dc7723657a68","IsCreationKey":true,"Key":30.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"origin","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Position","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"x","colour":4290799884,"name":"x","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":8.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":8.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":9.0,},
                            {"th0":-0.012499455,"th1":0.24934089,"tv0":-0.070043415,"tv1":1.3972359,"x":0.625,"y":9.0,},
                            {"th0":0.0,"th1":0.0,"tv0":-3.012497,"tv1":0.0,"x":1.0,"y":160.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"y","colour":4281083598,"name":"y","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":0.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.012499798,"th1":0.25245845,"tv0":-0.06969565,"tv1":1.4076433,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":-0.12571716,"tv1":0.0,"x":1.0,"y":207.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                      ],"function":2,"name":"Position","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Position","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"x","colour":4290799884,"name":"x","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":8.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":8.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":9.0,},
                            {"th0":-0.012499455,"th1":0.24934089,"tv0":-0.070043415,"tv1":1.3972359,"x":0.625,"y":9.0,},
                            {"th0":0.0,"th1":0.0,"tv0":-3.012497,"tv1":0.0,"x":1.0,"y":160.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"y","colour":4281083598,"name":"y","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":0.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.012499798,"th1":0.25245845,"tv0":-0.06969565,"tv1":1.4076433,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":-0.12571716,"tv1":0.0,"x":1.0,"y":207.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                      ],"function":2,"name":"Position","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"b7dd665e-b21b-44ad-b7b2-53ea46f5b24c","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"position","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Rotation","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"angle","colour":4290799884,"name":"angle","points":[
                            {"th0":0.0,"th1":0.125,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.125,"th1":0.18742597,"tv0":-0.0,"tv1":0.0,"x":0.625,"y":0.0,},
                            {"th0":-0.18446743,"th1":0.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":-120.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                      ],"function":2,"name":"Rotation","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"4e817e5b-aceb-4ba5-a7e9-2eb53b94cff2","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"rotation","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"20c77a07-ff8f-4458-b718-edb7638daaa8","IsCreationKey":true,"Key":30.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"scale","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4294103368,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"$GMGraphicTrack":"","%Name":"sprSoulHalfs","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<AssetSpriteKeyframe>":"","Keyframes":[
          {"$Keyframe<AssetSpriteKeyframe>":"","Channels":{
              "0":{"$AssetSpriteKeyframe":"","Id":{"name":"sprSoulHalfs","path":"sprites/sprSoulHalfs/sprSoulHalfs.yy",},"resourceType":"AssetSpriteKeyframe","resourceVersion":"2.0",},
            },"Disabled":false,"id":"19e33422-63c1-40dc-9230-fcd5f5910bdd","IsCreationKey":false,"Key":30.0,"Length":50.0,"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"2.0","Stretch":false,},
        ],"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"sprSoulHalfs","resourceType":"GMGraphicTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[
        {"$GMColourTrack":"","%Name":"blend_multiply","builtinName":10,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<ColourKeyframe>":"","Keyframes":[
              {"$Keyframe<ColourKeyframe>":"","Channels":{
                  "0":{"$ColourKeyframe":"","AnimCurveId":null,"Colour":0,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Colour Multiply","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"alpha","colour":4294967295,"name":"alpha","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.625,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":0.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"red","colour":4278190335,"name":"red","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                        {"$GMAnimCurveChannel":"","%Name":"green","colour":4278255360,"name":"green","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                        {"$GMAnimCurveChannel":"","%Name":"blue","colour":4294901760,"name":"blue","points":[
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":0.0,"y":255.0,},
                            {"th0":1.0,"th1":-1.0,"tv0":0.0,"tv1":0.0,"x":1.0,"y":255.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                      ],"function":0,"name":"Colour Multiply","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"resourceType":"ColourKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"2b5661f1-375b-4d9b-8154-80c869cf3b9a","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<ColourKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<ColourKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"blend_multiply","resourceType":"GMColourTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"image_index","builtinName":18,"events":[],"inheritsTrackColour":true,"interpolation":0,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"c2e01e57-3619-42e3-9e98-5019822193a2","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"image_index","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"4dbdec46-8519-4bb9-9954-c841f7e478f3","IsCreationKey":true,"Key":30.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"origin","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Position","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"x","colour":4290799884,"name":"x","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":1.0000001,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.012499814,"th1":0.24791986,"tv0":0.013930438,"tv1":-0.2762947,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":2.3945618,"tv1":0.0,"x":1.0,"y":-160.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"y","colour":4281083598,"name":"y","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":0.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.025,"th1":0.01197952,"tv0":0.0,"tv1":0.0,"x":0.5625,"y":0.0,},
                            {"th0":-0.013877511,"th1":0.00061768293,"tv0":-9.675564E-09,"tv1":4.058308E-10,"x":0.62329805,"y":-1.3651904E-09,},
                            {"th0":-0.00052046776,"th1":0.2479198,"tv0":-5.005201E-10,"tv1":2.3841858E-07,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":2.8864136,"tv1":0.0,"x":1.0,"y":207.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                      ],"function":2,"name":"Position","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Position","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"x","colour":4290799884,"name":"x","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":1.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":1.0000001,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.012499814,"th1":0.24791986,"tv0":0.013930438,"tv1":-0.2762947,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":2.3945618,"tv1":0.0,"x":1.0,"y":-160.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                        {"$GMAnimCurveChannel":"","%Name":"y","colour":4281083598,"name":"y","points":[
                            {"th0":0.0,"th1":0.075,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.075,"th1":0.0125,"tv0":0.0,"tv1":0.0,"x":0.375,"y":0.0,},
                            {"th0":-0.0125,"th1":0.025,"tv0":0.0,"tv1":0.0,"x":0.4375,"y":0.0,},
                            {"th0":-0.025,"th1":0.01197952,"tv0":0.0,"tv1":0.0,"x":0.5625,"y":0.0,},
                            {"th0":-0.013877511,"th1":0.00061768293,"tv0":-9.675564E-09,"tv1":4.058308E-10,"x":0.62329805,"y":-1.3651904E-09,},
                            {"th0":-0.00052046776,"th1":0.2479198,"tv0":-5.005201E-10,"tv1":2.3841858E-07,"x":0.625,"y":0.0,},
                            {"th0":0.0,"th1":0.0,"tv0":2.8864136,"tv1":0.0,"x":1.0,"y":207.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":false,},
                      ],"function":2,"name":"Position","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"f95625a9-542f-4734-a569-a01cae440eb2","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"position","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":{"$GMAnimCurve":"","%Name":"Rotation","channels":[
                        {"$GMAnimCurveChannel":"","%Name":"angle","colour":4290799884,"name":"angle","points":[
                            {"th0":0.0,"th1":0.125,"tv0":0.0,"tv1":0.0,"x":0.0,"y":0.0,},
                            {"th0":-0.125,"th1":0.18997729,"tv0":-0.0,"tv1":0.0,"x":0.625,"y":0.0,},
                            {"th0":-0.1884644,"th1":0.0,"tv0":-0.6486511,"tv1":0.0,"x":1.0,"y":120.0,},
                          ],"resourceType":"GMAnimCurveChannel","resourceVersion":"2.0","visible":true,},
                      ],"function":2,"name":"Rotation","resourceType":"GMAnimCurve","resourceVersion":"2.0",},"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"bb3ce87e-ac0c-4a16-bd98-03fa05638283","IsCreationKey":false,"Key":0.0,"Length":80.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"rotation","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"d72d2472-ee56-4637-9c66-45f6ecb72f51","IsCreationKey":true,"Key":30.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"scale","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4288628978,"tracks":[],"traits":0,},
      ],"traits":0,},
    {"$GMGraphicTrack":"","%Name":"sprSoul","builtinName":0,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<AssetSpriteKeyframe>":"","Keyframes":[
          {"$Keyframe<AssetSpriteKeyframe>":"","Channels":{
              "0":{"$AssetSpriteKeyframe":"","Id":{"name":"sprSoul","path":"sprites/sprSoul/sprSoul.yy",},"resourceType":"AssetSpriteKeyframe","resourceVersion":"2.0",},
            },"Disabled":false,"id":"0ff87749-737a-4d56-acd8-ce66acdca595","IsCreationKey":false,"Key":0.0,"Length":30.0,"resourceType":"Keyframe<AssetSpriteKeyframe>","resourceVersion":"2.0","Stretch":false,},
        ],"resourceType":"KeyframeStore<AssetSpriteKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"sprSoul","resourceType":"GMGraphicTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[
        {"$GMRealTrack":"","%Name":"image_speed","builtinName":17,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":false,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"e1baadd2-74b9-40e5-9cc3-40da519c2f5d","IsCreationKey":false,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"image_speed","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"origin","builtinName":16,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"fc308f54-b161-4b0c-bd32-962dcf81b7c9","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"origin","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"position","builtinName":14,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"55418b66-104f-4533-9bd2-6b6940965044","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"position","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"rotation","builtinName":8,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":0.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"4e528671-c6e0-4388-81f0-08a93faf7a3d","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"rotation","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[],"traits":0,},
        {"$GMRealTrack":"","%Name":"scale","builtinName":15,"events":[],"inheritsTrackColour":true,"interpolation":1,"isCreationTrack":true,"keyframes":{"$KeyframeStore<RealKeyframe>":"","Keyframes":[
              {"$Keyframe<RealKeyframe>":"","Channels":{
                  "0":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                  "1":{"$RealKeyframe":"","AnimCurveId":null,"EmbeddedAnimCurve":null,"RealValue":1.0,"resourceType":"RealKeyframe","resourceVersion":"2.0",},
                },"Disabled":false,"id":"5f704b23-04b9-4e24-93eb-99f625599501","IsCreationKey":true,"Key":0.0,"Length":1.0,"resourceType":"Keyframe<RealKeyframe>","resourceVersion":"2.0","Stretch":false,},
            ],"resourceType":"KeyframeStore<RealKeyframe>","resourceVersion":"2.0",},"modifiers":[],"name":"scale","resourceType":"GMRealTrack","resourceVersion":"2.0","trackColour":4282970714,"tracks":[],"traits":0,},
      ],"traits":0,},
  ],
  "visibleRange":null,
  "volume":1.0,
  "xorigin":0,
  "yorigin":0,
}