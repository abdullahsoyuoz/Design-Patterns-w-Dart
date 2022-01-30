void main(List<String> args) {
  var musicPlayer = MusicPlayer();

  var playState = Play();
  playState.Action(musicPlayer);

  var pauseState = Pause();
  pauseState.Action(musicPlayer);
}

class MusicPlayer {
  IState state;
  void setState(IState state) => this.state = state;
}

abstract class IState {
  void Action(MusicPlayer player);
}

class Play extends IState {
  @override
  void Action(MusicPlayer player) {
    player.setState(this);
    print('Music Player is playing');
  }
}

class Pause extends IState {
  @override
  void Action(MusicPlayer player) {
    player.setState(this);
    print('Music Player is paused');
  }
}
