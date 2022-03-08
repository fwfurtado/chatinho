import 'package:chatinho/adapters/message.dart' as message_adapter;
import 'package:chatinho/domain/message.dart';
import 'package:chatinho/domain/user.dart';
import 'package:chatinho/features/chat/providers/users.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homer = User(
  id: '1s23tnh',
  firstName: 'Homer',
  lastName: 'Simpson',
  avatar:
      'https://www.planoaberto.com.br/wp-content/uploads/2017/07/homer-simpson.jpg',
);
final joaoDasNeves = User(
  id: '67nsth',
  firstName: 'João',
  lastName: 'Neves',
  avatar:
      'https://mixdeseries.com.br/wp-content/uploads/2019/05/Kit-Harington-Jon-Snow.jpg',
);
final darthVader = User(
  id: '90e87u',
  firstName: 'Darth',
  lastName: 'Vader',
  avatar: 'https://avatarfiles.alphacoders.com/226/226040.jpg',
);

DateTime Function([int, bool, DateTime?]) clock([DateTime? start]) {
  var startTime = start ?? DateTime.now();

  return ([d = 0, refresh = false, DateTime? newStart]) {
    if (refresh) {
      startTime = newStart ?? DateTime.now();
    }

    return startTime.add(Duration(minutes: d));
  };
}

final addMin = clock();

final _initialMessages = [
  Message(
    id: '-10',
    text: 'Se liga o que me mandaram pra assinar aqui no trampo',
    sender: darthVader,
    state: MessageState.read,
    type: MessageType.file,
    time: addMin(50, true, DateTime.now().subtract(const Duration(days: 3))),
    metadata: const {
      'filename': 'contrato.pdf',
      'location': 'https://www.craftinginterpreters.com/sample.pdf',
      'size': 323000,
      'mimeType': 'application/pdf',
    },
  ),
  Message(
    id: '-9',
    text: 'O meu ta um pouco diferente',
    sender: eu,
    state: MessageState.read,
    type: MessageType.file,
    time: addMin(10),
    metadata: const {
      'filename': 'outro-contrato.pdf',
      'location': 'https://www.craftinginterpreters.com/sample.pdf',
      'size': 323000,
      'mimeType': 'application/pdf',
    },
  ),
  Message(
    id: '-7',
    text: 'Olha esse carro',
    sender: homer,
    state: MessageState.read,
    type: MessageType.image,
    time: addMin(45),
    metadata: const {
      'filename': 'carro-vermelho.jpg',
      'location':
          'https://motorshow.com.br/wp-content/uploads/sites/2/2020/05/solo-rear-side-view_1575x1050.jpg',
      'size': 168000,
    },
  ),
  Message(
    id: '-6',
    text: 'Prefiro esse',
    sender: eu,
    state: MessageState.read,
    time: addMin(10),
    type: MessageType.image,
    metadata: const {
      'filename': 'outro-carro.jpg',
      'location':
          'https://upload.wikimedia.org/wikipedia/commons/e/ed/BMW_H2R_IAA_2005.jpg',
      'size': 3623000,
    },
  ),
  Message(
    id: '1',
    text: 'Eai...',
    sender: homer,
    state: MessageState.read,
    time: addMin(1, true, DateTime.now()),
  ),
  Message(
    id: '2',
    text: 'Fala ai manow, suave?',
    sender: eu,
    state: MessageState.read,
    time: addMin(2),
  ),
  Message(
    id: '3',
    text: 'O Pai ta on!',
    sender: darthVader,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '4',
    text: 'O que temos pra hoje',
    sender: homer,
    state: MessageState.read,
    time: addMin(2),
  ),
  Message(
    id: '5',
    text: 'O darth tava na maldade',
    sender: joaoDasNeves,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '6',
    text: 'Teu 👌',
    sender: darthVader,
    state: MessageState.read,
    time: addMin(0, true, addMin().add(const Duration(hours: 1, minutes: 23))),
  ),
  Message(
    id: '7',
    text: '😂',
    sender: eu,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '8',
    text: 'Mas eh sério, o que tem pra hoje',
    sender: homer,
    state: MessageState.read,
    time: addMin(2),
  ),
  Message(
    id: '9',
    text: 'A nem sei, hj ta mó frio',
    sender: joaoDasNeves,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '10',
    text: 'Olha quem ta falando de frio... 🥶',
    sender: darthVader,
    state: MessageState.read,
    time: addMin(2),
  ),
  Message(
    id: '12',
    text: 'Partiu tomar umas',
    sender: eu,
    state: MessageState.read,
    time: addMin(1),
  ),
  Message(
    id: '13',
    text: 'Ai c machuca o papai',
    sender: homer,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '14',
    text: 'Ahh cala a boca',
    sender: darthVader,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '15',
    text: 'Esse mano ta muito do mal hoje hein! 😈😈😈😈',
    sender: joaoDasNeves,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '16',
    text: 'Bora tomar uma no 20tão? se liga na promo https://vivisaude.com',
    sender: homer,
    state: MessageState.read,
    time: addMin(2, true, addMin().add(const Duration(hours: 1, minutes: 23))),
  ),
  Message(
      id: '17', text: 'Afz....', sender: darthVader, state: MessageState.read),
  Message(
    id: '18',
    text: 'Demorou bora!',
    sender: darthVader,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '19',
    text: 'Vou me trocar e ir ',
    sender: joaoDasNeves,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '20',
    text: 'Vou comer algo rapidão e vou',
    sender: homer,
    state: MessageState.read,
    time: addMin(),
  ),
  Message(
    id: '21',
    text: 'Ve se num demora hein',
    sender: eu,
    state: MessageState.error,
    time: addMin(),
  ),
  Message(
    id: '22',
    text: 'Minhas mensagens não estão indo',
    sender: eu,
    state: MessageState.sending,
    time: addMin(),
  ),
  Message(
    id: '23',
    text: 'Minhas mensagens não estão indo',
    sender: eu,
    state: MessageState.sent,
    time: addMin(),
  ),
  Message(
    id: '24',
    text: 'Minhas mensagens não estão indo',
    sender: eu,
    state: MessageState.delivered,
    time: addMin(),
  ),
].reversed.toList();

class MessagesNotifier extends StateNotifier<List<Message>> {
  MessagesNotifier() : super(_initialMessages);

  void add(Message message) {
    state = [...state, message];
  }

  transition(String messageID, MessageState messageState) {
    state = [
      for (final message in state)
        if (message.id == messageID)
          message.copyWith(state: messageState)
        else
          message,
    ];
  }
}

final messagesProvider = StateNotifierProvider<MessagesNotifier, List<Message>>(
    (_) => MessagesNotifier());

final messageUIProvider = Provider((ref) {
  final rawMessages = ref.watch(messagesProvider);

  return rawMessages.expand(message_adapter.fromDomain).toList();
});
