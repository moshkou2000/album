abstract class ButtonEvent {}

class HomeButtonEvent extends ButtonEvent {
  final String url;

  HomeButtonEvent(this.url);
}
