import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';

import '../../data/datasources/remote_chat_datasource.dart';
import '../../data/datasources/local_chat_datasource.dart';
import '../../data/repositories/chat_repository_impl.dart';
import '../../core/connectivity/connectivity_service.dart';

class ChatScreen extends StatefulWidget {
  final String sender;
  final String receiver;

  const ChatScreen(this.sender, this.receiver, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 🔥 SAFE because BlocProvider is ABOVE this widget
    context.read<ChatBloc>().add(ListenMessagesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatBloc, ChatState>(
                builder: (_, state) {
                  if (state is ChatLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        final isMe = message.senderId == widget.sender;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisAlignment: isMe
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // 🔹 RECEIVER AVATAR (LEFT)
                              if (!isMe)
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.grey.shade400,
                                  child: const Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),

                              if (!isMe) const SizedBox(width: 6),

                              // 🔹 MESSAGE BUBBLE
                              Container(
                                padding: const EdgeInsets.all(10),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.65,
                                ),
                                decoration: BoxDecoration(
                                  color: isMe
                                      ? Colors.blueAccent
                                      : Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      message.text,
                                      style: TextStyle(
                                        color:
                                            isMe ? Colors.white : Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),

                                    // 🔹 STATUS ROW (ICON + TEXT)
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          message.isPending
                                              ? Icons.access_time
                                              : Icons.check,
                                          size: 12,
                                          color: isMe
                                              ? Colors.white70
                                              : Colors.black54,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          message.isPending
                                              ? "Pending"
                                              : "Sent",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: isMe
                                                ? Colors.white70
                                                : Colors.black54,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              if (isMe) const SizedBox(width: 6),

                              // 🔹 SENDER AVATAR (RIGHT)
                              if (isMe)
                                CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.blueAccent,
                                  child: const Icon(
                                    Icons.person,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey.shade100,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        context
                            .read<ChatBloc>()
                            .add(SendMessage(controller.text.trim()));
                        controller.clear();
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
