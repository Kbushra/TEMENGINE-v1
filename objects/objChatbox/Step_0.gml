#region Change Option

if global.lPressed && chatboxMode == 1 { currChoice --; if currChoice < 0 { currChoice = 1; } }
if global.rPressed && chatboxMode == 1 { currChoice ++; if currChoice > 1 { currChoice = 0; } }

#endregion