void main(List<String> args) {
  MessageSender senderController;

  senderController = ViaSMS();
  senderController.Sender();

  senderController = ViaMail();
  senderController.Sender();
}
// ---------------------------------------------------------------------------------------------------
abstract class MessageSender {
  void Sender();
}
// ---------------------------------------------------------------------------------------------------
class ViaSMS implements MessageSender {
  @override
  void Sender() => print('Message Sending via SMS');
}

class ViaMail implements MessageSender {
  @override
  void Sender() => print('Message Sending via Mail');
}
