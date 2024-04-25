global.cutscene = id;

memo = false;
chatboxPos = 1;
writerIndependent = false;

chatbox = instance_create_layer(0, 0, "Chatbox", objChatbox);
chatbox.chatboxOrigin = id;
chatbox.textToDraw = "* This is an useless room...";