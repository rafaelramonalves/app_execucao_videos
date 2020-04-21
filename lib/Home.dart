import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///Carregar video apartir de uma URL
    /*
      _controller = VideoPlayerController.network(
        "https://r3---sn-bg07dnss.googlevideo.com/videoplayback?expire=1587514959&ei=7jmfXrbMPIjjyAXYjY2QCQ&ip=77.65.13.85&id=o-AM3xJ8E9fcQL3oJOGguu1FrPzTN6C-CmKSkwjZac2Cyo&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=438188&ratebypass=yes&dur=5.363&lmt=1574177188783811&fvip=3&c=WEB&txp=1311222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJpPlLswRgIhALh-YK0AAzTWfTITCDofPpl3Nvdf_jmjLowV6W2hDkUnAiEA_B4EYym3QrKf-Kz8MBcCwcuX9iTAEYllI2FslIffBMc%3D&video_id=EngW7tLk6R8&title=Sample+Videos+-+Dummy+Videos+For+Demo+Use&rm=sn-pj2-2v1e7s,sn-f5fe77s&req_id=c444201f1b99a3ee&redirect_counter=2&cms_redirect=yes&ipbypass=yes&mh=aU&mip=189.72.242.59&mm=29&mn=sn-bg07dnss&ms=rdu&mt=1587493296&mv=m&mvi=2&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRAIgf8npon6Z3LPIxY5u-qJp207o6B6fIn2tZiCZ-VR73fwCIGUcsE1rV3KjnwXn8b35Pdil1sOB5u7Xduiv_pWz5NRT"
      )..initialize().then(( _ ){ //Utilizando dois .. o retorno no initialize ( que é void)
        // é desconsiderado e é capturado apenas o retorno de videoPlayController

        //O " _ " passa o parâmetro vazio, sem criar espaço de memoria

        setState(() { //Set state para garantir a atualização do primeiro frame do video
          _controller.play();
        });

      });
    */

    _controller = VideoPlayerController.asset("videos/videoplayback.mp4")
      ..setLooping(
          true) //Utilizando dois .. o retorno no initialize ( que é void)
      // é desconsiderado e é capturado apenas o retorno de videoPlayController
      ..initialize().then((_) {
        //_controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized //ternario
            ? AspectRatio(
                //Define o tamanho do player do video
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Text("Pressione o play"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_circle_outline
        ),
        onPressed: (){
          setState(() {
            _controller.value.isPlaying ? _controller.pause() : _controller.play();
          });
        },
      ),
    );
  }
}
