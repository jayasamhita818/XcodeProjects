import SwiftUI

struct MessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .padding(.horizontal, 5)
            .foregroundColor(Color.black)
            .background(Color(UIColor.systemGray5 ))
            .cornerRadius(20)
    }
}

#Preview {
    MessageCell(contentMessage: "This is a single message cell.", isCurrentUser: false)
}
