
# Feature Enhancements

- [x] **Paste**: Paste text/images from the clipboard into the chat input, this is a common operation for desktop environments. see [attachments_action_bar.dart](lib/src/views/chat_input/attachments_action_bar.dart)

- [x] **Share Handler**: Handle sharing text/images from other apps to the chat input, this is a common operation for mobile environments. see [chat_input.dart](lib/src/views/chat_input/chat_input.dart)

- [x] **Image Compression**: Compress images before sending them to the LLM server, the camera in mobile devices takes high-quality images, which may be too large to send over the network, some high DPI screen copy/paste operations may also result in large images. we compress the images to a reasonable size before sending them to the server. see [attachments.dart](lib/src/providers/interface/attachments.dart)

- [x] **LLM Chat View Width**: default chat view width is take about 75% of the screen width, it may not be suitable for all devices, we can change the width of the chat view by changing the `llmMessageWidthPercent` property in the `LlmChatViewStyle`. see [llm_chat_view_style.dart](lib/src/styles/llm_chat_view_style.dart)

- [x] **Enable Latex Rendering**: Enable rendering latex math equations in the chat view, this is useful for technical discussions. see [llm_message_view.dart](lib/src/views/chat_message_view/llm_message_view.dart)