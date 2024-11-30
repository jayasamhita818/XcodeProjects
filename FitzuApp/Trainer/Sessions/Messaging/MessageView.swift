import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isCurrentUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                MessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
                Spacer()
            } else {
                Spacer()
                MessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            }
           
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}


#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: true))
}
