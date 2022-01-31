// ignore_for_file: unused_local_variable
import 'dart:io';
void main(List<String> args) {
  var musicPlayer = MusicPlayer();
  // Playing after it was MusicPlayer Constructed.
  sleep(Duration(milliseconds: 500));
  var pauseState = Pause(musicPlayer); // Changing state
}

// ---------------------------------------------------------------------------------------------------
class MusicPlayer {
  IState state;
  MusicPlayer() {
    this.state = Play(this);
  }
  void setState(IState state) => this.state = state;
  void action() => this.state.Action(this);
}

// ---------------------------------------------------------------------------------------------------
abstract class IState {
  void Action(MusicPlayer player);
}

class Play extends IState {
  MusicPlayer instance;
  Play(this.instance) {
    this.Action(this.instance);
  }
  @override
  void Action(MusicPlayer player) {
    player.setState(this);
    // player playing operations..
    print('Music Player is playing');
  }
}

class Pause extends IState {
  MusicPlayer instance;
  Pause(this.instance) {
    this.Action(this.instance);
  }
  @override
  void Action(MusicPlayer player) {
    player.setState(this);
    // player pause operations..
    print('Music Player is paused');
  }
}
